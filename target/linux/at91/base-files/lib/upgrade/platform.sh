#
# Copyright (C) 2016 OpenWrt.org
#

platform_do_upgrade() {
	local tar_file="$1"
	local board="$(cat /tmp/sysinfo/board_name)"

	case "$board" in
	at91-sama5d4_lorix_one)
		nand_do_upgrade $1
		;;
	at91-sama5d4_lorix_one512)
		nand_do_upgrade $1
		;;
	at91-sama5d4_wifx_l1)
		nand_do_upgrade $1
		;;
	*)
		echo "flashing kernel"
		tar xf $tar_file sysupgrade-$board/kernel -O | mtd write - kernel

		echo "flashing rootfs"
		tar xf $tar_file sysupgrade-$board/root -O | mtd write - rootfs

		return 0
		;;
	esac
}

platform_check_image() {
	local tar_file="$1"
    local board="$(cat /tmp/sysinfo/board_name)"

	case "$board" in
	at91-sama5d4_lorix_one)
		local kernel_length=`(tar xf $tar_file sysupgrade-$board/kernel -O | wc -c) 2> /dev/null`
		local rootfs_length=`(tar xf $tar_file sysupgrade-$board/root -O | wc -c) 2> /dev/null`
		;;
	at91-sama5d4_lorix_one512)
		local kernel_length=`(tar xf $tar_file sysupgrade-$board/kernel -O | wc -c) 2> /dev/null`
		local rootfs_length=`(tar xf $tar_file sysupgrade-$board/root -O | wc -c) 2> /dev/null`
		;;
	at91-sama5d4_wifx_l1)
		local kernel_length=`(tar xf $tar_file sysupgrade-$board/kernel -O | wc -c) 2> /dev/null`
		local rootfs_length=`(tar xf $tar_file sysupgrade-$board/root -O | wc -c) 2> /dev/null`
		;;
	*)
		echo "Sysupgrade is not supported on your board yet."
		return 1
		;;
	esac

	[ "$kernel_length" = 0 -o "$rootfs_length" = 0 ] && {
		echo "The upgarde image is corrupt."
		return 1
	}

	return 0
}
