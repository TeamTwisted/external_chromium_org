# This file is generated by gyp; do not edit.

include $(CLEAR_VARS)

LOCAL_MODULE_CLASS := GYP
LOCAL_MODULE := android_webview_native_android_webview_native_jni_gyp
LOCAL_MODULE_STEM := android_webview_native_jni
LOCAL_MODULE_SUFFIX := .stamp
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_TARGET_ARCH := $(TARGET_$(GYP_VAR_PREFIX)ARCH)
gyp_intermediate_dir := $(call local-intermediates-dir,,$(GYP_VAR_PREFIX))
gyp_shared_intermediate_dir := $(call intermediates-dir-for,GYP,shared,,,$(GYP_VAR_PREFIX))

# Make sure our deps are built first.
GYP_TARGET_DEPENDENCIES := \
	$(call intermediates-dir-for,GYP,android_webview_native_input_stream_android_jar_jni_headers_gyp,,,$(GYP_VAR_PREFIX))/input_stream_android_jar_jni_headers.stamp \
	$(call intermediates-dir-for,GYP,android_webview_native_cancellation_signal_android_jar_jni_headers_gyp,,,$(GYP_VAR_PREFIX))/cancellation_signal_android_jar_jni_headers.stamp


### Generated for rule "android_webview_native_webview_native_gyp_android_webview_native_jni_target_generate_jni_headers":
# "{'inputs': ['../../base/android/jni_generator/jni_generator.py', '../../android_webview/build/jarjar-rules.txt'], 'process_outputs_as_sources': '1', 'extension': 'java', 'outputs': ['$(gyp_shared_intermediate_dir)/android_webview/jni/%(INPUT_ROOT)s_jni.h'], 'rule_name': 'generate_jni_headers', 'rule_sources': ['../java/src/org/chromium/android_webview/AndroidProtocolHandler.java', '../java/src/org/chromium/android_webview/AwAutofillManagerDelegate.java', '../java/src/org/chromium/android_webview/AwContents.java', '../java/src/org/chromium/android_webview/AwContentsClientBridge.java', '../java/src/org/chromium/android_webview/AwContentsIoThreadClient.java', '../java/src/org/chromium/android_webview/AwContentsStatics.java', '../java/src/org/chromium/android_webview/AwCookieManager.java', '../java/src/org/chromium/android_webview/AwDevToolsServer.java', '../java/src/org/chromium/android_webview/AwFormDatabase.java', '../java/src/org/chromium/android_webview/AwHttpAuthHandler.java', '../java/src/org/chromium/android_webview/AwPdfExporter.java', '../java/src/org/chromium/android_webview/AwPicture.java', '../java/src/org/chromium/android_webview/AwQuotaManagerBridge.java', '../java/src/org/chromium/android_webview/AwResource.java', '../java/src/org/chromium/android_webview/AwSettings.java', '../java/src/org/chromium/android_webview/AwWebContentsDelegate.java', '../java/src/org/chromium/android_webview/ExternalVideoSurfaceContainer.java', '../java/src/org/chromium/android_webview/InterceptedRequestData.java', '../java/src/org/chromium/android_webview/JavaBrowserViewRendererHelper.java', '../java/src/org/chromium/android_webview/permission/AwPermissionRequest.java'], 'action': ['../../base/android/jni_generator/jni_generator.py', '--input_file', '$(RULE_SOURCES)', '--output_dir', '$(gyp_shared_intermediate_dir)/android_webview/jni', '--includes', 'base/android/jni_generator/jni_generator_helper.h', '--optimize_generation', '0', '--jarjar', '../../android_webview/build/jarjar-rules.txt', '--ptr_type', 'long'], 'message': 'Generating JNI bindings from $(RULE_SOURCES)'}":
$(gyp_shared_intermediate_dir)/android_webview/jni/AndroidProtocolHandler_jni.h: gyp_local_path := $(LOCAL_PATH)
$(gyp_shared_intermediate_dir)/android_webview/jni/AndroidProtocolHandler_jni.h: gyp_var_prefix := $(GYP_VAR_PREFIX)
$(gyp_shared_intermediate_dir)/android_webview/jni/AndroidProtocolHandler_jni.h: gyp_intermediate_dir := $(abspath $(gyp_intermediate_dir))
$(gyp_shared_intermediate_dir)/android_webview/jni/AndroidProtocolHandler_jni.h: gyp_shared_intermediate_dir := $(abspath $(gyp_shared_intermediate_dir))
$(gyp_shared_intermediate_dir)/android_webview/jni/AndroidProtocolHandler_jni.h: export PATH := $(subst $(ANDROID_BUILD_PATHS),,$(PATH))
$(gyp_shared_intermediate_dir)/android_webview/jni/AndroidProtocolHandler_jni.h: $(LOCAL_PATH)/android_webview/java/src/org/chromium/android_webview/AndroidProtocolHandler.java $(LOCAL_PATH)/base/android/jni_generator/jni_generator.py $(LOCAL_PATH)/android_webview/build/jarjar-rules.txt $(GYP_TARGET_DEPENDENCIES)
	mkdir -p $(gyp_shared_intermediate_dir)/android_webview/jni; cd $(gyp_local_path)/android_webview/native; ../../base/android/jni_generator/jni_generator.py --input_file ../java/src/org/chromium/android_webview/AndroidProtocolHandler.java --output_dir "$(gyp_shared_intermediate_dir)/android_webview/jni" --includes base/android/jni_generator/jni_generator_helper.h --optimize_generation 0 --jarjar ../../android_webview/build/jarjar-rules.txt --ptr_type long


$(gyp_shared_intermediate_dir)/android_webview/jni/AwAutofillManagerDelegate_jni.h: gyp_local_path := $(LOCAL_PATH)
$(gyp_shared_intermediate_dir)/android_webview/jni/AwAutofillManagerDelegate_jni.h: gyp_var_prefix := $(GYP_VAR_PREFIX)
$(gyp_shared_intermediate_dir)/android_webview/jni/AwAutofillManagerDelegate_jni.h: gyp_intermediate_dir := $(abspath $(gyp_intermediate_dir))
$(gyp_shared_intermediate_dir)/android_webview/jni/AwAutofillManagerDelegate_jni.h: gyp_shared_intermediate_dir := $(abspath $(gyp_shared_intermediate_dir))
$(gyp_shared_intermediate_dir)/android_webview/jni/AwAutofillManagerDelegate_jni.h: export PATH := $(subst $(ANDROID_BUILD_PATHS),,$(PATH))
$(gyp_shared_intermediate_dir)/android_webview/jni/AwAutofillManagerDelegate_jni.h: $(LOCAL_PATH)/android_webview/java/src/org/chromium/android_webview/AwAutofillManagerDelegate.java $(LOCAL_PATH)/base/android/jni_generator/jni_generator.py $(LOCAL_PATH)/android_webview/build/jarjar-rules.txt $(GYP_TARGET_DEPENDENCIES)
	mkdir -p $(gyp_shared_intermediate_dir)/android_webview/jni; cd $(gyp_local_path)/android_webview/native; ../../base/android/jni_generator/jni_generator.py --input_file ../java/src/org/chromium/android_webview/AwAutofillManagerDelegate.java --output_dir "$(gyp_shared_intermediate_dir)/android_webview/jni" --includes base/android/jni_generator/jni_generator_helper.h --optimize_generation 0 --jarjar ../../android_webview/build/jarjar-rules.txt --ptr_type long


