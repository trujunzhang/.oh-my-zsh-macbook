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
    # 腾讯新闻
    "com.tencent.news"
    # 盒马
    "com.wudaokou.hippo"
    # 欢游
    "com.sabac.hy"
    # baidu
    "com.baidu.searchbox"
    # 速来免费清理
    "com.ailmenacrid.gtsagitate"
    # 开拍
    "com.meitu.action"
    # 今日看点极速版
    "com.jinrikd.news"
    # 今日看看极速版
    "com.syey.jinrikk"
    # 网易小蜜蜂
    "com.netease.community"
    # 捞月狗
    "com.laoyuegou.android"
    # 欢游
    "com.sabac.hy"
    # 夸克
    "com.quark.browser"
    #
    # ""
    #
    # ""
    #
    # ""
    #
    # ""
    #
    # ""
    #
    # ""
    #
    # ""
    #
    # ""
    #
    # ""
    #
    # ""
)

for ((i = 0; i < ${#apk_apps[@]}; i = i + 1)); do
    package_name="${apk_apps[$i + 0]}"
    adb uninstall "${package_name}"
done
