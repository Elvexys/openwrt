BOARDNAME:=WIFX_L1(Cortex-A5)
CPU_TYPE:=cortex-a5
CPU_SUBTYPE:=neon-vfpv4
FEATURES+=fpu
DEFAULT_PACKAGES += kmod-usb2 kmod-spi-dev kmod-atmel-usba-udc kmod-usb-serial kmod-usb-gadget-serial
SUBTARGET:=wifx_l1

define Target/Description
	Build generic firmware for WIFX L1
	using the ARMv7 instruction set.
endef