$(gyp_shared_intermediate_dir)/android_webview/jni/AwContents_jni.h: gyp_local_path := $(LOCAL_PATH)
$(gyp_shared_intermediate_dir)/android_webview/jni/AwContents_jni.h: gyp_var_prefix := $(GYP_VAR_PREFIX)
$(gyp_shared_intermediate_dir)/android_webview/jni/AwContents_jni.h: gyp_intermediate_dir := $(abspath $(gyp_intermediate_dir))
$(gyp_shared_intermediate_dir)/android_webview/jni/AwContents_jni.h: gyp_shared_intermediate_dir := $(abspath $(gyp_shared_intermediate_dir))
$(gyp_shared_intermediate_dir)/android_webview/jni/AwContents_jni.h: export PATH := $(subst $(ANDROID_BUILD_PATHS),,$(PATH))
$(gyp_shared_intermediate_dir)/android_webview/jni/AwContents_jni.h: $(LOCAL_PATH)/android_webview/java/src/org/chromium/android_webview/AwContents.java $(LOCAL_PATH)/base/android/jni_generator/jni_generator.py $(LOCAL_PATH)/android_webview/build/jarjar-rules.txt $(GYP_TARGET_DEPENDENCIES)
	mkdir -p $(gyp_shared_intermediate_dir)/android_webview/jni; cd $(gyp_local_path)/android_webview/native; ../../base/android/jni_generator/jni_generator.py --input_file ../java/src/org/chromium/android_webview/AwContents.java --output_dir "$(gyp_shared_intermediate_dir)/android_webview/jni" --includes base/android/jni_generator/jni_generator_helper.h --optimize_generation 0 --jarjar ../../android_webview/build/jarjar-rules.txt --ptr_type long


$(gyp_shared_intermediate_dir)/android_webview/jni/AwContentsClientBridge_jni.h: gyp_local_path := $(LOCAL_PATH)
$(gyp_shared_intermediate_dir)/android_webview/jni/AwContentsClientBridge_jni.h: gyp_var_prefix := $(GYP_VAR_PREFIX)
$(gyp_shared_intermediate_dir)/android_webview/jni/AwContentsClientBridge_jni.h: gyp_intermediate_dir := $(abspath $(gyp_intermediate_dir))
$(gyp_shared_intermediate_dir)/android_webview/jni/AwContentsClientBridge_jni.h: gyp_shared_intermediate_dir := $(abspath $(gyp_shared_intermediate_dir))
$(gyp_shared_intermediate_dir)/android_webview/jni/AwContentsClientBridge_jni.h: export PATH := $(subst $(ANDROID_BUILD_PATHS),,$(PATH))
$(gyp_shared_intermediate_dir)/android_webview/jni/AwContentsClientBridge_jni.h: $(LOCAL_PATH)/android_webview/java/src/org/chromium/android_webview/AwContentsClientBridge.java $(LOCAL_PATH)/base/android/jni_generator/jni_generator.py $(LOCAL_PATH)/android_webview/build/jarjar-rules.txt $(GYP_TARGET_DEPENDENCIES)
	mkdir -p $(gyp_shared_intermediate_dir)/android_webview/jni; cd $(gyp_local_path)/android_webview/native; ../../base/android/jni_generator/jni_generator.py --input_file ../java/src/org/chromium/android_webview/AwContentsClientBridge.java --output_dir "$(gyp_shared_intermediate_dir)/android_webview/jni" --includes base/android/jni_generator/jni_generator_helper.h --optimize_generation 0 --jarjar ../../android_webview/build/jarjar-rules.txt --ptr_type long


$(gyp_shared_intermediate_dir)/android_webview/jni/AwContentsIoThreadClient_jni.h: gyp_local_path := $(LOCAL_PATH)
$(gyp_shared_intermediate_dir)/android_webview/jni/AwContentsIoThreadClient_jni.h: gyp_var_prefix := $(GYP_VAR_PREFIX)
$(gyp_shared_intermediate_dir)/android_webview/jni/AwContentsIoThreadClient_jni.h: gyp_intermediate_dir := $(abspath $(gyp_intermediate_dir))
$(gyp_shared_intermediate_dir)/android_webview/jni/AwContentsIoThreadClient_jni.h: gyp_shared_intermediate_dir := $(abspath $(gyp_shared_intermediate_dir))
$(gyp_shared_intermediate_dir)/android_webview/jni/AwContentsIoThreadClient_jni.h: export PATH := $(subst $(ANDROID_BUILD_PATHS),,$(PATH))
$(gyp_shared_intermediate_dir)/android_webview/jni/AwContentsIoThreadClient_jni.h: $(LOCAL_PATH)/android_webview/java/src/org/chromium/android_webview/AwContentsIoThreadClient.java $(LOCAL_PATH)/base/android/jni_generator/jni_generator.py $(LOCAL_PATH)/android_webview/build/jarjar-rules.txt $(GYP_TARGET_DEPENDENCIES)
	mkdir -p $(gyp_shared_intermediate_dir)/android_webview/jni; cd $(gyp_local_path)/android_webview/native; ../../base/android/jni_generator/jni_generator.py --input_file ../java/src/org/chromium/android_webview/AwContentsIoThreadClient.java --output_dir "$(gyp_shared_intermediate_dir)/android_webview/jni" --includes base/android/jni_generator/jni_generator_helper.h --optimize_generation 0 --jarjar ../../android_webview/build/jarjar-rules.txt --ptr_type long


