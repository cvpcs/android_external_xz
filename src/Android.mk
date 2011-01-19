LOCAL_PATH:= $(call my-dir)

# ========================================================
# liblzma.a
# ========================================================
include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
	common/tuklib_physmem.c \
	liblzma/common/common.c \
	liblzma/common/block_util.c \
	liblzma/common/easy_preset.c \
	liblzma/common/filter_common.c \
	liblzma/common/hardware_physmem.c \
	liblzma/common/index.c \
	liblzma/common/stream_flags_common.c \
	liblzma/common/vli_size.c \
	liblzma/common/alone_encoder.c \
	liblzma/common/block_buffer_encoder.c \
	liblzma/common/block_encoder.c \
	liblzma/common/block_header_encoder.c \
	liblzma/common/easy_buffer_encoder.c \
	liblzma/common/easy_encoder.c \
	liblzma/common/easy_encoder_memusage.c \
	liblzma/common/filter_buffer_encoder.c \
	liblzma/common/filter_encoder.c \
	liblzma/common/filter_flags_encoder.c \
	liblzma/common/index_encoder.c \
	liblzma/common/stream_buffer_encoder.c \
	liblzma/common/stream_encoder.c \
	liblzma/common/stream_flags_encoder.c \
	liblzma/common/vli_encoder.c \
	liblzma/common/alone_decoder.c \
	liblzma/common/auto_decoder.c \
	liblzma/common/block_buffer_decoder.c \
	liblzma/common/block_decoder.c \
	liblzma/common/block_header_decoder.c \
	liblzma/common/easy_decoder_memusage.c \
	liblzma/common/filter_buffer_decoder.c \
	liblzma/common/filter_decoder.c \
	liblzma/common/filter_flags_decoder.c \
	liblzma/common/index_decoder.c \
	liblzma/common/index_hash.c \
	liblzma/common/stream_buffer_decoder.c \
	liblzma/common/stream_decoder.c \
	liblzma/common/stream_flags_decoder.c \
	liblzma/common/vli_decoder.c \
	liblzma/check/check.c \
	liblzma/check/crc32_small.c \
	liblzma/check/crc64_small.c \
	liblzma/check/sha256.c \
	liblzma/lz/lz_encoder.c \
	liblzma/lz/lz_encoder_mf.c \
	liblzma/lz/lz_decoder.c \
	liblzma/lzma/lzma_encoder.c \
	liblzma/lzma/lzma_encoder_presets.c \
	liblzma/lzma/lzma_encoder_optimum_fast.c \
	liblzma/lzma/lzma_encoder_optimum_normal.c \
	liblzma/lzma/lzma_decoder.c \
	liblzma/lzma/lzma2_encoder.c \
	liblzma/lzma/lzma2_decoder.c \
	liblzma/rangecoder/price_table.c \
	liblzma/delta/delta_common.c \
	liblzma/delta/delta_encoder.c \
	liblzma/delta/delta_decoder.c \
	liblzma/simple/simple_coder.c \
	liblzma/simple/simple_encoder.c \
	liblzma/simple/simple_decoder.c \
	liblzma/simple/x86.c \
	liblzma/simple/powerpc.c \
	liblzma/simple/ia64.c \
	liblzma/simple/arm.c \
	liblzma/simple/armthumb.c \
	liblzma/simple/sparc.c

LOCAL_C_INCLUDES += \
	$(LOCAL_PATH)/../ \
	$(LOCAL_PATH)/common \
	$(LOCAL_PATH)/liblzma/api \
	$(LOCAL_PATH)/liblzma/check \
	$(LOCAL_PATH)/liblzma/common \
	$(LOCAL_PATH)/liblzma/delta \
	$(LOCAL_PATH)/liblzma/lz \
	$(LOCAL_PATH)/liblzma/lzma \
	$(LOCAL_PATH)/liblzma/rangecoder \
	$(LOCAL_PATH)/liblzma/simple \
	$(LOCAL_PATH)

LOCAL_CFLAGS += \
	-DHAVE_CONFIG_H \
	-std=c99

LOCAL_MODULE:= liblzma
LOCAL_PRELINK_MODULE := false

include $(BUILD_STATIC_LIBRARY)

