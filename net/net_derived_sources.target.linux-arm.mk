# This file is generated by gyp; do not edit.

include $(CLEAR_VARS)

LOCAL_MODULE_CLASS := GYP
LOCAL_MODULE := net_net_derived_sources_gyp
LOCAL_MODULE_STEM := net_derived_sources
LOCAL_MODULE_SUFFIX := .stamp
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_TARGET_ARCH := $(TARGET_$(GYP_VAR_PREFIX)ARCH)
gyp_intermediate_dir := $(call local-intermediates-dir,,$(GYP_VAR_PREFIX))
gyp_shared_intermediate_dir := $(call intermediates-dir-for,GYP,shared,,,$(GYP_VAR_PREFIX))

# Make sure our deps are built first.
GYP_TARGET_DEPENDENCIES :=


### Generated for rule "net_net_gyp_net_derived_sources_target_dafsa":
# "{'inputs': ['tools/tld_cleanup/make_dafsa.py'], 'extension': 'gperf', 'rule_sources': ['base/registry_controlled_domains/effective_tld_names.gperf', 'base/registry_controlled_domains/effective_tld_names_unittest1.gperf', 'base/registry_controlled_domains/effective_tld_names_unittest2.gperf', 'base/registry_controlled_domains/effective_tld_names_unittest3.gperf', 'base/registry_controlled_domains/effective_tld_names_unittest4.gperf', 'base/registry_controlled_domains/effective_tld_names_unittest5.gperf', 'base/registry_controlled_domains/effective_tld_names_unittest6.gperf'], 'rule_name': 'dafsa', 'outputs': ['$(gyp_shared_intermediate_dir)/net/%(INPUT_DIRNAME)s/%(INPUT_ROOT)s-inc.cc'], 'action': ['python', 'tools/tld_cleanup/make_dafsa.py', '$(RULE_SOURCES)', '$(gyp_shared_intermediate_dir)/net/%(INPUT_DIRNAME)s/%(INPUT_ROOT)s-inc.cc']}":
$(gyp_shared_intermediate_dir)/net/base/registry_controlled_domains/effective_tld_names-inc.cc: gyp_local_path := $(LOCAL_PATH)
$(gyp_shared_intermediate_dir)/net/base/registry_controlled_domains/effective_tld_names-inc.cc: gyp_var_prefix := $(GYP_VAR_PREFIX)
$(gyp_shared_intermediate_dir)/net/base/registry_controlled_domains/effective_tld_names-inc.cc: gyp_intermediate_dir := $(abspath $(gyp_intermediate_dir))
$(gyp_shared_intermediate_dir)/net/base/registry_controlled_domains/effective_tld_names-inc.cc: gyp_shared_intermediate_dir := $(abspath $(gyp_shared_intermediate_dir))
$(gyp_shared_intermediate_dir)/net/base/registry_controlled_domains/effective_tld_names-inc.cc: export PATH := $(subst $(ANDROID_BUILD_PATHS),,$(PATH))
$(gyp_shared_intermediate_dir)/net/base/registry_controlled_domains/effective_tld_names-inc.cc: $(LOCAL_PATH)/net/base/registry_controlled_domains/effective_tld_names.gperf $(LOCAL_PATH)/net/tools/tld_cleanup/make_dafsa.py $(GYP_TARGET_DEPENDENCIES)
	mkdir -p $(gyp_shared_intermediate_dir)/net/base/registry_controlled_domains; cd $(gyp_local_path)/net; python tools/tld_cleanup/make_dafsa.py base/registry_controlled_domains/effective_tld_names.gperf "$(gyp_shared_intermediate_dir)/net/base/registry_controlled_domains/effective_tld_names-inc.cc"