$(gyp_shared_intermediate_dir)/android_webview/jni/AwContentsStatics_jni.h: gyp_local_path := $(LOCAL_PATH)
$(gyp_shared_intermediate_dir)/android_webview/jni/AwContentsStatics_jni.h: gyp_var_prefix := $(GYP_VAR_PREFIX)
$(gyp_shared_intermediate_dir)/android_webview/jni/AwContentsStatics_jni.h: gyp_intermediate_dir := $(abspath $(gyp_intermediate_dir))
$(gyp_shared_intermediate_dir)/android_webview/jni/AwContentsStatics_jni.h: gyp_shared_intermediate_dir := $(abspath $(gyp_shared_intermediate_dir))
$(gyp_shared_intermediate_dir)/android_webview/jni/AwContentsStatics_jni.h: export PATH := $(subst $(ANDROID_BUILD_PATHS),,$(PATH))
$(gyp_shared_intermediate_dir)/android_webview/jni/AwContentsStatics_jni.h: $(LOCAL_PATH)/android_webview/java/src/org/chromium/android_webview/AwContentsStatics.java $(LOCAL_PATH)/base/android/jni_generator/jni_generator.py $(LOCAL_PATH)/android_webview/build/jarjar-rules.txt $(GYP_TARGET_DEPENDENCIES)
	mkdir -p $(gyp_shared_intermediate_dir)/android_webview/jni; cd $(gyp_local_path)/android_webview/native; ../../base/android/jni_generator/jni_generator.py --input_file ../java/src/org/chromium/android_webview/AwContentsStatics.java --output_dir "$(gyp_shared_intermediate_dir)/android_webview/jni" --includes base/android/jni_generator/jni_generator_helper.h --optimize_generation 0 --jarjar ../../android_webview/build/jarjar-rules.txt --ptr_type long


$(gyp_shared_intermediate_dir)/android_webview/jni/AwCookieManager_jni.h: gyp_local_path := $(LOCAL_PATH)
$(gyp_shared_intermediate_dir)/android_webview/jni/AwCookieManager_jni.h: gyp_var_prefix := $(GYP_VAR_PREFIX)
$(gyp_shared_intermediate_dir)/android_webview/jni/AwCookieManager_jni.h: gyp_intermediate_dir := $(abspath $(gyp_intermediate_dir))
$(gyp_shared_intermediate_dir)/android_webview/jni/AwCookieManager_jni.h: gyp_shared_intermediate_dir := $(abspath $(gyp_shared_intermediate_dir))
$(gyp_shared_intermediate_dir)/android_webview/jni/AwCookieManager_jni.h: export PATH := $(subst $(ANDROID_BUILD_PATHS),,$(PATH))
$(gyp_shared_intermediate_dir)/android_webview/jni/AwCookieManager_jni.h: $(LOCAL_PATH)/android_webview/java/src/org/chromium/android_webview/AwCookieManager.java $(LOCAL_PATH)/base/android/jni_generator/jni_generator.py $(LOCAL_PATH)/android_webview/build/jarjar-rules.txt $(GYP_TARGET_DEPENDENCIES)
	mkdir -p $(gyp_shared_intermediate_dir)/android_webview/jni; cd $(gyp_local_path)/android_webview/native; ../../base/android/jni_generator/jni_generator.py --input_file ../java/src/org/chromium/android_webview/AwCookieManager.java --output_dir "$(gyp_shared_intermediate_dir)/android_webview/jni" --includes base/android/jni_generator/jni_generator_helper.h --optimize_generation 0 --jarjar ../../android_webview/build/jarjar-rules.txt --ptr_type long


$(gyp_shared_intermediate_dir)/android_webview/jni/AwDevToolsServer_jni.h: gyp_local_path := $(LOCAL_PATH)
$(gyp_shared_intermediate_dir)/android_webview/jni/AwDevToolsServer_jni.h: gyp_var_prefix := $(GYP_VAR_PREFIX)
$(gyp_shared_intermediate_dir)/android_webview/jni/AwDevToolsServer_jni.h: gyp_intermediate_dir := $(abspath $(gyp_intermediate_dir))
$(gyp_shared_intermediate_dir)/android_webview/jni/AwDevToolsServer_jni.h: gyp_shared_intermediate_dir := $(abspath $(gyp_shared_intermediate_dir))
$(gyp_shared_intermediate_dir)/android_webview/jni/AwDevToolsServer_jni.h: export PATH := $(subst $(ANDROID_BUILD_PATHS),,$(PATH))
$(gyp_shared_intermediate_dir)/android_webview/jni/AwDevToolsServer_jni.h: $(LOCAL_PATH)/android_webview/java/src/org/chromium/android_webview/AwDevToolsServer.java $(LOCAL_PATH)/base/android/jni_generator/jni_generator.py $(LOCAL_PATH)/android_webview/build/jarjar-rules.txt $(GYP_TARGET_DEPENDENCIES)
	mkdir -p $(gyp_shared_intermediate_dir)/android_webview/jni; cd $(gyp_local_path)/android_webview/native; ../../base/android/jni_generator/jni_generator.py --input_file ../java/src/org/chromium/android_webview/AwDevToolsServer.java --output_dir "$(gyp_shared_intermediate_dir)/android_webview/jni" --includes base/android/jni_generator/jni_generator_helper.h --optimize_generation 0 --jarjar ../../android_webview/build/jarjar-rules.txt --ptr_type long


$(gyp_shared_intermediate_dir)/android_webview/jni/AwFormDatabase_jni.h: gyp_local_path := $(LOCAL_PATH)
$(gyp_shared_intermediate_dir)/android_webview/jni/AwFormDatabase_jni.h: gyp_var_prefix := $(GYP_VAR_PREFIX)
$(gyp_shared_intermediate_dir)/android_webview/jni/AwFormDatabase_jni.h: gyp_intermediate_dir := $(abspath $(gyp_intermediate_dir))
$(gyp_shared_intermediate_dir)/android_webview/jni/AwFormDatabase_jni.h: gyp_shared_intermediate_dir := $(abspath $(gyp_shared_intermediate_dir))
$(gyp_shared_intermediate_dir)/android_webview/jni/AwFormDatabase_jni.h: export PATH := $(subst $(ANDROID_BUILD_PATHS),,$(PATH))
$(gyp_shared_intermediate_dir)/android_webview/jni/AwFormDatabase_jni.h: $(LOCAL_PATH)/android_webview/java/src/org/chromium/android_webview/AwFormDatabase.java $(LOCAL_PATH)/base/android/jni_generator/jni_generator.py $(LOCAL_PATH)/android_webview/build/jarjar-rules.txt $(GYP_TARGET_DEPENDENCIES)
	mkdir -p $(gyp_shared_intermediate_dir)/android_webview/jni; cd $(gyp_local_path)/android_webview/native; ../../base/android/jni_generator/jni_generator.py --input_file ../java/src/org/chromium/android_webview/AwFormDatabase.java --output_dir "$(gyp_shared_intermediate_dir)/android_webview/jni" --includes base/android/jni_generator/jni_generator_helper.h --optimize_generation 0 --jarjar ../../android_webview/build/jarjar-rules.txt --ptr_type long


