// Copyright (c) 2012 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#include "chrome/browser/chromeos/drive/drive_integration_service.h"

#include "base/bind.h"
#include "base/file_util.h"
#include "base/prefs/pref_change_registrar.h"
#include "base/prefs/pref_service.h"
#include "base/strings/stringprintf.h"
#include "base/threading/sequenced_worker_pool.h"
#include "chrome/browser/browser_process.h"
#include "chrome/browser/chrome_notification_types.h"
#include "chrome/browser/chromeos/drive/debug_info_collector.h"
#include "chrome/browser/chromeos/drive/download_handler.h"
#include "chrome/browser/chromeos/drive/file_cache.h"
#include "chrome/browser/chromeos/drive/file_system.h"
#include "chrome/browser/chromeos/drive/file_system_util.h"
#include "chrome/browser/chromeos/drive/job_scheduler.h"
#include "chrome/browser/chromeos/drive/resource_metadata.h"
#include "chrome/browser/chromeos/drive/resource_metadata_storage.h"
#include "chrome/browser/chromeos/file_manager/path_util.h"
#include "chrome/browser/chromeos/profiles/profile_util.h"
#include "chrome/browser/download/download_prefs.h"
#include "chrome/browser/download/download_service.h"
#include "chrome/browser/download/download_service_factory.h"
#include "chrome/browser/drive/drive_api_service.h"
#include "chrome/browser/drive/drive_api_util.h"
#include "chrome/browser/drive/drive_app_registry.h"
#include "chrome/browser/drive/drive_notification_manager.h"
#include "chrome/browser/drive/drive_notification_manager_factory.h"
#include "chrome/browser/drive/event_logger.h"
#include "chrome/browser/profiles/incognito_helpers.h"
#include "chrome/browser/profiles/profile.h"
#include "chrome/browser/signin/profile_oauth2_token_service_factory.h"
#include "chrome/browser/signin/signin_manager_factory.h"
#include "chrome/common/chrome_version_info.h"
#include "chrome/common/pref_names.h"
#include "components/keyed_service/content/browser_context_dependency_manager.h"
#include "components/signin/core/browser/profile_oauth2_token_service.h"
#include "components/signin/core/browser/signin_manager.h"
#include "content/public/browser/browser_context.h"
#include "content/public/browser/browser_thread.h"
#include "content/public/browser/notification_service.h"
#include "content/public/common/user_agent.h"
#include "google_apis/drive/auth_service.h"
#include "google_apis/drive/gdata_wapi_url_generator.h"
#include "grit/generated_resources.h"
#include "ui/base/l10n/l10n_util.h"
#include "webkit/browser/fileapi/external_mount_points.h"

using content::BrowserContext;
using content::BrowserThread;