$(gyp_shared_intermediate_dir)/net/base/registry_controlled_domains/effective_tld_names_unittest1-inc.cc: gyp_local_path := $(LOCAL_PATH)
$(gyp_shared_intermediate_dir)/net/base/registry_controlled_domains/effective_tld_names_unittest1-inc.cc: gyp_var_prefix := $(GYP_VAR_PREFIX)
$(gyp_shared_intermediate_dir)/net/base/registry_controlled_domains/effective_tld_names_unittest1-inc.cc: gyp_intermediate_dir := $(abspath $(gyp_intermediate_dir))
$(gyp_shared_intermediate_dir)/net/base/registry_controlled_domains/effective_tld_names_unittest1-inc.cc: gyp_shared_intermediate_dir := $(abspath $(gyp_shared_intermediate_dir))
$(gyp_shared_intermediate_dir)/net/base/registry_controlled_domains/effective_tld_names_unittest1-inc.cc: export PATH := $(subst $(ANDROID_BUILD_PATHS),,$(PATH))
$(gyp_shared_intermediate_dir)/net/base/registry_controlled_domains/effective_tld_names_unittest1-inc.cc: $(LOCAL_PATH)/net/base/registry_controlled_domains/effective_tld_names_unittest1.gperf $(LOCAL_PATH)/net/tools/tld_cleanup/make_dafsa.py $(GYP_TARGET_DEPENDENCIES)
	mkdir -p $(gyp_shared_intermediate_dir)/net/base/registry_controlled_domains; cd $(gyp_local_path)/net; python tools/tld_cleanup/make_dafsa.py base/registry_controlled_domains/effective_tld_names_unittest1.gperf "$(gyp_shared_intermediate_dir)/net/base/registry_controlled_domains/effective_tld_names_unittest1-inc.cc"


$(gyp_shared_intermediate_dir)/net/base/registry_controlled_domains/effective_tld_names_unittest2-inc.cc: gyp_local_path := $(LOCAL_PATH)
$(gyp_shared_intermediate_dir)/net/base/registry_controlled_domains/effective_tld_names_unittest2-inc.cc: gyp_var_prefix := $(GYP_VAR_PREFIX)
$(gyp_shared_intermediate_dir)/net/base/registry_controlled_domains/effective_tld_names_unittest2-inc.cc: gyp_intermediate_dir := $(abspath $(gyp_intermediate_dir))
$(gyp_shared_intermediate_dir)/net/base/registry_controlled_domains/effective_tld_names_unittest2-inc.cc: gyp_shared_intermediate_dir := $(abspath $(gyp_shared_intermediate_dir))
$(gyp_shared_intermediate_dir)/net/base/registry_controlled_domains/effective_tld_names_unittest2-inc.cc: export PATH := $(subst $(ANDROID_BUILD_PATHS),,$(PATH))
$(gyp_shared_intermediate_dir)/net/base/registry_controlled_domains/effective_tld_names_unittest2-inc.cc: $(LOCAL_PATH)/net/base/registry_controlled_domains/effective_tld_names_unittest2.gperf $(LOCAL_PATH)/net/tools/tld_cleanup/make_dafsa.py $(GYP_TARGET_DEPENDENCIES)
	mkdir -p $(gyp_shared_intermediate_dir)/net/base/registry_controlled_domains; cd $(gyp_local_path)/net; python tools/tld_cleanup/make_dafsa.py base/registry_controlled_domains/effective_tld_names_unittest2.gperf "$(gyp_shared_intermediate_dir)/net/base/registry_controlled_domains/effective_tld_names_unittest2-inc.cc"


$(gyp_shared_intermediate_dir)/net/base/registry_controlled_domains/effective_tld_names_unittest3-inc.cc: gyp_local_path := $(LOCAL_PATH)
$(gyp_shared_intermediate_dir)/net/base/registry_controlled_domains/effective_tld_names_unittest3-inc.cc: gyp_var_prefix := $(GYP_VAR_PREFIX)
$(gyp_shared_intermediate_dir)/net/base/registry_controlled_domains/effective_tld_names_unittest3-inc.cc: gyp_intermediate_dir := $(abspath $(gyp_intermediate_dir))
$(gyp_shared_intermediate_dir)/net/base/registry_controlled_domains/effective_tld_names_unittest3-inc.cc: gyp_shared_intermediate_dir := $(abspath $(gyp_shared_intermediate_dir))
$(gyp_shared_intermediate_dir)/net/base/registry_controlled_domains/effective_tld_names_unittest3-inc.cc: export PATH := $(subst $(ANDROID_BUILD_PATHS),,$(PATH))
$(gyp_shared_intermediate_dir)/net/base/registry_controlled_domains/effective_tld_names_unittest3-inc.cc: $(LOCAL_PATH)/net/base/registry_controlled_domains/effective_tld_names_unittest3.gperf $(LOCAL_PATH)/net/tools/tld_cleanup/make_dafsa.py $(GYP_TARGET_DEPENDENCIES)
	mkdir -p $(gyp_shared_intermediate_dir)/net/base/registry_controlled_domains; cd $(gyp_local_path)/net; python tools/tld_cleanup/make_dafsa.py base/registry_controlled_domains/effective_tld_names_unittest3.gperf "$(gyp_shared_intermediate_dir)/net/base/registry_controlled_domains/effective_tld_names_unittest3-inc.cc"