$(gyp_shared_intermediate_dir)/android_webview/jni/AwHttpAuthHandler_jni.h: gyp_local_path := $(LOCAL_PATH)
$(gyp_shared_intermediate_dir)/android_webview/jni/AwHttpAuthHandler_jni.h: gyp_var_prefix := $(GYP_VAR_PREFIX)
$(gyp_shared_intermediate_dir)/android_webview/jni/AwHttpAuthHandler_jni.h: gyp_intermediate_dir := $(abspath $(gyp_intermediate_dir))
$(gyp_shared_intermediate_dir)/android_webview/jni/AwHttpAuthHandler_jni.h: gyp_shared_intermediate_dir := $(abspath $(gyp_shared_intermediate_dir))
$(gyp_shared_intermediate_dir)/android_webview/jni/AwHttpAuthHandler_jni.h: export PATH := $(subst $(ANDROID_BUILD_PATHS),,$(PATH))
$(gyp_shared_intermediate_dir)/android_webview/jni/AwHttpAuthHandler_jni.h: $(LOCAL_PATH)/android_webview/java/src/org/chromium/android_webview/AwHttpAuthHandler.java $(LOCAL_PATH)/base/android/jni_generator/jni_generator.py $(LOCAL_PATH)/android_webview/build/jarjar-rules.txt $(GYP_TARGET_DEPENDENCIES)
	mkdir -p $(gyp_shared_intermediate_dir)/android_webview/jni; cd $(gyp_local_path)/android_webview/native; ../../base/android/jni_generator/jni_generator.py --input_file ../java/src/org/chromium/android_webview/AwHttpAuthHandler.java --output_dir "$(gyp_shared_intermediate_dir)/android_webview/jni" --includes base/android/jni_generator/jni_generator_helper.h --optimize_generation 0 --jarjar ../../android_webview/build/jarjar-rules.txt --ptr_type long


$(gyp_shared_intermediate_dir)/android_webview/jni/AwPdfExporter_jni.h: gyp_local_path := $(LOCAL_PATH)
$(gyp_shared_intermediate_dir)/android_webview/jni/AwPdfExporter_jni.h: gyp_var_prefix := $(GYP_VAR_PREFIX)
$(gyp_shared_intermediate_dir)/android_webview/jni/AwPdfExporter_jni.h: gyp_intermediate_dir := $(abspath $(gyp_intermediate_dir))
$(gyp_shared_intermediate_dir)/android_webview/jni/AwPdfExporter_jni.h: gyp_shared_intermediate_dir := $(abspath $(gyp_shared_intermediate_dir))
$(gyp_shared_intermediate_dir)/android_webview/jni/AwPdfExporter_jni.h: export PATH := $(subst $(ANDROID_BUILD_PATHS),,$(PATH))
$(gyp_shared_intermediate_dir)/android_webview/jni/AwPdfExporter_jni.h: $(LOCAL_PATH)/android_webview/java/src/org/chromium/android_webview/AwPdfExporter.java $(LOCAL_PATH)/base/android/jni_generator/jni_generator.py $(LOCAL_PATH)/android_webview/build/jarjar-rules.txt $(GYP_TARGET_DEPENDENCIES)
	mkdir -p $(gyp_shared_intermediate_dir)/android_webview/jni; cd $(gyp_local_path)/android_webview/native; ../../base/android/jni_generator/jni_generator.py --input_file ../java/src/org/chromium/android_webview/AwPdfExporter.java --output_dir "$(gyp_shared_intermediate_dir)/android_webview/jni" --includes base/android/jni_generator/jni_generator_helper.h --optimize_generation 0 --jarjar ../../android_webview/build/jarjar-rules.txt --ptr_type long


$(gyp_shared_intermediate_dir)/android_webview/jni/AwPicture_jni.h: gyp_local_path := $(LOCAL_PATH)
$(gyp_shared_intermediate_dir)/android_webview/jni/AwPicture_jni.h: gyp_var_prefix := $(GYP_VAR_PREFIX)
$(gyp_shared_intermediate_dir)/android_webview/jni/AwPicture_jni.h: gyp_intermediate_dir := $(abspath $(gyp_intermediate_dir))
$(gyp_shared_intermediate_dir)/android_webview/jni/AwPicture_jni.h: gyp_shared_intermediate_dir := $(abspath $(gyp_shared_intermediate_dir))
$(gyp_shared_intermediate_dir)/android_webview/jni/AwPicture_jni.h: export PATH := $(subst $(ANDROID_BUILD_PATHS),,$(PATH))
$(gyp_shared_intermediate_dir)/android_webview/jni/AwPicture_jni.h: $(LOCAL_PATH)/android_webview/java/src/org/chromium/android_webview/AwPicture.java $(LOCAL_PATH)/base/android/jni_generator/jni_generator.py $(LOCAL_PATH)/android_webview/build/jarjar-rules.txt $(GYP_TARGET_DEPENDENCIES)
	mkdir -p $(gyp_shared_intermediate_dir)/android_webview/jni; cd $(gyp_local_path)/android_webview/native; ../../base/android/jni_generator/jni_generator.py --input_file ../java/src/org/chromium/android_webview/AwPicture.java --output_dir "$(gyp_shared_intermediate_dir)/android_webview/jni" --includes base/android/jni_generator/jni_generator_helper.h --optimize_generation 0 --jarjar ../../android_webview/build/jarjar-rules.txt --ptr_type long


$(gyp_shared_intermediate_dir)/android_webview/jni/AwQuotaManagerBridge_jni.h: gyp_local_path := $(LOCAL_PATH)
$(gyp_shared_intermediate_dir)/android_webview/jni/AwQuotaManagerBridge_jni.h: gyp_var_prefix := $(GYP_VAR_PREFIX)
$(gyp_shared_intermediate_dir)/android_webview/jni/AwQuotaManagerBridge_jni.h: gyp_intermediate_dir := $(abspath $(gyp_intermediate_dir))
$(gyp_shared_intermediate_dir)/android_webview/jni/AwQuotaManagerBridge_jni.h: gyp_shared_intermediate_dir := $(abspath $(gyp_shared_intermediate_dir))
$(gyp_shared_intermediate_dir)/android_webview/jni/AwQuotaManagerBridge_jni.h: export PATH := $(subst $(ANDROID_BUILD_PATHS),,$(PATH))
$(gyp_shared_intermediate_dir)/android_webview/jni/AwQuotaManagerBridge_jni.h: $(LOCAL_PATH)/android_webview/java/src/org/chromium/android_webview/AwQuotaManagerBridge.java $(LOCAL_PATH)/base/android/jni_generator/jni_generator.py $(LOCAL_PATH)/android_webview/build/jarjar-rules.txt $(GYP_TARGET_DEPENDENCIES)
	mkdir -p $(gyp_shared_intermediate_dir)/android_webview/jni; cd $(gyp_local_path)/android_webview/native; ../../base/android/jni_generator/jni_generator.py --input_file ../java/src/org/chromium/android_webview/AwQuotaManagerBridge.java --output_dir "$(gyp_shared_intermediate_dir)/android_webview/jni" --includes base/android/jni_generator/jni_generator_helper.h --optimize_generation 0 --jarjar ../../android_webview/build/jarjar-rules.txt --ptr_type long


