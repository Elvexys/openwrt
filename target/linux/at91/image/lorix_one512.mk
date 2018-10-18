
define Device/default-nand
  BLOCKSIZE := 128k
  PAGESIZE := 2048
  SUBPAGESIZE := 2048
  MKUBIFS_OPTS := -m $$(PAGESIZE) -e 124KiB -c 2048
endef

define Device/at91-sama5d4_lorix_one512
  DEVICE_DTS := at91-sama5d4_lorix_one_512
  $(Device/evaluation-dtb)
  $(Device/sysupgrade-dtb-512)
  DEVICE_TITLE := Microchip(Atmel AT91) LORIX One 512MB
  KERNEL_SIZE := 6144k
  BLOCKSIZE := 256k
  PAGESIZE := 4096
  SUBPAGESIZE := 4096
  MKUBIFS_OPTS := -m $$(PAGESIZE) -e 0x3e000 -c 4096
  UBINIZE_OPTS := -m $$(PAGESIZE) -p 0x40000 -s 4096
endef
TARGET_DEVICES += at91-sama5d4_lorix_one512
