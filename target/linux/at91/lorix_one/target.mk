BOARDNAME:=LORIX ONE 256MB(Cortex-A5)
CPU_TYPE:=cortex-a5
CPU_SUBTYPE:=neon-vfpv4
FEATURES+=fpu
DEFAULT_PACKAGES += kmod-usb2 kmod-spi-dev kmod-atmel-usba-udc kmod-usb-serial kmod-usb-gadget-serial
SUBTARGET:=lorix_one

define Target/Description
	Build generic firmware for LORIX ONE 256 MB HW < 1.0d
	using the ARMv7 instruction set.
endef