$(gyp_shared_intermediate_dir)/android_webview/jni/AwResource_jni.h: gyp_local_path := $(LOCAL_PATH)
$(gyp_shared_intermediate_dir)/android_webview/jni/AwResource_jni.h: gyp_var_prefix := $(GYP_VAR_PREFIX)
$(gyp_shared_intermediate_dir)/android_webview/jni/AwResource_jni.h: gyp_intermediate_dir := $(abspath $(gyp_intermediate_dir))
$(gyp_shared_intermediate_dir)/android_webview/jni/AwResource_jni.h: gyp_shared_intermediate_dir := $(abspath $(gyp_shared_intermediate_dir))
$(gyp_shared_intermediate_dir)/android_webview/jni/AwResource_jni.h: export PATH := $(subst $(ANDROID_BUILD_PATHS),,$(PATH))
$(gyp_shared_intermediate_dir)/android_webview/jni/AwResource_jni.h: $(LOCAL_PATH)/android_webview/java/src/org/chromium/android_webview/AwResource.java $(LOCAL_PATH)/base/android/jni_generator/jni_generator.py $(LOCAL_PATH)/android_webview/build/jarjar-rules.txt $(GYP_TARGET_DEPENDENCIES)
	mkdir -p $(gyp_shared_intermediate_dir)/android_webview/jni; cd $(gyp_local_path)/android_webview/native; ../../base/android/jni_generator/jni_generator.py --input_file ../java/src/org/chromium/android_webview/AwResource.java --output_dir "$(gyp_shared_intermediate_dir)/android_webview/jni" --includes base/android/jni_generator/jni_generator_helper.h --optimize_generation 0 --jarjar ../../android_webview/build/jarjar-rules.txt --ptr_type long


$(gyp_shared_intermediate_dir)/android_webview/jni/AwSettings_jni.h: gyp_local_path := $(LOCAL_PATH)
$(gyp_shared_intermediate_dir)/android_webview/jni/AwSettings_jni.h: gyp_var_prefix := $(GYP_VAR_PREFIX)
$(gyp_shared_intermediate_dir)/android_webview/jni/AwSettings_jni.h: gyp_intermediate_dir := $(abspath $(gyp_intermediate_dir))
$(gyp_shared_intermediate_dir)/android_webview/jni/AwSettings_jni.h: gyp_shared_intermediate_dir := $(abspath $(gyp_shared_intermediate_dir))
$(gyp_shared_intermediate_dir)/android_webview/jni/AwSettings_jni.h: export PATH := $(subst $(ANDROID_BUILD_PATHS),,$(PATH))
$(gyp_shared_intermediate_dir)/android_webview/jni/AwSettings_jni.h: $(LOCAL_PATH)/android_webview/java/src/org/chromium/android_webview/AwSettings.java $(LOCAL_PATH)/base/android/jni_generator/jni_generator.py $(LOCAL_PATH)/android_webview/build/jarjar-rules.txt $(GYP_TARGET_DEPENDENCIES)
	mkdir -p $(gyp_shared_intermediate_dir)/android_webview/jni; cd $(gyp_local_path)/android_webview/native; ../../base/android/jni_generator/jni_generator.py --input_file ../java/src/org/chromium/android_webview/AwSettings.java --output_dir "$(gyp_shared_intermediate_dir)/android_webview/jni" --includes base/android/jni_generator/jni_generator_helper.h --optimize_generation 0 --jarjar ../../android_webview/build/jarjar-rules.txt --ptr_type long


$(gyp_shared_intermediate_dir)/android_webview/jni/AwWebContentsDelegate_jni.h: gyp_local_path := $(LOCAL_PATH)
$(gyp_shared_intermediate_dir)/android_webview/jni/AwWebContentsDelegate_jni.h: gyp_var_prefix := $(GYP_VAR_PREFIX)
$(gyp_shared_intermediate_dir)/android_webview/jni/AwWebContentsDelegate_jni.h: gyp_intermediate_dir := $(abspath $(gyp_intermediate_dir))
$(gyp_shared_intermediate_dir)/android_webview/jni/AwWebContentsDelegate_jni.h: gyp_shared_intermediate_dir := $(abspath $(gyp_shared_intermediate_dir))
$(gyp_shared_intermediate_dir)/android_webview/jni/AwWebContentsDelegate_jni.h: export PATH := $(subst $(ANDROID_BUILD_PATHS),,$(PATH))
$(gyp_shared_intermediate_dir)/android_webview/jni/AwWebContentsDelegate_jni.h: $(LOCAL_PATH)/android_webview/java/src/org/chromium/android_webview/AwWebContentsDelegate.java $(LOCAL_PATH)/base/android/jni_generator/jni_generator.py $(LOCAL_PATH)/android_webview/build/jarjar-rules.txt $(GYP_TARGET_DEPENDENCIES)
	mkdir -p $(gyp_shared_intermediate_dir)/android_webview/jni; cd $(gyp_local_path)/android_webview/native; ../../base/android/jni_generator/jni_generator.py --input_file ../java/src/org/chromium/android_webview/AwWebContentsDelegate.java --output_dir "$(gyp_shared_intermediate_dir)/android_webview/jni" --includes base/android/jni_generator/jni_generator_helper.h --optimize_generation 0 --jarjar ../../android_webview/build/jarjar-rules.txt --ptr_type long


$(gyp_shared_intermediate_dir)/android_webview/jni/ExternalVideoSurfaceContainer_jni.h: gyp_local_path := $(LOCAL_PATH)
$(gyp_shared_intermediate_dir)/android_webview/jni/ExternalVideoSurfaceContainer_jni.h: gyp_var_prefix := $(GYP_VAR_PREFIX)
$(gyp_shared_intermediate_dir)/android_webview/jni/ExternalVideoSurfaceContainer_jni.h: gyp_intermediate_dir := $(abspath $(gyp_intermediate_dir))
$(gyp_shared_intermediate_dir)/android_webview/jni/ExternalVideoSurfaceContainer_jni.h: gyp_shared_intermediate_dir := $(abspath $(gyp_shared_intermediate_dir))
$(gyp_shared_intermediate_dir)/android_webview/jni/ExternalVideoSurfaceContainer_jni.h: export PATH := $(subst $(ANDROID_BUILD_PATHS),,$(PATH))
$(gyp_shared_intermediate_dir)/android_webview/jni/ExternalVideoSurfaceContainer_jni.h: $(LOCAL_PATH)/android_webview/java/src/org/chromium/android_webview/ExternalVideoSurfaceContainer.java $(LOCAL_PATH)/base/android/jni_generator/jni_generator.py $(LOCAL_PATH)/android_webview/build/jarjar-rules.txt $(GYP_TARGET_DEPENDENCIES)
	mkdir -p $(gyp_shared_intermediate_dir)/android_webview/jni; cd $(gyp_local_path)/android_webview/native; ../../base/android/jni_generator/jni_generator.py --input_file ../java/src/org/chromium/android_webview/ExternalVideoSurfaceContainer.java --output_dir "$(gyp_shared_intermediate_dir)/android_webview/jni" --includes base/android/jni_generator/jni_generator_helper.h --optimize_generation 0 --jarjar ../../android_webview/build/jarjar-rules.txt --ptr_type long


