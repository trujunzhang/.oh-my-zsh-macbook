#!/usr/bin/env bash

apk_apps=(
    # 声屿
    "com.whsh.live"
    # tantan
    "com.p1.mobile.putong"
    # 韩小圈
    "com.babycloud.hanju"
    # 牵手
    "com.tantan.x"
    # BeautCam
    "com.meitu.meiyancamera"
    # 虎牙直播
    "com.duowan.kiwi"
    # 腾讯地图
    "com.tencent.map"
    #
    # ""
)

for ((i = 0; i < ${#apk_apps[@]}; i = i + 1)); do
    package_name="${apk_apps[$i + 0]}"
    adb uninstall "${package_name}"
done
