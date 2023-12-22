#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# git clone  https://github.com/rufengsuixing/luci-app-adguardhome  package/luci-app-adguardhome
# #git clone https://github.com/muink/openwrt-packages  package/openwrt-packages
 # #git clone https://github.com/wwxx-star/openwrt-packages1  package/openwrt-packages
# #git clone https://github.com/yfdoor/OpenWrt-Packages.git package/yfdoorg
# #git clone https://github.com/haiibo/openwrt-packages package/haiibo
# #git clone https://github.com/xiaorouji/openwrt-passwall.git package/passwall/luci
# #git clone https://github.com/xiaorouji/openwrt-passwall-packages.git package/passwall/packages
# #git clone https://github.com/xiaoxiao29/luci-app-adguardhome.git  package/luci-app-adguardhome 
# #git clone --depth=1 https://github.com/fw876/helloworld.git package/helloworld
# #git clone  https://github.com/kenzok8/openwrt-packages.git  package/kenzo
# git clone  https://github.com/kenzok8/small.git  package/small
git clone https://github.com/x1906/openwrt-packages  package/openwrt-packages

./scripts/feeds update -a && ./scripts/feeds install -a

# Modify default IP
sed -i 's/192.168.1.1/192.168.6.1/g' package/base-files/files/bin/config_generate

# Modify default Timezone
sed -i "s/'UTC'/'CST-8'\n        set system.@system[-1].zonename='Asia\/Shanghai'/g" package/base-files/files/bin/config_generate

# test NOwfi
#sed -i '/option disabled/d' /etc/config/wireless
#sed -i '/set wireless.radio${devidx}.disabled/d' /lib/wifi/mac80211.sh
#wifi up
#make package/feeds/luci/luci-base/compile V=99