$(gyp_shared_intermediate_dir)/net/base/registry_controlled_domains/effective_tld_names_unittest4-inc.cc: gyp_local_path := $(LOCAL_PATH)
$(gyp_shared_intermediate_dir)/net/base/registry_controlled_domains/effective_tld_names_unittest4-inc.cc: gyp_var_prefix := $(GYP_VAR_PREFIX)
$(gyp_shared_intermediate_dir)/net/base/registry_controlled_domains/effective_tld_names_unittest4-inc.cc: gyp_intermediate_dir := $(abspath $(gyp_intermediate_dir))
$(gyp_shared_intermediate_dir)/net/base/registry_controlled_domains/effective_tld_names_unittest4-inc.cc: gyp_shared_intermediate_dir := $(abspath $(gyp_shared_intermediate_dir))
$(gyp_shared_intermediate_dir)/net/base/registry_controlled_domains/effective_tld_names_unittest4-inc.cc: export PATH := $(subst $(ANDROID_BUILD_PATHS),,$(PATH))
$(gyp_shared_intermediate_dir)/net/base/registry_controlled_domains/effective_tld_names_unittest4-inc.cc: $(LOCAL_PATH)/net/base/registry_controlled_domains/effective_tld_names_unittest4.gperf $(LOCAL_PATH)/net/tools/tld_cleanup/make_dafsa.py $(GYP_TARGET_DEPENDENCIES)
	mkdir -p $(gyp_shared_intermediate_dir)/net/base/registry_controlled_domains; cd $(gyp_local_path)/net; python tools/tld_cleanup/make_dafsa.py base/registry_controlled_domains/effective_tld_names_unittest4.gperf "$(gyp_shared_intermediate_dir)/net/base/registry_controlled_domains/effective_tld_names_unittest4-inc.cc"


$(gyp_shared_intermediate_dir)/net/base/registry_controlled_domains/effective_tld_names_unittest5-inc.cc: gyp_local_path := $(LOCAL_PATH)
$(gyp_shared_intermediate_dir)/net/base/registry_controlled_domains/effective_tld_names_unittest5-inc.cc: gyp_var_prefix := $(GYP_VAR_PREFIX)
$(gyp_shared_intermediate_dir)/net/base/registry_controlled_domains/effective_tld_names_unittest5-inc.cc: gyp_intermediate_dir := $(abspath $(gyp_intermediate_dir))
$(gyp_shared_intermediate_dir)/net/base/registry_controlled_domains/effective_tld_names_unittest5-inc.cc: gyp_shared_intermediate_dir := $(abspath $(gyp_shared_intermediate_dir))
$(gyp_shared_intermediate_dir)/net/base/registry_controlled_domains/effective_tld_names_unittest5-inc.cc: export PATH := $(subst $(ANDROID_BUILD_PATHS),,$(PATH))
$(gyp_shared_intermediate_dir)/net/base/registry_controlled_domains/effective_tld_names_unittest5-inc.cc: $(LOCAL_PATH)/net/base/registry_controlled_domains/effective_tld_names_unittest5.gperf $(LOCAL_PATH)/net/tools/tld_cleanup/make_dafsa.py $(GYP_TARGET_DEPENDENCIES)
	mkdir -p $(gyp_shared_intermediate_dir)/net/base/registry_controlled_domains; cd $(gyp_local_path)/net; python tools/tld_cleanup/make_dafsa.py base/registry_controlled_domains/effective_tld_names_unittest5.gperf "$(gyp_shared_intermediate_dir)/net/base/registry_controlled_domains/effective_tld_names_unittest5-inc.cc"


