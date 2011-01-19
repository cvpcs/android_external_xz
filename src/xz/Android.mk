LOCAL_PATH:= $(call my-dir)

# ========================================================
# xz
# ========================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
	../common/tuklib_open_stdxxx.c \
	../common/tuklib_progname.c \
	../common/tuklib_exit.c \
	../common/tuklib_cpucores.c \
	../common/tuklib_mbstr_width.c \
	../common/tuklib_mbstr_fw.c \
	util.c \
	suffix.c \
	signals.c \
	options.c \
	message.c \
	main.c \
	list.c \
	hardware.c \
	file_io.c \
	coder.c \
	args.c
LOCAL_C_INCLUDES += \
	$(LOCAL_PATH)/../../ \
	$(LOCAL_PATH)/../common \
	$(LOCAL_PATH)/../liblzma/api \
	$(LOCAL_PATH)/../liblzma/check \
	$(LOCAL_PATH)/../liblzma/common \
	$(LOCAL_PATH)/../liblzma/delta \
	$(LOCAL_PATH)/../liblzma/lz \
	$(LOCAL_PATH)/../liblzma/lzma \
	$(LOCAL_PATH)/../liblzma/rangecoder \
	$(LOCAL_PATH)/../liblzma/simple \
	$(LOCAL_PATH)

LOCAL_CFLAGS += \
	-DHAVE_CONFIG_H \
	-std=c99

LOCAL_MODULE:= xz
LOCAL_PRELINK_MODULE := false
LOCAL_STATIC_LIBRARIES := liblzma
LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)

include $(BUILD_EXECUTABLE)

# make some symlinks
XZ_LINKS := lzcat lzma unlzma unxz xzcat
XZ_SYMLINKS := $(addprefix $(TARGET_OUT_OPTIONAL_EXECUTABLES)/,$(XZ_LINKS))
$(XZ_SYMLINKS): XZ_BINARY := $(LOCAL_MODULE)
$(XZ_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Symlink: $@ -> $(XZ_BINARY)"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf $(XZ_BINARY) $@
ALL_DEFAULT_INSTALLED_MODULES += $(XZ_SYMLINKS)

# ========================================================
# libxz.a (used for recovery)
# ========================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
	../common/tuklib_open_stdxxx.c \
	../common/tuklib_progname.c \
	../common/tuklib_exit.c \
	../common/tuklib_cpucores.c \
	../common/tuklib_mbstr_width.c \
	../common/tuklib_mbstr_fw.c \
	util.c \
	suffix.c \
	signals.c \
	options.c \
	message.c \
	main.c \
	list.c \
	hardware.c \
	file_io.c \
	coder.c \
	args.c
LOCAL_C_INCLUDES += \
	$(LOCAL_PATH)/../../ \
	$(LOCAL_PATH)/../common \
	$(LOCAL_PATH)/../liblzma/api \
	$(LOCAL_PATH)/../liblzma/check \
	$(LOCAL_PATH)/../liblzma/common \
	$(LOCAL_PATH)/../liblzma/delta \
	$(LOCAL_PATH)/../liblzma/lz \
	$(LOCAL_PATH)/../liblzma/lzma \
	$(LOCAL_PATH)/../liblzma/rangecoder \
	$(LOCAL_PATH)/../liblzma/simple \
	$(LOCAL_PATH)

LOCAL_CFLAGS += \
	-DHAVE_CONFIG_H \
	-std=c99 \
	-Dmain=xz_main \
	-Dxstrdup=xz_xstrdup \
	-Dxrealloc=xz_xrealloc

LOCAL_MODULE:= libxz
LOCAL_PRELINK_MODULE := false
LOCAL_STATIC_LIBRARIES := liblzma

include $(BUILD_STATIC_LIBRARY)
