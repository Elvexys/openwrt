
define Device/default-nand
  BLOCKSIZE := 128k
  PAGESIZE := 2048
  SUBPAGESIZE := 2048
  MKUBIFS_OPTS := -m $$(PAGESIZE) -e 124KiB -c 2048
endef

define Device/at91-sama5d4_wifx_l1
  DEVICE_DTS := l1
  $(Device/evaluation-dtb)
  $(Device/sysupgrade-dtb-l1)
  DEVICE_TITLE := Microchip(Atmel AT91) Wifx L1
  KERNEL_SIZE := 6144k
  BLOCKSIZE := 256k
  PAGESIZE := 2048
  SUBPAGESIZE := 4096
  MKUBIFS_OPTS := -m $$(PAGESIZE) -e 0x1f000 -c 4000
  UBINIZE_OPTS := -m $$(PAGESIZE) -p 0x20000 -s 2048
endef
TARGET_DEVICES += at91-sama5d4_wifx_l1