namespace drive {
namespace {

// Name of the directory used to store metadata.
const base::FilePath::CharType kMetadataDirectory[] = FILE_PATH_LITERAL("meta");

// Name of the directory used to store cached files.
const base::FilePath::CharType kCacheFileDirectory[] =
    FILE_PATH_LITERAL("files");

// Name of the directory used to store temporary files.
const base::FilePath::CharType kTemporaryFileDirectory[] =
    FILE_PATH_LITERAL("tmp");

// Returns a user agent string used for communicating with the Drive backend,
// both WAPI and Drive API.  The user agent looks like:
//
// chromedrive-<VERSION> chrome-cc/none (<OS_CPU_INFO>)
// chromedrive-24.0.1274.0 chrome-cc/none (CrOS x86_64 0.4.0)
//
// TODO(satorux): Move this function to somewhere else: crbug.com/151605
std::string GetDriveUserAgent() {
  const char kDriveClientName[] = "chromedrive";

  chrome::VersionInfo version_info;
  const std::string version = (version_info.is_valid() ?
                               version_info.Version() :
                               std::string("unknown"));

  // This part is <client_name>/<version>.
  const char kLibraryInfo[] = "chrome-cc/none";

  const std::string os_cpu_info = content::BuildOSCpuInfo();

  // Add "gzip" to receive compressed data from the server.
  // (see https://developers.google.com/drive/performance)
  return base::StringPrintf("%s-%s %s (%s) (gzip)",
                            kDriveClientName,
                            version.c_str(),
                            kLibraryInfo,
                            os_cpu_info.c_str());
}

// Initializes FileCache and ResourceMetadata.
// Must be run on the same task runner used by |cache| and |resource_metadata|.
FileError InitializeMetadata(
    const base::FilePath& cache_root_directory,
    internal::ResourceMetadataStorage* metadata_storage,
    internal::FileCache* cache,
    internal::ResourceMetadata* resource_metadata,
    const ResourceIdCanonicalizer& id_canonicalizer,
    const base::FilePath& downloads_directory) {
  // Files in temporary directory need not persist across sessions. Clean up
  // the directory content while initialization.
  base::DeleteFile(cache_root_directory.Append(kTemporaryFileDirectory),
                   true);  // recursive
  if (!base::CreateDirectory(cache_root_directory.Append(
          kMetadataDirectory)) ||
      !base::CreateDirectory(cache_root_directory.Append(
          kCacheFileDirectory)) ||
      !base::CreateDirectory(cache_root_directory.Append(
          kTemporaryFileDirectory))) {
    LOG(WARNING) << "Failed to create directories.";
    return FILE_ERROR_FAILED;
  }

  // Change permissions of cache file directory to u+rwx,og+x (711) in order to
  // allow archive files in that directory to be mounted by cros-disks.
  base::SetPosixFilePermissions(
      cache_root_directory.Append(kCacheFileDirectory),
      base::FILE_PERMISSION_USER_MASK |
      base::FILE_PERMISSION_EXECUTE_BY_GROUP |
      base::FILE_PERMISSION_EXECUTE_BY_OTHERS);

  internal::ResourceMetadataStorage::UpgradeOldDB(
      metadata_storage->directory_path(), id_canonicalizer);

  if (!metadata_storage->Initialize()) {
    LOG(WARNING) << "Failed to initialize the metadata storage.";
    return FILE_ERROR_FAILED;
  }

  if (!cache->Initialize()) {
    LOG(WARNING) << "Failed to initialize the cache.";
    return FILE_ERROR_FAILED;
  }

  if (metadata_storage->cache_file_scan_is_needed()) {
    // Generate unique directory name.
    const std::string& dest_directory_name = l10n_util::GetStringUTF8(
        IDS_FILE_BROWSER_RECOVERED_FILES_FROM_GOOGLE_DRIVE_DIRECTORY_NAME);
    base::FilePath dest_directory = downloads_directory.Append(
        base::FilePath::FromUTF8Unsafe(dest_directory_name));
    for (int uniquifier = 1; base::PathExists(dest_directory); ++uniquifier) {
      dest_directory = downloads_directory.Append(
          base::FilePath::FromUTF8Unsafe(dest_directory_name))
          .InsertBeforeExtensionASCII(base::StringPrintf(" (%d)", uniquifier));
    }

    internal::ResourceMetadataStorage::RecoveredCacheInfoMap
        recovered_cache_info;
    metadata_storage->RecoverCacheInfoFromTrashedResourceMap(
        &recovered_cache_info);

    LOG_IF(WARNING, !recovered_cache_info.empty())
        << "DB could not be opened for some reasons. "
        << "Recovering cache files to " << dest_directory.value();
    if (!cache->RecoverFilesFromCacheDirectory(dest_directory,
                                               recovered_cache_info)) {
      LOG(WARNING) << "Failed to recover cache files.";
      return FILE_ERROR_FAILED;
    }
  }

  FileError error = resource_metadata->Initialize();
  LOG_IF(WARNING, error != FILE_ERROR_OK)
      << "Failed to initialize resource metadata. " << FileErrorToString(error);
  return error;
}

}  // namespace

// Observes drive disable Preference's change.
class DriveIntegrationService::PreferenceWatcher {
 public:
  explicit PreferenceWatcher(PrefService* pref_service)
      : pref_service_(pref_service),
        integration_service_(NULL),
        weak_ptr_factory_(this) {
    DCHECK(pref_service);
    pref_change_registrar_.Init(pref_service);
    pref_change_registrar_.Add(
        prefs::kDisableDrive,
        base::Bind(&PreferenceWatcher::OnPreferenceChanged,
                   weak_ptr_factory_.GetWeakPtr()));
  }

  void set_integration_service(DriveIntegrationService* integration_service) {
    integration_service_ = integration_service;
  }

 private:
  void OnPreferenceChanged() {
    DCHECK(integration_service_);
    integration_service_->SetEnabled(
        !pref_service_->GetBoolean(prefs::kDisableDrive));
  }

