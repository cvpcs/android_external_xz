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

include $(BUILD_EXECUTABLE)