$(gyp_shared_intermediate_dir)/android_webview/jni/InterceptedRequestData_jni.h: gyp_local_path := $(LOCAL_PATH)
$(gyp_shared_intermediate_dir)/android_webview/jni/InterceptedRequestData_jni.h: gyp_var_prefix := $(GYP_VAR_PREFIX)
$(gyp_shared_intermediate_dir)/android_webview/jni/InterceptedRequestData_jni.h: gyp_intermediate_dir := $(abspath $(gyp_intermediate_dir))
$(gyp_shared_intermediate_dir)/android_webview/jni/InterceptedRequestData_jni.h: gyp_shared_intermediate_dir := $(abspath $(gyp_shared_intermediate_dir))
$(gyp_shared_intermediate_dir)/android_webview/jni/InterceptedRequestData_jni.h: export PATH := $(subst $(ANDROID_BUILD_PATHS),,$(PATH))
$(gyp_shared_intermediate_dir)/android_webview/jni/InterceptedRequestData_jni.h: $(LOCAL_PATH)/android_webview/java/src/org/chromium/android_webview/InterceptedRequestData.java $(LOCAL_PATH)/base/android/jni_generator/jni_generator.py $(LOCAL_PATH)/android_webview/build/jarjar-rules.txt $(GYP_TARGET_DEPENDENCIES)
	mkdir -p $(gyp_shared_intermediate_dir)/android_webview/jni; cd $(gyp_local_path)/android_webview/native; ../../base/android/jni_generator/jni_generator.py --input_file ../java/src/org/chromium/android_webview/InterceptedRequestData.java --output_dir "$(gyp_shared_intermediate_dir)/android_webview/jni" --includes base/android/jni_generator/jni_generator_helper.h --optimize_generation 0 --jarjar ../../android_webview/build/jarjar-rules.txt --ptr_type long


$(gyp_shared_intermediate_dir)/android_webview/jni/JavaBrowserViewRendererHelper_jni.h: gyp_local_path := $(LOCAL_PATH)
$(gyp_shared_intermediate_dir)/android_webview/jni/JavaBrowserViewRendererHelper_jni.h: gyp_var_prefix := $(GYP_VAR_PREFIX)
$(gyp_shared_intermediate_dir)/android_webview/jni/JavaBrowserViewRendererHelper_jni.h: gyp_intermediate_dir := $(abspath $(gyp_intermediate_dir))
$(gyp_shared_intermediate_dir)/android_webview/jni/JavaBrowserViewRendererHelper_jni.h: gyp_shared_intermediate_dir := $(abspath $(gyp_shared_intermediate_dir))
$(gyp_shared_intermediate_dir)/android_webview/jni/JavaBrowserViewRendererHelper_jni.h: export PATH := $(subst $(ANDROID_BUILD_PATHS),,$(PATH))
$(gyp_shared_intermediate_dir)/android_webview/jni/JavaBrowserViewRendererHelper_jni.h: $(LOCAL_PATH)/android_webview/java/src/org/chromium/android_webview/JavaBrowserViewRendererHelper.java $(LOCAL_PATH)/base/android/jni_generator/jni_generator.py $(LOCAL_PATH)/android_webview/build/jarjar-rules.txt $(GYP_TARGET_DEPENDENCIES)
	mkdir -p $(gyp_shared_intermediate_dir)/android_webview/jni; cd $(gyp_local_path)/android_webview/native; ../../base/android/jni_generator/jni_generator.py --input_file ../java/src/org/chromium/android_webview/JavaBrowserViewRendererHelper.java --output_dir "$(gyp_shared_intermediate_dir)/android_webview/jni" --includes base/android/jni_generator/jni_generator_helper.h --optimize_generation 0 --jarjar ../../android_webview/build/jarjar-rules.txt --ptr_type long


$(gyp_shared_intermediate_dir)/android_webview/jni/AwPermissionRequest_jni.h: gyp_local_path := $(LOCAL_PATH)
$(gyp_shared_intermediate_dir)/android_webview/jni/AwPermissionRequest_jni.h: gyp_var_prefix := $(GYP_VAR_PREFIX)
$(gyp_shared_intermediate_dir)/android_webview/jni/AwPermissionRequest_jni.h: gyp_intermediate_dir := $(abspath $(gyp_intermediate_dir))
$(gyp_shared_intermediate_dir)/android_webview/jni/AwPermissionRequest_jni.h: gyp_shared_intermediate_dir := $(abspath $(gyp_shared_intermediate_dir))
$(gyp_shared_intermediate_dir)/android_webview/jni/AwPermissionRequest_jni.h: export PATH := $(subst $(ANDROID_BUILD_PATHS),,$(PATH))
$(gyp_shared_intermediate_dir)/android_webview/jni/AwPermissionRequest_jni.h: $(LOCAL_PATH)/android_webview/java/src/org/chromium/android_webview/permission/AwPermissionRequest.java $(LOCAL_PATH)/base/android/jni_generator/jni_generator.py $(LOCAL_PATH)/android_webview/build/jarjar-rules.txt $(GYP_TARGET_DEPENDENCIES)
	mkdir -p $(gyp_shared_intermediate_dir)/android_webview/jni; cd $(gyp_local_path)/android_webview/native; ../../base/android/jni_generator/jni_generator.py --input_file ../java/src/org/chromium/android_webview/permission/AwPermissionRequest.java --output_dir "$(gyp_shared_intermediate_dir)/android_webview/jni" --includes base/android/jni_generator/jni_generator_helper.h --optimize_generation 0 --jarjar ../../android_webview/build/jarjar-rules.txt --ptr_type long



