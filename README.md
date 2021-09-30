# OpenLORIX
Welcome to OpenLORIX repository.
This is a fork of openwrt for LORIXOne LoRaWAN gateway.

It include both LORIXOne version to openwrt build system and provide ready to use default configuration including needed tools as packet forwarder, LuCI and few other customer package.

All custom package are available on our dedicated feed : https://github.com/InfoteamEnergySolutions/infoteam-oss-feed

# Screenshot

<p align="center">
  <img width="159" height="189" src="https://energy.infoteam.ch/fileadmin/user_upload/commun_infoteam.ch/energy/images/LoRaGW.PNG">
  <img width="174" height="110" src="https://energy.infoteam.ch/fileadmin/user_upload/commun_infoteam.ch/energy/images/MenuNetwork.PNG">
  <img width="312" height="180" src="https://energy.infoteam.ch/fileadmin/user_upload/commun_infoteam.ch/energy/images/flash.PNG">
</p>

# Feature
- LoRaWAN packets forwarder configuration
- Full network configuration (NIC, Firewall, routing ...)
- IPsec, OpenVPN, Wireguard, Openconnect VPN
- NTP, SSH, Syslog, LED services
- Local Firmware update
- Web interface to configure all previous feature

... and more ...

# Default configuration
```
IP adress     : 192.168.1.1
Username      : root
Pass          : no password
Management UI : https://192.168.1.1
```

# Install OpenLORIX
Binary release are available under the release section.

Each release is split in multiple files :

- wimg files  :  images for first installation using [LORIX Programming tool](https://iot.wifx.net/docs/programming-tool/latest). Files are generated using the `create_wimg.sh ` script located in project root folder for both LORIXOne version (256 /512 NAND)
- zip archive : All build artifacts, including sysupdate file to update existing OpenLORIX using GUI for both LORIXOne version (256 /512 NAND)

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

To generate wimg :

`./create_wimg.sh`

# Warranty
This product is offered as it is, without any support.

If you need commercial support, customization etc. You will find more information on our website : https://elvexys.com/
