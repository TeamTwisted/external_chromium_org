// Copyright (c) 2012 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#include "chrome/browser/extensions/extension_uninstall_dialog.h"

#include "base/bind.h"
#include "base/logging.h"
#include "base/message_loop/message_loop.h"
#include "base/strings/utf_string_conversions.h"
#include "chrome/browser/chrome_notification_types.h"
#include "chrome/browser/extensions/extension_util.h"
#include "chrome/browser/extensions/image_loader.h"
#include "chrome/browser/profiles/profile.h"
#include "chrome/browser/ui/browser.h"
#include "content/public/browser/notification_service.h"
#include "content/public/browser/notification_source.h"
#include "extensions/browser/extension_registry.h"
#include "extensions/common/constants.h"
#include "extensions/common/extension.h"
#include "extensions/common/extension_icon_set.h"
#include "extensions/common/extension_resource.h"
#include "extensions/common/manifest_handlers/icons_handler.h"
#include "grit/generated_resources.h"
#include "grit/theme_resources.h"
#include "ui/base/l10n/l10n_util.h"
#include "ui/base/resource/resource_bundle.h"
#include "ui/gfx/image/image.h"
#include "ui/gfx/image/image_skia.h"

namespace extensions {

namespace {

// Returns bitmap for the default icon with size equal to the default icon's
// pixel size under maximal supported scale factor.
SkBitmap GetDefaultIconBitmapForMaxScaleFactor(bool is_app) {
  const gfx::ImageSkia& image =
      is_app ? util::GetDefaultAppIcon() : util::GetDefaultExtensionIcon();
  return image.GetRepresentation(
      gfx::ImageSkia::GetMaxSupportedScale()).sk_bitmap();
}

}  // namespace

ExtensionUninstallDialog::ExtensionUninstallDialog(
    Profile* profile,
    Browser* browser,
    ExtensionUninstallDialog::Delegate* delegate)
    : profile_(profile),
      browser_(browser),
      delegate_(delegate),
      extension_(NULL),
      triggering_extension_(NULL),
      state_(kImageIsLoading),
      ui_loop_(base::MessageLoop::current()) {
  if (browser) {
    registrar_.Add(this,
                   chrome::NOTIFICATION_BROWSER_CLOSED,
                   content::Source<Browser>(browser));
  }
}

ExtensionUninstallDialog::~ExtensionUninstallDialog() {
}

void ExtensionUninstallDialog::ConfirmProgrammaticUninstall(
    const Extension* extension,
    const Extension* triggering_extension) {
  triggering_extension_ = triggering_extension;
  ConfirmUninstall(extension);
}

void ExtensionUninstallDialog::ConfirmUninstall(const Extension* extension) {
  DCHECK(ui_loop_ == base::MessageLoop::current());
  extension_ = extension;
  // Bookmark apps may not have 128x128 icons so accept 64x64 icons.
  const int icon_size = extension_->from_bookmark()
                            ? extension_misc::EXTENSION_ICON_SMALL * 2
                            : extension_misc::EXTENSION_ICON_LARGE;
  ExtensionResource image = IconsInfo::GetIconResource(
      extension_, icon_size, ExtensionIconSet::MATCH_BIGGER);

  // Load the image asynchronously. The response will be sent to OnImageLoaded.
  state_ = kImageIsLoading;
  ImageLoader* loader = ImageLoader::Get(profile_);

  std::vector<ImageLoader::ImageRepresentation> images_list;
  images_list.push_back(ImageLoader::ImageRepresentation(
      image,
      ImageLoader::ImageRepresentation::NEVER_RESIZE,
      gfx::Size(),
      ui::SCALE_FACTOR_100P));
  loader->LoadImagesAsync(extension_,
                          images_list,
                          base::Bind(&ExtensionUninstallDialog::OnImageLoaded,
                                     AsWeakPtr(),
                                     extension_->id()));
}

void ExtensionUninstallDialog::SetIcon(const gfx::Image& image) {
  if (image.IsEmpty()) {
    // Let's set default icon bitmap whose size is equal to the default icon's
    // pixel size under maximal supported scale factor. If the bitmap is larger
    // than the one we need, it will be scaled down by the ui code.
    // TODO(tbarzic): We should use IconImage here and load the required bitmap
    //     lazily.
    icon_ = gfx::ImageSkia::CreateFrom1xBitmap(
        GetDefaultIconBitmapForMaxScaleFactor(extension_->is_app()));
  } else {
    icon_ = *image.ToImageSkia();
  }
}

void ExtensionUninstallDialog::OnImageLoaded(const std::string& extension_id,
                                             const gfx::Image& image) {
  const Extension* target_extension =
      ExtensionRegistry::Get(profile_)
          ->GetExtensionById(extension_id, ExtensionRegistry::EVERYTHING);
  if (!target_extension) {
    delegate_->ExtensionUninstallCanceled();
    return;
  }

  SetIcon(image);

  // Show the dialog unless the browser has been closed while we were waiting
  // for the image.
  DCHECK(state_ == kImageIsLoading || state_ == kBrowserIsClosing);
  if (state_ == kImageIsLoading) {
    state_ = kDialogIsShowing;
    Show();
  }
}

void ExtensionUninstallDialog::Observe(
    int type,
    const content::NotificationSource& source,
    const content::NotificationDetails& details) {
  DCHECK(type == chrome::NOTIFICATION_BROWSER_CLOSED);

  browser_ = NULL;
  // If the browser is closed while waiting for the image, we need to send a
  // "cancel" event here, because there will not be another opportunity to
  // notify the delegate of the cancellation as we won't open the dialog.
  if (state_ == kImageIsLoading) {
    state_ = kBrowserIsClosing;
    delegate_->ExtensionUninstallCanceled();
  }
}

std::string ExtensionUninstallDialog::GetHeadingText() {
  if (triggering_extension_) {
    return l10n_util::GetStringFUTF8(
        IDS_EXTENSION_PROGRAMMATIC_UNINSTALL_PROMPT_HEADING,
        base::UTF8ToUTF16(triggering_extension_->name()),
        base::UTF8ToUTF16(extension_->name()));
  }
  return l10n_util::GetStringFUTF8(IDS_EXTENSION_UNINSTALL_PROMPT_HEADING,
                                   base::UTF8ToUTF16(extension_->name()));
}

}  // namespace extensions
