#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default

# 添加其他软件包，格式：git clone https://github.com/P3TERX/xxx package/xxx

# 关机插件
git clone https://github.com/esirplayground/luci-app-poweroff.git package/luci-app-poweroff

# Argon主题 + 主题自定义插件
rm -rf package/lean/luci-theme-argon
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/lean/luci-theme-argon
git clone https://github.com/jerrykuku/luci-app-argon-config package/luci-app-argon-config
git clone https://github.com/Leo-Jo-My/luci-theme-opentomcat.git package/openwrt-packages/luci-theme-opentomcat
useVersionInfo=$(git show -s --date=short --format="编译前的最后一次[➦主源码](https://github.com/coolsnowwolf/lede)更新记录:<br/>更新人: %an<br/>更新时间: %cd<br/>更新内容: %s<br/>哈希值: %H")
echo "useVersionInfo=$useVersionInfo" >> $GITHUB_ENV
echo "DATE=$(date "+%Y年%m月%d日%H时%M分")" >> $GITHUB_ENV
echo "DATE1=$(date "+%Y.%m.%d")" >> $GITHUB_ENV
echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
sed -i '$a src-git haichuan https://github.com/haichuan2001/openwrt-packages' feeds.conf.default
sed -i '$a src-git small https://github.com/haichuan2001/small' feeds.conf.default
# sed -i '$a src-git AdGuardHome https://github.com/haichuan2001/AdGuardHome44.git' feeds.conf.default
sed -i '$a src-git IPTV https://github.com/haichuan2001/openwrt-iptvhelper.git' feeds.conf.default
