#!/bin/bash
# Loide Gisela RIBEIRO GUERREIRO -  Script create wimg - 04.02.2021
# TM (EVX) -  Adaptations and genericity - 27.09.2021

FOLDER_VERSION_512="lorix_one512"
FOLDER_VERSION_256="lorix_one"
FOLDER_VERSION_L1="wifx_l1"
#Firmware files
PATH_FILE_DTB=*".dtb"
PATH_FILE_ROOTFS=*"ubifs-root.ubi"
PATH_FILE_KERNEL=*"ubifs-zImage"
PATH_FILE_UBOOT="u-boot"*
PATH_FILE_AT91="at91"*
#Addresses
_ERASEBLOCKSIZE_ADDR_VALUE="0x40000"
_AT91BOOTSTRAP_ADDR_VALUE="0x000000"
_UBOOT_ADDR_VALUE="0x040000"
_DTB_ADDR_VALUE="0x180000"
_KERNEL_ADDR_VALUE="0x200000"
_ROOTFS_ADDR_VALUE="0x800000"
_VERSION_VALUE_512="lorix-one-512"
_VERSION_VALUE_256="lorix-one-256"
_VERSION_VALUE_L1="l1"
_HEADER_ADDR_VALUE_512="0xc1e04e07"
_HEADER_ADDR_VALUE_256="0xc0902405"
_HEADER_ADDR_VALUE_L1="0xc0902405"
#Useful paths
PATH_FIRMWARE="bin/targets/at91"
PATH_METADATA_FILES="scripts/wimg_template"
PATH_METADATA_TEMPLATE="metadata_template.yml"

NAME_UBOOT="u-boot.bin"
NAME_METADATA="metadata.yml"
NAME_AT91BOOTSTRAP="at91bootstrap.bin"
#-----------------------------------------------------------------------
# Prepare workspace
#-----------------------------------------------------------------------
if [ ! -d "$PATH_FIRMWARE/wimg_images" ];
then
    mkdir $PATH_FIRMWARE/wimg_images
fi

if [ ! -d "$PATH_FIRMWARE/wimg_images/tmp" ];
then
    mkdir $PATH_FIRMWARE/wimg_images/tmp
fi

if [ -d "$PATH_FIRMWARE/$FOLDER_VERSION_512" ] && [ -d "$PATH_FIRMWARE/$FOLDER_VERSION_256" ] && [ -d "$PATH_FIRMWARE/$FOLDER_VERSION_L1" ];
then
    echo "Firmware folder outputs contains multiple target, exiting ...."
    exit 1
elif [ -d "$PATH_FIRMWARE/$FOLDER_VERSION_512" ]
then
    VERSION="512"
    cp "$PATH_METADATA_FILES/$PATH_METADATA_TEMPLATE" "$PATH_FIRMWARE/wimg_images/tmp/metadata.yml"
    RELEASE_NAME=$(echo "$PATH_FIRMWARE/$FOLDER_VERSION_512/"$PATH_FILE_DTB | cut -d'-' -f 1 | xargs basename)
    VERSION_RELEASE=$(echo "$PATH_FIRMWARE/$FOLDER_VERSION_512/"$PATH_FILE_DTB | cut -d'-' -f 2)
    cp $PATH_FIRMWARE/$FOLDER_VERSION_512/$PATH_FILE_UBOOT/"$NAME_UBOOT" "$PATH_FIRMWARE/wimg_images/tmp"
    cp $PATH_FIRMWARE/$FOLDER_VERSION_512/$PATH_FILE_AT91/"$NAME_AT91BOOTSTRAP" "$PATH_FIRMWARE/wimg_images/tmp"
    cp "$PATH_FIRMWARE/$FOLDER_VERSION_512/"$PATH_FILE_DTB "$PATH_FIRMWARE/wimg_images/tmp"
    cp "$PATH_FIRMWARE/$FOLDER_VERSION_512/"$PATH_FILE_ROOTFS "$PATH_FIRMWARE/wimg_images/tmp"
    cp "$PATH_FIRMWARE/$FOLDER_VERSION_512/"$PATH_FILE_KERNEL "$PATH_FIRMWARE/wimg_images/tmp"
    echo "Starting create wimg release for 512 version of $RELEASE_NAME"
    sed -i "s/_VERSION/${_VERSION_VALUE_512}/g" "$PATH_FIRMWARE/wimg_images/tmp/"metadata.yml
    sed -i "s/_HEADER_ADDR/${_HEADER_ADDR_VALUE_512}/g" "$PATH_FIRMWARE/wimg_images/tmp/"metadata.yml