  PrefService* pref_service_;
  PrefChangeRegistrar pref_change_registrar_;
  DriveIntegrationService* integration_service_;

  base::WeakPtrFactory<PreferenceWatcher> weak_ptr_factory_;
  DISALLOW_COPY_AND_ASSIGN(PreferenceWatcher);
};

DriveIntegrationService::DriveIntegrationService(
    Profile* profile,
    PreferenceWatcher* preference_watcher,
    DriveServiceInterface* test_drive_service,
    const std::string& test_mount_point_name,
    const base::FilePath& test_cache_root,
    FileSystemInterface* test_file_system)
    : profile_(profile),
      state_(NOT_INITIALIZED),
      enabled_(false),
      mount_point_name_(test_mount_point_name),
      cache_root_directory_(!test_cache_root.empty() ?
                            test_cache_root : util::GetCacheRootPath(profile)),
      weak_ptr_factory_(this) {
  DCHECK(BrowserThread::CurrentlyOn(BrowserThread::UI));
  DCHECK(profile && !profile->IsOffTheRecord());

  logger_.reset(new EventLogger);
  base::SequencedWorkerPool* blocking_pool = BrowserThread::GetBlockingPool();
  blocking_task_runner_ = blocking_pool->GetSequencedTaskRunner(
      blocking_pool->GetSequenceToken());

  ProfileOAuth2TokenService* oauth_service =
      ProfileOAuth2TokenServiceFactory::GetForProfile(profile);

  if (test_drive_service) {
    drive_service_.reset(test_drive_service);
  } else {
    drive_service_.reset(new DriveAPIService(
        oauth_service,
        g_browser_process->system_request_context(),
        blocking_task_runner_.get(),
        GURL(google_apis::DriveApiUrlGenerator::kBaseUrlForProduction),
        GURL(google_apis::DriveApiUrlGenerator::kBaseDownloadUrlForProduction),
        GURL(google_apis::GDataWapiUrlGenerator::kBaseUrlForProduction),
        GetDriveUserAgent()));
  }
  scheduler_.reset(new JobScheduler(
      profile_->GetPrefs(),
      logger_.get(),
      drive_service_.get(),
      blocking_task_runner_.get()));
  metadata_storage_.reset(new internal::ResourceMetadataStorage(
      cache_root_directory_.Append(kMetadataDirectory),
      blocking_task_runner_.get()));
  cache_.reset(new internal::FileCache(
      metadata_storage_.get(),
      cache_root_directory_.Append(kCacheFileDirectory),
      blocking_task_runner_.get(),
      NULL /* free_disk_space_getter */));
  drive_app_registry_.reset(new DriveAppRegistry(drive_service_.get()));

  resource_metadata_.reset(new internal::ResourceMetadata(
      metadata_storage_.get(), cache_.get(), blocking_task_runner_));

  file_system_.reset(
      test_file_system ? test_file_system : new FileSystem(
          profile_->GetPrefs(),
          logger_.get(),
          cache_.get(),
          drive_service_.get(),
          scheduler_.get(),
          resource_metadata_.get(),
          blocking_task_runner_.get(),
          cache_root_directory_.Append(kTemporaryFileDirectory)));
  download_handler_.reset(new DownloadHandler(file_system()));
  debug_info_collector_.reset(new DebugInfoCollector(
      resource_metadata_.get(), file_system(), blocking_task_runner_.get()));

  if (preference_watcher) {
    preference_watcher_.reset(preference_watcher);
    preference_watcher->set_integration_service(this);
  }

  SetEnabled(drive::util::IsDriveEnabledForProfile(profile));
}

DriveIntegrationService::~DriveIntegrationService() {
  DCHECK(BrowserThread::CurrentlyOn(BrowserThread::UI));
}

void DriveIntegrationService::Shutdown() {
  DCHECK(BrowserThread::CurrentlyOn(BrowserThread::UI));

  weak_ptr_factory_.InvalidateWeakPtrs();

  DriveNotificationManager* drive_notification_manager =
      DriveNotificationManagerFactory::FindForBrowserContext(profile_);
  if (drive_notification_manager)
    drive_notification_manager->RemoveObserver(this);

  RemoveDriveMountPoint();
  debug_info_collector_.reset();
  download_handler_.reset();
  file_system_.reset();
  drive_app_registry_.reset();
  scheduler_.reset();
  drive_service_.reset();
}

void DriveIntegrationService::SetEnabled(bool enabled) {
  // If Drive is being disabled, ensure the download destination preference to
  // be out of Drive. Do this before "Do nothing if not changed." because we
  // want to run the check for the first SetEnabled() called in the constructor,
  // which may be a change from false to false.
  if (!enabled)
    AvoidDriveAsDownloadDirecotryPreference();

  // Do nothing if not changed.
  if (enabled_ == enabled)
    return;

  if (enabled) {
    enabled_ = true;
    switch (state_) {
      case NOT_INITIALIZED:
        // If the initialization is not yet done, trigger it.
        Initialize();
        return;

      case INITIALIZING:
      case REMOUNTING:
        // If the state is INITIALIZING or REMOUNTING, at the end of the
        // process, it tries to mounting (with re-checking enabled state).
        // Do nothing for now.
        return;

      case INITIALIZED:
        // The integration service is already initialized. Add the mount point.
        AddDriveMountPoint();
        return;
    }
    NOTREACHED();
  } else {
    RemoveDriveMountPoint();
    enabled_ = false;
  }
}

bool DriveIntegrationService::IsMounted() const {
  if (mount_point_name_.empty())
    return false;

  // Look up the registered path, and just discard it.
  // GetRegisteredPath() returns true if the path is available.
  base::FilePath unused;
  fileapi::ExternalMountPoints* const mount_points =
      fileapi::ExternalMountPoints::GetSystemInstance();
  DCHECK(mount_points);
  return mount_points->GetRegisteredPath(mount_point_name_, &unused);
}

void DriveIntegrationService::AddObserver(
    DriveIntegrationServiceObserver* observer) {
  DCHECK(BrowserThread::CurrentlyOn(BrowserThread::UI));
  observers_.AddObserver(observer);
}

void DriveIntegrationService::RemoveObserver(
    DriveIntegrationServiceObserver* observer) {
  DCHECK(BrowserThread::CurrentlyOn(BrowserThread::UI));
  observers_.RemoveObserver(observer);
}

void DriveIntegrationService::OnNotificationReceived() {
  file_system_->CheckForUpdates();
  drive_app_registry_->Update();
}

void DriveIntegrationService::OnPushNotificationEnabled(bool enabled) {
  if (enabled)
    drive_app_registry_->Update();

  const char* status = (enabled ? "enabled" : "disabled");
  logger_->Log(logging::LOG_INFO, "Push notification is %s", status);
}

void DriveIntegrationService::ClearCacheAndRemountFileSystem(
    const base::Callback<void(bool)>& callback) {
  DCHECK(BrowserThread::CurrentlyOn(BrowserThread::UI));
  DCHECK(!callback.is_null());

  if (state_ != INITIALIZED) {
    callback.Run(false);
    return;
  }

  RemoveDriveMountPoint();

  state_ = REMOUNTING;
  // Reloads the Drive app registry.
  drive_app_registry_->Update();
  // Resetting the file system clears resource metadata and cache.
  file_system_->Reset(base::Bind(
      &DriveIntegrationService::AddBackDriveMountPoint,
      weak_ptr_factory_.GetWeakPtr(),
      callback));
}

void DriveIntegrationService::AddBackDriveMountPoint(
    const base::Callback<void(bool)>& callback,
    FileError error) {
  DCHECK(BrowserThread::CurrentlyOn(BrowserThread::UI));
  DCHECK(!callback.is_null());

  state_ = error == FILE_ERROR_OK ? INITIALIZED : NOT_INITIALIZED;

  if (error != FILE_ERROR_OK || !enabled_) {
    // Failed to reset, or Drive was disabled during the reset.
    callback.Run(false);
    return;
  }

  AddDriveMountPoint();
  callback.Run(true);
}

void DriveIntegrationService::AddDriveMountPoint() {
  DCHECK(BrowserThread::CurrentlyOn(BrowserThread::UI));
  DCHECK_EQ(INITIALIZED, state_);
  DCHECK(enabled_);

  const base::FilePath& drive_mount_point =
      util::GetDriveMountPointPath(profile_);
  if (mount_point_name_.empty())
    mount_point_name_ = drive_mount_point.BaseName().AsUTF8Unsafe();
  fileapi::ExternalMountPoints* const mount_points =
      fileapi::ExternalMountPoints::GetSystemInstance();
  DCHECK(mount_points);

  bool success = mount_points->RegisterFileSystem(
      mount_point_name_,
      fileapi::kFileSystemTypeDrive,
      fileapi::FileSystemMountOption(),
      drive_mount_point);

  if (success) {
    logger_->Log(logging::LOG_INFO, "Drive mount point is added");
    FOR_EACH_OBSERVER(DriveIntegrationServiceObserver, observers_,
                      OnFileSystemMounted());
  }
}

void DriveIntegrationService::RemoveDriveMountPoint() {
  DCHECK(BrowserThread::CurrentlyOn(BrowserThread::UI));

  if (!mount_point_name_.empty()) {
    job_list()->CancelAllJobs();

    FOR_EACH_OBSERVER(DriveIntegrationServiceObserver, observers_,
                      OnFileSystemBeingUnmounted());

    fileapi::ExternalMountPoints* const mount_points =
        fileapi::ExternalMountPoints::GetSystemInstance();
    DCHECK(mount_points);

    mount_points->RevokeFileSystem(mount_point_name_);
    logger_->Log(logging::LOG_INFO, "Drive mount point is removed");
  }
}

void DriveIntegrationService::Initialize() {
  DCHECK(BrowserThread::CurrentlyOn(BrowserThread::UI));
  DCHECK_EQ(NOT_INITIALIZED, state_);
  DCHECK(enabled_);

  state_ = INITIALIZING;

  base::PostTaskAndReplyWithResult(
      blocking_task_runner_.get(),
      FROM_HERE,
      base::Bind(&InitializeMetadata,
                 cache_root_directory_,
                 metadata_storage_.get(),
                 cache_.get(),
                 resource_metadata_.get(),
                 drive_service_->GetResourceIdCanonicalizer(),
                 file_manager::util::GetDownloadsFolderForProfile(profile_)),
      base::Bind(&DriveIntegrationService::InitializeAfterMetadataInitialized,
                 weak_ptr_factory_.GetWeakPtr()));
}

void DriveIntegrationService::InitializeAfterMetadataInitialized(
    FileError error) {
  DCHECK(BrowserThread::CurrentlyOn(BrowserThread::UI));
  DCHECK_EQ(INITIALIZING, state_);

  SigninManagerBase* signin_manager =
      SigninManagerFactory::GetForProfile(profile_);
  drive_service_->Initialize(signin_manager->GetAuthenticatedAccountId());

  if (error != FILE_ERROR_OK) {
    LOG(WARNING) << "Failed to initialize: " << FileErrorToString(error);

    // Cannot used Drive. Set the download destination preference out of Drive.
    AvoidDriveAsDownloadDirecotryPreference();

    // Back to NOT_INITIALIZED state. Then, re-running Initialize() should
    // work if the error is recoverable manually (such as out of disk space).
    state_ = NOT_INITIALIZED;
    return;
  }

  // Initialize Download Handler for hooking downloads to the Drive folder.
  content::DownloadManager* download_manager =
      g_browser_process->download_status_updater() ?
      BrowserContext::GetDownloadManager(profile_) : NULL;
  download_handler_->Initialize(
      download_manager,
      cache_root_directory_.Append(kTemporaryFileDirectory));

  // Install the handler also to incognito profile.
  if (g_browser_process->download_status_updater()) {
    if (profile_->HasOffTheRecordProfile()) {
      download_handler_->ObserveIncognitoDownloadManager(
          BrowserContext::GetDownloadManager(
              profile_->GetOffTheRecordProfile()));
    } else {
      profile_notification_registrar_.reset(new content::NotificationRegistrar);
      profile_notification_registrar_->Add(
          this,
          chrome::NOTIFICATION_PROFILE_CREATED,
          content::NotificationService::AllSources());
    }
  }

  // Register for Google Drive invalidation notifications.
  DriveNotificationManager* drive_notification_manager =
      DriveNotificationManagerFactory::GetForBrowserContext(profile_);
  if (drive_notification_manager) {
    drive_notification_manager->AddObserver(this);
    const bool registered =
        drive_notification_manager->push_notification_registered();
    const char* status = (registered ? "registered" : "not registered");
    logger_->Log(logging::LOG_INFO, "Push notification is %s", status);

    if (drive_notification_manager->push_notification_enabled())
      drive_app_registry_->Update();
  }

  state_ = INITIALIZED;

  // Mount only when the drive is enabled. Initialize is triggered by
  // SetEnabled(true), but there is a change to disable it again during
  // the metadata initialization, so we need to look this up again here.
  if (enabled_)
    AddDriveMountPoint();
}

void DriveIntegrationService::AvoidDriveAsDownloadDirecotryPreference() {
  PrefService* pref_service = profile_->GetPrefs();
  if (util::IsUnderDriveMountPoint(
          pref_service->GetFilePath(prefs::kDownloadDefaultDirectory))) {
    pref_service->SetFilePath(
        prefs::kDownloadDefaultDirectory,
        file_manager::util::GetDownloadsFolderForProfile(profile_));
  }
}

void DriveIntegrationService::Observe(
    int type,
    const content::NotificationSource& source,
    const content::NotificationDetails& details) {
  if (type == chrome::NOTIFICATION_PROFILE_CREATED) {
    Profile* created_profile = content::Source<Profile>(source).ptr();
    if (created_profile->IsOffTheRecord() &&
        created_profile->IsSameProfile(profile_)) {
      download_handler_->ObserveIncognitoDownloadManager(
          BrowserContext::GetDownloadManager(created_profile));
      profile_notification_registrar_->Remove(
          this,
          chrome::NOTIFICATION_PROFILE_CREATED,
          content::NotificationService::AllSources());
    }
  }
}

//===================== DriveIntegrationServiceFactory =======================

DriveIntegrationServiceFactory::FactoryCallback*
    DriveIntegrationServiceFactory::factory_for_test_ = NULL;

DriveIntegrationServiceFactory::ScopedFactoryForTest::ScopedFactoryForTest(
    FactoryCallback* factory_for_test) {
  factory_for_test_ = factory_for_test;
}

DriveIntegrationServiceFactory::ScopedFactoryForTest::~ScopedFactoryForTest() {
  factory_for_test_ = NULL;
}

// static
DriveIntegrationService* DriveIntegrationServiceFactory::GetForProfile(
    Profile* profile) {
  return GetForProfileRegardlessOfStates(profile);
}

// static
DriveIntegrationService*
DriveIntegrationServiceFactory::GetForProfileRegardlessOfStates(
    Profile* profile) {
  return static_cast<DriveIntegrationService*>(
      GetInstance()->GetServiceForBrowserContext(profile, true));
}

// static
DriveIntegrationService* DriveIntegrationServiceFactory::FindForProfile(
    Profile* profile) {
  return FindForProfileRegardlessOfStates(profile);
}

// static
DriveIntegrationService*
DriveIntegrationServiceFactory::FindForProfileRegardlessOfStates(
    Profile* profile) {
  return static_cast<DriveIntegrationService*>(
      GetInstance()->GetServiceForBrowserContext(profile, false));
}

// static
DriveIntegrationServiceFactory* DriveIntegrationServiceFactory::GetInstance() {
  return Singleton<DriveIntegrationServiceFactory>::get();
}

DriveIntegrationServiceFactory::DriveIntegrationServiceFactory()
    : BrowserContextKeyedServiceFactory(
        "DriveIntegrationService",
        BrowserContextDependencyManager::GetInstance()) {
  DependsOn(ProfileOAuth2TokenServiceFactory::GetInstance());
  DependsOn(DriveNotificationManagerFactory::GetInstance());
  DependsOn(DownloadServiceFactory::GetInstance());
}

DriveIntegrationServiceFactory::~DriveIntegrationServiceFactory() {
}

content::BrowserContext* DriveIntegrationServiceFactory::GetBrowserContextToUse(
    content::BrowserContext* context) const {
  return chrome::GetBrowserContextRedirectedInIncognito(context);
}

KeyedService* DriveIntegrationServiceFactory::BuildServiceInstanceFor(
    content::BrowserContext* context) const {
  Profile* profile = Profile::FromBrowserContext(context);

  DriveIntegrationService* service = NULL;
  if (!factory_for_test_) {
    DriveIntegrationService::PreferenceWatcher* preference_watcher = NULL;
    if (chromeos::IsProfileAssociatedWithGaiaAccount(profile)) {
      // Drive File System can be enabled.
      preference_watcher =
          new DriveIntegrationService::PreferenceWatcher(profile->GetPrefs());
    }

    service = new DriveIntegrationService(
        profile, preference_watcher,
        NULL, std::string(), base::FilePath(), NULL);
  } else {
    service = factory_for_test_->Run(profile);
  }

  return service;
}

}  // namespace drive
