# OpenLORIX
Welcome to OpenLORIX repository. 
This is a fork of openwrt for LORIXOne LoRaWAN gateway. 

It include both LORIXOne version to openwrt build system and provide ready to use default configuration including needed tools as packet forwarder, LuCI and few other customer package. 

All custom package are available on our dedicated feed : https://github.com/InfoteamEnergySolutions/infoteam-oss-feed

# Install OpenLORIX
Binary release are available under the release section. 
You can flash them using Wifx documentation here : https://lorixone.io/wiki/NAND_Programming

# Build OpenLORIX
You can build OpenLORIX with following command : 

```
./scripts/feeds update
./scripts/feeds install -a
make dirclean
cp ./defconfig/lorix_one_HW_REVISION-FIRMEWARE_FLAVOR.config .config
make defconfig
(Optional) make menuconfig
make -j8
```

Build result is available in `bin/targets/at91/lorix_one/`

# Warranty
This product is offered as it is, without any support. 
If you need commercial support, customization etc. You will find more information on our website : https://energy.infoteam.ch/iot-internet-of-things/lorawan.html
