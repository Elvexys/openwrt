#
# Copyright (C) 2006-2013 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

ARCH:=arm
BOARD:=at91
MAINTAINER:=Claudio Mignanti <c.mignanti@gmail.com>
BOARDNAME:=Microchip (Atmel AT91)
FEATURES:=ext4 squashfs targz usb usbgadget ubifs
SUBTARGETS:=sama5d2 sama5d3 sama5d4 lorix_one lorix_one512 wifx_l1 legacy

# use new kernel version with usbc support for wifx l1
ifeq ($(SUBTARGET),wifx_l1)
KERNEL_PATCHVER:=4.14
else
KERNEL_PATCHVER:=4.9
endif

include $(INCLUDE_DIR)/target.mk

KERNELNAME:=zImage dtbs

DEFAULT_PACKAGES += kmod-usb-ohci

$(eval $(call BuildTarget))