GYP_GENERATED_OUTPUTS := \
	$(gyp_shared_intermediate_dir)/android_webview/jni/AndroidProtocolHandler_jni.h \
	$(gyp_shared_intermediate_dir)/android_webview/jni/AwAutofillManagerDelegate_jni.h \
	$(gyp_shared_intermediate_dir)/android_webview/jni/AwContents_jni.h \
	$(gyp_shared_intermediate_dir)/android_webview/jni/AwContentsClientBridge_jni.h \
	$(gyp_shared_intermediate_dir)/android_webview/jni/AwContentsIoThreadClient_jni.h \
	$(gyp_shared_intermediate_dir)/android_webview/jni/AwContentsStatics_jni.h \
	$(gyp_shared_intermediate_dir)/android_webview/jni/AwCookieManager_jni.h \
	$(gyp_shared_intermediate_dir)/android_webview/jni/AwDevToolsServer_jni.h \
	$(gyp_shared_intermediate_dir)/android_webview/jni/AwFormDatabase_jni.h \
	$(gyp_shared_intermediate_dir)/android_webview/jni/AwHttpAuthHandler_jni.h \
	$(gyp_shared_intermediate_dir)/android_webview/jni/AwPdfExporter_jni.h \
	$(gyp_shared_intermediate_dir)/android_webview/jni/AwPicture_jni.h \
	$(gyp_shared_intermediate_dir)/android_webview/jni/AwQuotaManagerBridge_jni.h \
	$(gyp_shared_intermediate_dir)/android_webview/jni/AwResource_jni.h \
	$(gyp_shared_intermediate_dir)/android_webview/jni/AwSettings_jni.h \
	$(gyp_shared_intermediate_dir)/android_webview/jni/AwWebContentsDelegate_jni.h \
	$(gyp_shared_intermediate_dir)/android_webview/jni/ExternalVideoSurfaceContainer_jni.h \
	$(gyp_shared_intermediate_dir)/android_webview/jni/InterceptedRequestData_jni.h \
	$(gyp_shared_intermediate_dir)/android_webview/jni/JavaBrowserViewRendererHelper_jni.h \
	$(gyp_shared_intermediate_dir)/android_webview/jni/AwPermissionRequest_jni.h

# Make sure our deps and generated files are built first.
LOCAL_ADDITIONAL_DEPENDENCIES := $(GYP_TARGET_DEPENDENCIES) $(GYP_GENERATED_OUTPUTS)

LOCAL_GENERATED_SOURCES := \
	$(gyp_shared_intermediate_dir)/android_webview/jni/AndroidProtocolHandler_jni.h \
	$(gyp_shared_intermediate_dir)/android_webview/jni/AwAutofillManagerDelegate_jni.h \
	$(gyp_shared_intermediate_dir)/android_webview/jni/AwContents_jni.h \
	$(gyp_shared_intermediate_dir)/android_webview/jni/AwContentsClientBridge_jni.h \
	$(gyp_shared_intermediate_dir)/android_webview/jni/AwContentsIoThreadClient_jni.h \
	$(gyp_shared_intermediate_dir)/android_webview/jni/AwContentsStatics_jni.h \
	$(gyp_shared_intermediate_dir)/android_webview/jni/AwCookieManager_jni.h \
	$(gyp_shared_intermediate_dir)/android_webview/jni/AwDevToolsServer_jni.h \
	$(gyp_shared_intermediate_dir)/android_webview/jni/AwFormDatabase_jni.h \
	$(gyp_shared_intermediate_dir)/android_webview/jni/AwHttpAuthHandler_jni.h \
	$(gyp_shared_intermediate_dir)/android_webview/jni/AwPdfExporter_jni.h \
	$(gyp_shared_intermediate_dir)/android_webview/jni/AwPicture_jni.h \
	$(gyp_shared_intermediate_dir)/android_webview/jni/AwQuotaManagerBridge_jni.h \
	$(gyp_shared_intermediate_dir)/android_webview/jni/AwResource_jni.h \
	$(gyp_shared_intermediate_dir)/android_webview/jni/AwSettings_jni.h \
	$(gyp_shared_intermediate_dir)/android_webview/jni/AwWebContentsDelegate_jni.h \
	$(gyp_shared_intermediate_dir)/android_webview/jni/ExternalVideoSurfaceContainer_jni.h \
	$(gyp_shared_intermediate_dir)/android_webview/jni/InterceptedRequestData_jni.h \
	$(gyp_shared_intermediate_dir)/android_webview/jni/JavaBrowserViewRendererHelper_jni.h \
	$(gyp_shared_intermediate_dir)/android_webview/jni/AwPermissionRequest_jni.h

GYP_COPIED_SOURCE_ORIGIN_DIRS :=

LOCAL_SRC_FILES :=


# Flags passed to both C and C++ files.
MY_CFLAGS_Debug := \
	-fstack-protector \
	--param=ssp-buffer-size=4 \
	-Werror \
	-fno-exceptions \
	-fno-strict-aliasing \
	-Wall \
	-Wno-unused-parameter \
	-Wno-missing-field-initializers \
	-fvisibility=hidden \
	-pipe \
	-fPIC \
	-Wno-unused-local-typedefs \
	-m64 \
	-march=x86-64 \
	-ffunction-sections \
	-funwind-tables \
	-g \
	-fstack-protector \
	-fno-short-enums \
	-finline-limit=64 \
	-Wa,--noexecstack \
	-U_FORTIFY_SOURCE \
	-Wno-extra \
	-Wno-ignored-qualifiers \
	-Wno-type-limits \
	-Wno-unused-but-set-variable \
	-Os \
	-g \
	-fomit-frame-pointer \
	-fdata-sections \
	-ffunction-sections \
	-funwind-tables

MY_DEFS_Debug := \
	'-DV8_DEPRECATION_WARNINGS' \
	'-DBLINK_SCALE_FILTERS_AT_RECORD_TIME' \
	'-D_FILE_OFFSET_BITS=64' \
	'-DNO_TCMALLOC' \
	'-DDISABLE_NACL' \
	'-DCHROMIUM_BUILD' \
	'-DUSE_LIBJPEG_TURBO=1' \
	'-DENABLE_WEBRTC=1' \
	'-DUSE_PROPRIETARY_CODECS' \
	'-DENABLE_CONFIGURATION_POLICY' \
	'-DDISCARDABLE_MEMORY_ALWAYS_SUPPORTED_NATIVELY' \
	'-DSYSTEM_NATIVELY_SIGNALS_MEMORY_PRESSURE' \
	'-DENABLE_EGLIMAGE=1' \
	'-DCLD_VERSION=1' \
	'-DENABLE_PRINTING=1' \
	'-DENABLE_MANAGED_USERS=1' \
	'-DDATA_REDUCTION_FALLBACK_HOST="http://compress.googlezip.net:80/"' \
	'-DDATA_REDUCTION_DEV_HOST="http://proxy-dev.googlezip.net:80/"' \
	'-DSPDY_PROXY_AUTH_ORIGIN="https://proxy.googlezip.net:443/"' \
	'-DDATA_REDUCTION_PROXY_PROBE_URL="http://check.googlezip.net/connect"' \
	'-DVIDEO_HOLE=1' \
	'-DUSE_OPENSSL=1' \
	'-DUSE_OPENSSL_CERTS=1' \
	'-D__STDC_CONSTANT_MACROS' \
	'-D__STDC_FORMAT_MACROS' \
	'-DANDROID' \
	'-D__GNU_SOURCE=1' \
	'-DUSE_STLPORT=1' \
	'-D_STLP_USE_PTR_SPECIALIZATIONS=1' \
	'-DCHROME_BUILD_ID=""' \
	'-DDYNAMIC_ANNOTATIONS_ENABLED=1' \
	'-DWTF_USE_DYNAMIC_ANNOTATIONS=1' \
	'-D_DEBUG'


