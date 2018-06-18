#
# Copyright (C) 2018 Infoteam.ch
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

define Profile/All
	NAME:=Ultimate Profile
	PACKAGES := luci luci-ssl-openssl packet-forwarder lorawan-server lora-interface \
		luci-app-lorawan-server luci-app-pkt-fwd luci-app-openvpn mosquitto-ssl \
		openvpn-openssl kmod-wireguard python3-six
endef

define Profile/All/Description
	Package set including the Gotthard LoRaWAN Server
endef
$(eval $(call Profile,All))