elif [ -d "$PATH_FIRMWARE/$FOLDER_VERSION_256" ]
then
    VERSION="256"
    cp "$PATH_METADATA_FILES/$PATH_METADATA_TEMPLATE" "$PATH_FIRMWARE/wimg_images/tmp/metadata.yml"
    RELEASE_NAME=$(echo "$PATH_FIRMWARE/$FOLDER_VERSION_256/"$PATH_FILE_DTB | cut -d'-' -f 1 | xargs basename)
    VERSION_RELEASE=$(echo "$PATH_FIRMWARE/$FOLDER_VERSION_256/"$PATH_FILE_DTB | cut -d'-' -f 2)
    cp "$PATH_FIRMWARE/$FOLDER_VERSION_256/"$PATH_FILE_UBOOT/"$NAME_UBOOT" "$PATH_FIRMWARE/wimg_images/tmp"
    cp "$PATH_FIRMWARE/$FOLDER_VERSION_256/"$PATH_FILE_AT91/"$NAME_AT91BOOTSTRAP" "$PATH_FIRMWARE/wimg_images/tmp"
    cp "$PATH_FIRMWARE/$FOLDER_VERSION_256/"$PATH_FILE_DTB "$PATH_FIRMWARE/wimg_images/tmp"
    cp "$PATH_FIRMWARE/$FOLDER_VERSION_256/"$PATH_FILE_ROOTFS "$PATH_FIRMWARE/wimg_images/tmp"
    cp "$PATH_FIRMWARE/$FOLDER_VERSION_256/"$PATH_FILE_KERNEL "$PATH_FIRMWARE/wimg_images/tmp"
    echo "Starting create wimg release for 256 version of $RELEASE_NAME"
    sed -i "s/_VERSION/${_VERSION_VALUE_256}/g" "$PATH_FIRMWARE/wimg_images/tmp/"metadata.yml
    sed -i "s/_HEADER_ADDR/${_HEADER_ADDR_VALUE_256}/g" "$PATH_FIRMWARE/wimg_images/tmp/"metadata.yml
elif [ -d "$PATH_FIRMWARE/$FOLDER_VERSION_L1" ]
then
    VERSION="L1"
    cp "$PATH_METADATA_FILES/$PATH_METADATA_TEMPLATE" "$PATH_FIRMWARE/wimg_images/tmp/metadata.yml"
    RELEASE_NAME=$(echo "$PATH_FIRMWARE/$FOLDER_VERSION_L1/"$PATH_FILE_DTB | cut -d'-' -f 1 | xargs basename)
    VERSION_RELEASE=$(echo "$PATH_FIRMWARE/$FOLDER_VERSION_L1/"$PATH_FILE_DTB | cut -d'-' -f 2)
    cp "$PATH_FIRMWARE/$FOLDER_VERSION_L1/"$PATH_FILE_UBOOT/"$NAME_UBOOT" "$PATH_FIRMWARE/wimg_images/tmp"
    cp "$PATH_FIRMWARE/$FOLDER_VERSION_L1/"$PATH_FILE_AT91/"$NAME_AT91BOOTSTRAP" "$PATH_FIRMWARE/wimg_images/tmp"
    cp "$PATH_FIRMWARE/$FOLDER_VERSION_L1/"$PATH_FILE_DTB "$PATH_FIRMWARE/wimg_images/tmp"
    cp "$PATH_FIRMWARE/$FOLDER_VERSION_L1/"$PATH_FILE_ROOTFS "$PATH_FIRMWARE/wimg_images/tmp"
    cp "$PATH_FIRMWARE/$FOLDER_VERSION_L1/"$PATH_FILE_KERNEL "$PATH_FIRMWARE/wimg_images/tmp"
    echo "Starting create wimg release for Wifx L1 version of $RELEASE_NAME"
    sed -i "s/_VERSION/${_VERSION_VALUE_L1}/g" "$PATH_FIRMWARE/wimg_images/tmp/"metadata.yml
    sed -i "s/_HEADER_ADDR/${_HEADER_ADDR_VALUE_L1}/g" "$PATH_FIRMWARE/wimg_images/tmp/"metadata.yml
else
    echo "Firmware folder outputs contains no suported targets, exiting ...."
    exit 1
fi


#-----------------------------------------------------------------------
# MAIN
#-----------------------------------------------------------------------

VALUE_HASH_AT91_BOOTSTRAP=$(md5sum "$PATH_FIRMWARE/wimg_images/tmp/$NAME_AT91BOOTSTRAP" | awk '{ print $1 }')
VALUE_HASH_UBOOT=$(md5sum "$PATH_FIRMWARE/wimg_images/tmp/$NAME_UBOOT" | awk '{ print $1 }')