# Include paths placed before CFLAGS/CPPFLAGS
LOCAL_C_INCLUDES_Debug := \
	$(PWD)/frameworks/wilhelm/include \
	$(PWD)/bionic \
	$(PWD)/external/stlport/stlport


# Flags passed to only C++ (and not C) files.
LOCAL_CPPFLAGS_Debug := \
	-fno-rtti \
	-fno-threadsafe-statics \
	-fvisibility-inlines-hidden \
	-Wsign-compare \
	-Wno-non-virtual-dtor \
	-Wno-sign-promo


# Flags passed to both C and C++ files.
MY_CFLAGS_Release := \
	-fstack-protector \
	--param=ssp-buffer-size=4 \
	-Werror \
	-fno-exceptions \
	-fno-strict-aliasing \
	-Wall \
	-Wno-unused-parameter \
	-Wno-missing-field-initializers \
	-fvisibility=hidden \
	-pipe \
	-fPIC \
	-Wno-unused-local-typedefs \
	-m64 \
	-march=x86-64 \
	-ffunction-sections \
	-funwind-tables \
	-g \
	-fstack-protector \
	-fno-short-enums \
	-finline-limit=64 \
	-Wa,--noexecstack \
	-U_FORTIFY_SOURCE \
	-Wno-extra \
	-Wno-ignored-qualifiers \
	-Wno-type-limits \
	-Wno-unused-but-set-variable \
	-Os \
	-fno-ident \
	-fdata-sections \
	-ffunction-sections \
	-fomit-frame-pointer \
	-funwind-tables

MY_DEFS_Release := \
	'-DV8_DEPRECATION_WARNINGS' \
	'-DBLINK_SCALE_FILTERS_AT_RECORD_TIME' \
	'-D_FILE_OFFSET_BITS=64' \
	'-DNO_TCMALLOC' \
	'-DDISABLE_NACL' \
	'-DCHROMIUM_BUILD' \
	'-DUSE_LIBJPEG_TURBO=1' \
	'-DENABLE_WEBRTC=1' \
	'-DUSE_PROPRIETARY_CODECS' \
	'-DENABLE_CONFIGURATION_POLICY' \
	'-DDISCARDABLE_MEMORY_ALWAYS_SUPPORTED_NATIVELY' \
	'-DSYSTEM_NATIVELY_SIGNALS_MEMORY_PRESSURE' \
	'-DENABLE_EGLIMAGE=1' \
	'-DCLD_VERSION=1' \
	'-DENABLE_PRINTING=1' \
	'-DENABLE_MANAGED_USERS=1' \
	'-DDATA_REDUCTION_FALLBACK_HOST="http://compress.googlezip.net:80/"' \
	'-DDATA_REDUCTION_DEV_HOST="http://proxy-dev.googlezip.net:80/"' \
	'-DSPDY_PROXY_AUTH_ORIGIN="https://proxy.googlezip.net:443/"' \
	'-DDATA_REDUCTION_PROXY_PROBE_URL="http://check.googlezip.net/connect"' \
	'-DVIDEO_HOLE=1' \
	'-DUSE_OPENSSL=1' \
	'-DUSE_OPENSSL_CERTS=1' \
	'-D__STDC_CONSTANT_MACROS' \
	'-D__STDC_FORMAT_MACROS' \
	'-DANDROID' \
	'-D__GNU_SOURCE=1' \
	'-DUSE_STLPORT=1' \
	'-D_STLP_USE_PTR_SPECIALIZATIONS=1' \
	'-DCHROME_BUILD_ID=""' \
	'-DNDEBUG' \
	'-DNVALGRIND' \
	'-DDYNAMIC_ANNOTATIONS_ENABLED=0' \
	'-D_FORTIFY_SOURCE=2'


# Include paths placed before CFLAGS/CPPFLAGS
LOCAL_C_INCLUDES_Release := \
	$(PWD)/frameworks/wilhelm/include \
	$(PWD)/bionic \
	$(PWD)/external/stlport/stlport


# Flags passed to only C++ (and not C) files.
LOCAL_CPPFLAGS_Release := \
	-fno-rtti \
	-fno-threadsafe-statics \
	-fvisibility-inlines-hidden \
	-Wsign-compare \
	-Wno-non-virtual-dtor \
	-Wno-sign-promo


LOCAL_CFLAGS := $(MY_CFLAGS_$(GYP_CONFIGURATION)) $(MY_DEFS_$(GYP_CONFIGURATION))
LOCAL_C_INCLUDES := $(GYP_COPIED_SOURCE_ORIGIN_DIRS) $(LOCAL_C_INCLUDES_$(GYP_CONFIGURATION))
LOCAL_CPPFLAGS := $(LOCAL_CPPFLAGS_$(GYP_CONFIGURATION))
LOCAL_ASFLAGS := $(LOCAL_CFLAGS)
### Rules for final target.
# Add target alias to "gyp_all_modules" target.
.PHONY: gyp_all_modules
gyp_all_modules: android_webview_native_android_webview_native_jni_gyp

# Alias gyp target name.
.PHONY: android_webview_native_jni
android_webview_native_jni: android_webview_native_android_webview_native_jni_gyp

LOCAL_MODULE_PATH := $(PRODUCT_OUT)/gyp_stamp
LOCAL_UNINSTALLABLE_MODULE := true
LOCAL_2ND_ARCH_VAR_PREFIX := $(GYP_VAR_PREFIX)

include $(BUILD_SYSTEM)/base_rules.mk

$(LOCAL_BUILT_MODULE): $(LOCAL_ADDITIONAL_DEPENDENCIES)
	$(hide) echo "Gyp timestamp: $@"
	$(hide) mkdir -p $(dir $@)
	$(hide) touch $@

LOCAL_2ND_ARCH_VAR_PREFIX :=
