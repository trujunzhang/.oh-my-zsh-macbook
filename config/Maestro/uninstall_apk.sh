#!/usr/bin/env bash

apk_apps=(
    # 声屿
    "com.whsh.live"
    # tantan
    "com.p1.mobile.putong"
)

for ((i = 0; i < ${#apk_apps[@]}; i = i + 1)); do
    package_name="${apk_apps[$i + 0]}"
    adb uninstall "${package_name}"
done