sed -i "s/_HASH_AT91_BOOTSTRAP/${VALUE_HASH_AT91_BOOTSTRAP}/g" "$PATH_FIRMWARE/wimg_images/tmp/"metadata.yml
sed -i "s/_HASH_UBOOT/${VALUE_HASH_UBOOT}/g" "$PATH_FIRMWARE/wimg_images/tmp/"metadata.yml

sed -i "s/_ERASEBLOCKSIZE_ADDR/${_ERASEBLOCKSIZE_ADDR_VALUE}/g" "$PATH_FIRMWARE/wimg_images/tmp/"metadata.yml
sed -i "s/_AT91BOOTSTRAP_ADDR/${_AT91BOOTSTRAP_ADDR_VALUE}/g" "$PATH_FIRMWARE/wimg_images/tmp/"metadata.yml
sed -i "s/_UBOOT_ADDR/${_UBOOT_ADDR_VALUE}/g" "$PATH_FIRMWARE/wimg_images/tmp/"metadata.yml
sed -i "s/_DTB_ADDR/${_DTB_ADDR_VALUE}/g" "$PATH_FIRMWARE/wimg_images/tmp/"metadata.yml
sed -i "s/_KERNEL_ADDR/${_KERNEL_ADDR_VALUE}/g" "$PATH_FIRMWARE/wimg_images/tmp/"metadata.yml
sed -i "s/_ROOTFS_ADDR/${_ROOTFS_ADDR_VALUE}/g" "$PATH_FIRMWARE/wimg_images/tmp/"metadata.yml

VALUE_HASH_DTB=$(md5sum "$PATH_FIRMWARE/wimg_images/tmp/"$PATH_FILE_DTB | awk '{ print $1 }')
VALUE_HASH_KERNEL=$(md5sum "$PATH_FIRMWARE/wimg_images/tmp/"$PATH_FILE_KERNEL | awk '{ print $1 }')
VALUE_HASH_ROOTFS=$(md5sum "$PATH_FIRMWARE/wimg_images/tmp/"$PATH_FILE_ROOTFS | awk '{ print $1 }')

sed -i "s/_HASH_DTB/${VALUE_HASH_DTB}/g" "$PATH_FIRMWARE/wimg_images/tmp/"metadata.yml
sed -i "s/_HASH_KERNEL/${VALUE_HASH_KERNEL}/g" "$PATH_FIRMWARE/wimg_images/tmp/"metadata.yml
sed -i "s/_HASH_ROOTFS/${VALUE_HASH_ROOTFS}/g" "$PATH_FIRMWARE/wimg_images/tmp/"metadata.yml

DTB_FILE=$(basename "$PATH_FIRMWARE/wimg_images/tmp/"$PATH_FILE_DTB)
KERNEL_FILE=$(basename "$PATH_FIRMWARE/wimg_images/tmp/"$PATH_FILE_KERNEL)
ROOTFS_FILE=$(basename "$PATH_FIRMWARE/wimg_images/tmp/"$PATH_FILE_ROOTFS)

sed -i "s/_PATH_DTB/$DTB_FILE/g" "$PATH_FIRMWARE/wimg_images/tmp/"metadata.yml
sed -i "s/_PATH_KERNEL/$KERNEL_FILE/g" "$PATH_FIRMWARE/wimg_images/tmp/"metadata.yml
sed -i "s/_PATH_ROOTFS/$ROOTFS_FILE/g" "$PATH_FIRMWARE/wimg_images/tmp/"metadata.yml

zip -j "$PATH_FIRMWARE/wimg_images/$RELEASE_NAME-$VERSION_RELEASE-$VERSION.wimg" \
"$PATH_FIRMWARE/wimg_images/tmp/"$PATH_FILE_DTB \
"$PATH_FIRMWARE/wimg_images/tmp/"$PATH_FILE_ROOTFS \
"$PATH_FIRMWARE/wimg_images/tmp/"$PATH_FILE_KERNEL \
"$PATH_FIRMWARE/wimg_images/tmp/$NAME_UBOOT" \
"$PATH_FIRMWARE/wimg_images/tmp/$NAME_AT91BOOTSTRAP" \
"$PATH_FIRMWARE/wimg_images/tmp/$NAME_METADATA"

rm -r "$PATH_FIRMWARE/wimg_images/tmp"

#-----------------------------------------------------------------------
echo "Done !☺"
echo "$RELEASE_NAME-$VERSION_RELEASE-$VERSION.wimg created"
echo "You can find your .wimg file here: $PATH_FIRMWARE/wimg_images"
#-----------------------------------------------------------------------

