
#
# Makefile for the Novatek NT36xxx touchscreen driver.
#

# Each configuration option enables a list of files.

ifneq ($(filter m y,$(CONFIG_INPUT_NOVA_0FLASH_MMI_ENABLE_DOUBLE_TAP)),)
	EXTRA_CFLAGS += -DNVT_SENSOR_EN
endif
ifneq ($(filter m y,$(CONFIG_INPUT_NOVA_PANEL_NOTIFICATIONS)),)
EXTRA_CFLAGS += -DNVT_CONFIG_PANEL_NOTIFICATIONS
endif

obj-$(CONFIG_TOUCHSCREEN_NT36xxx) += nt36xxx.o nt36xxx_fw_update.o nt36xxx_ext_proc.o nt36xxx_mp_ctrlram.o 