$(gyp_shared_intermediate_dir)/net/base/registry_controlled_domains/effective_tld_names_unittest6-inc.cc: gyp_local_path := $(LOCAL_PATH)
$(gyp_shared_intermediate_dir)/net/base/registry_controlled_domains/effective_tld_names_unittest6-inc.cc: gyp_var_prefix := $(GYP_VAR_PREFIX)
$(gyp_shared_intermediate_dir)/net/base/registry_controlled_domains/effective_tld_names_unittest6-inc.cc: gyp_intermediate_dir := $(abspath $(gyp_intermediate_dir))
$(gyp_shared_intermediate_dir)/net/base/registry_controlled_domains/effective_tld_names_unittest6-inc.cc: gyp_shared_intermediate_dir := $(abspath $(gyp_shared_intermediate_dir))
$(gyp_shared_intermediate_dir)/net/base/registry_controlled_domains/effective_tld_names_unittest6-inc.cc: export PATH := $(subst $(ANDROID_BUILD_PATHS),,$(PATH))
$(gyp_shared_intermediate_dir)/net/base/registry_controlled_domains/effective_tld_names_unittest6-inc.cc: $(LOCAL_PATH)/net/base/registry_controlled_domains/effective_tld_names_unittest6.gperf $(LOCAL_PATH)/net/tools/tld_cleanup/make_dafsa.py $(GYP_TARGET_DEPENDENCIES)
	mkdir -p $(gyp_shared_intermediate_dir)/net/base/registry_controlled_domains; cd $(gyp_local_path)/net; python tools/tld_cleanup/make_dafsa.py base/registry_controlled_domains/effective_tld_names_unittest6.gperf "$(gyp_shared_intermediate_dir)/net/base/registry_controlled_domains/effective_tld_names_unittest6-inc.cc"



GYP_GENERATED_OUTPUTS := \
	$(gyp_shared_intermediate_dir)/net/base/registry_controlled_domains/effective_tld_names-inc.cc \
	$(gyp_shared_intermediate_dir)/net/base/registry_controlled_domains/effective_tld_names_unittest1-inc.cc \
	$(gyp_shared_intermediate_dir)/net/base/registry_controlled_domains/effective_tld_names_unittest2-inc.cc \
	$(gyp_shared_intermediate_dir)/net/base/registry_controlled_domains/effective_tld_names_unittest3-inc.cc \
	$(gyp_shared_intermediate_dir)/net/base/registry_controlled_domains/effective_tld_names_unittest4-inc.cc \
	$(gyp_shared_intermediate_dir)/net/base/registry_controlled_domains/effective_tld_names_unittest5-inc.cc \
	$(gyp_shared_intermediate_dir)/net/base/registry_controlled_domains/effective_tld_names_unittest6-inc.cc

# Make sure our deps and generated files are built first.
LOCAL_ADDITIONAL_DEPENDENCIES := $(GYP_TARGET_DEPENDENCIES) $(GYP_GENERATED_OUTPUTS)

LOCAL_GENERATED_SOURCES :=

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
	-fno-tree-sra \
	-fno-partial-inlining \
	-fno-early-inlining \
	-fno-tree-copy-prop \
	-fno-tree-loop-optimize \
	-fno-move-loop-invariants \
	-fno-caller-saves \
	-Wno-psabi \
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
	-Wno-abi \
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
	-fno-tree-sra \
	-fno-partial-inlining \
	-fno-early-inlining \
	-fno-tree-copy-prop \
	-fno-tree-loop-optimize \
	-fno-move-loop-invariants \
	-fno-caller-saves \
	-Wno-psabi \
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
	-Wno-abi \
	-Wno-non-virtual-dtor \
	-Wno-sign-promo


LOCAL_CFLAGS := $(MY_CFLAGS_$(GYP_CONFIGURATION)) $(MY_DEFS_$(GYP_CONFIGURATION))
LOCAL_C_INCLUDES := $(GYP_COPIED_SOURCE_ORIGIN_DIRS) $(LOCAL_C_INCLUDES_$(GYP_CONFIGURATION))
LOCAL_CPPFLAGS := $(LOCAL_CPPFLAGS_$(GYP_CONFIGURATION))
LOCAL_ASFLAGS := $(LOCAL_CFLAGS)
### Rules for final target.
# Add target alias to "gyp_all_modules" target.
.PHONY: gyp_all_modules
gyp_all_modules: net_net_derived_sources_gyp

# Alias gyp target name.
.PHONY: net_derived_sources
net_derived_sources: net_net_derived_sources_gyp

LOCAL_MODULE_PATH := $(PRODUCT_OUT)/gyp_stamp
LOCAL_UNINSTALLABLE_MODULE := true
LOCAL_2ND_ARCH_VAR_PREFIX := $(GYP_VAR_PREFIX)

include $(BUILD_SYSTEM)/base_rules.mk

$(LOCAL_BUILT_MODULE): $(LOCAL_ADDITIONAL_DEPENDENCIES)
	$(hide) echo "Gyp timestamp: $@"
	$(hide) mkdir -p $(dir $@)
	$(hide) touch $@

LOCAL_2ND_ARCH_VAR_PREFIX :=
