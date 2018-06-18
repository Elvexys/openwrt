#
# Copyright (C) 2018 Infoteam.ch
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

define Profile/Default
	NAME:=Default Profile (all drivers)
	PACKAGES:= packet-forwarder
	PRIORITY := 1
endef

define Profile/Default/Description
	Default package set for LORIX ONE.
endef
$(eval $(call Profile,Default))
