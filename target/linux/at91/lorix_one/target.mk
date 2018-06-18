BOARDNAME:=LORIX ONE(Cortex-A5)
CPU_TYPE:=cortex-a5
CPU_SUBTYPE:=neon-vfpv4
FEATURES+=fpu
DEFAULT_PACKAGES += kmod-usb2 kmod-spi-dev kmod-atmel-usba-udc

define Target/Description
	Build generic firmware for LORIX ONE
	using the ARMv7 instruction set.
endef
