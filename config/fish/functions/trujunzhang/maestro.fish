alias dclean_maestro_studio_tests="rm -rf $HOME/.maestro/tests"

function dandroid_adb_search_package
    set pkgName $argv[1]
    adb shell pm list packages | grep $pkgName
end

function drun_adb_devices
    adb kill-server && adb start-server
    adb devices
end

set appIds yybao com.tencent.android.qqdownloader \
    all_apps com.all.apps \
    google_chrome com.android.chrome \
    toutiao_lite com.ss.android.article.lite \
    toutiao_base com.ss.android.article.news \
    meituan com.sankuai.meituan \
    uc_browser_lite com.ucmobile.lite \
    aiqiyi com.qiyi.video.lite \
    kuaiying com.kwai.videoeditor \
    baidumap com.baidu.BaiduMap \
    kuaishou_lite com.kuaishou.nebula \
    kuaishou_base com.smile.gifmaker

set deviceIds @moto ZY32M7GPDD \
    @vivo 000003764c24664e

function run_maestro_app --argument-names fileName appName envKey1 envValue1 envKey2 envValue2
    set -l appId (dict get appIds $appName)
    set -l deviceId (dict get deviceIds @moto)

    info_red_color " 🎉 appName is <$appName>"
    info_red_color " 🎉 appId is <$appId>"
    info_red_color " 🎉 deviceType is <moto>"
    info_red_color " 🎉 deviceId is <$deviceId>"

    set file_path $TRUJUNZHANG_DOTFILES_HOME/config/Maestro/"$fileName".yaml

    if test -n "$envKey2"
        info_red_color " 🎉 EnvKey1 argument provided: $envKey1"
        info_red_color " 🎉 EnvValue1 argument provided: $envValue1"
        info_red_color " 🎉 EnvKey2 argument provided: $envKey2"
        info_red_color " 🎉 EnvValue2 argument provided: $envValue2"
        maestro --device $deviceId test -e appId=$appId -e deviceId=$deviceId -e $envKey1=$envValue1 -e $envKey2=$envValue2 "$file_path"
    else
        info_green_color " 💥 Error: EnvKey2 argument is not set"

        if test -n "$envKey1"
            info_red_color " 🎉 EnvKey1 argument provided: $envKey1"
            info_red_color " 🎉 EnvValue1 argument provided: $envValue1"
            maestro --device $deviceId test -e appId=$appId -e deviceId=$deviceId -e $envKey1=$envValue1 "$file_path"
        else
            info_green_color " 💥 Error: EnvKey1 argument is not set"
            maestro --device $deviceId test -e appId=$appId -e deviceId=$deviceId "$file_path"
        end
    end
end

function run_special_device_in_maestro_app --argument-names fileName appName deviceType
    set -l appId (dict get appIds $appName)
    set -l deviceId (dict get deviceIds $deviceType)

    info_red_color " 🎉 appName is <$appName>"
    info_red_color " 🎉 appId is <$appId>"
    info_red_color " 🎉 deviceType is <$deviceType>"
    info_red_color " 🎉 deviceId is <$deviceId>"

    set file_path $TRUJUNZHANG_DOTFILES_HOME/config/Maestro/"$fileName".yaml

    maestro --device $deviceId test -e appId=$appId -e deviceId=$deviceId "$file_path"
end

alias dmaestro_all_app_scroll_up_9="run_maestro_app moto_all_apps_scroll_up all_apps"

alias dmaestro_yybao_立即签到_1="run_maestro_app moto_yybao_qiandao yybao"
alias dmaestro_yybao_限时_下载_2="run_maestro_app moto_yybao_click_download yybao"
alias dmaestro_yybao_限时_打开_3="run_maestro_app moto_yybao_click_open yybao"
alias dmaestro_yybao_任务_提现页面_4="run_maestro_app moto_yybao_click_ads_in_tixian_page yybao"
alias dmaestro_yybao_任务_赚钱页面_5="run_maestro_app moto_yybao_click_ads_in_zhuangqian_page yybao"
alias dmaestro_yybao_去下载_6="run_maestro_app moto_yybao_goto_download yybao"
alias dmaestro_yybao_去浏览_7="run_maestro_app moto_yybao_goto_browser yybao"
alias dmaestro_yybao_领积分_8="run_maestro_app moto_yybao_click_lingjifen yybao"

alias dmaestro_kuaiying_watch_and_return_9="run_maestro_app moto_kuaiying_only_watch_and_return kuaiying"

alias dmaestro_uc_browser_lite_watch_and_return="run_maestro_app moto_uc_browser_lite_only_watch_and_return uc_browser_lite"
alias dmaestro_uc_browser_lite_打卡任务_9="run_maestro_app moto_uc_browser_lite_click_ads uc_browser_lite"

alias dmaestro_meituan_点击合作任务_91="run_maestro_app moto_meituan_click_tasks_in_the_grid meituan buttonIndex 0"
alias dmaestro_meituan_点击合作任务_92="run_maestro_app moto_meituan_click_tasks_in_the_grid meituan buttonIndex 1"
alias dmaestro_meituan_点击合作任务_93="run_maestro_app moto_meituan_click_tasks_in_the_grid meituan buttonIndex 2"
alias dmaestro_meituan_点击合作任务_94="run_maestro_app moto_meituan_click_tasks_in_the_grid meituan buttonIndex 3"
alias dmaestro_meituan_点击合作任务_95="run_maestro_app moto_meituan_click_tasks_in_the_grid meituan buttonIndex 4"

# meituan homepage
alias dmaestro_meituan_去完成_pos_11="run_maestro_app moto_meituan_only_watch_and_return meituan buttonText 去完成 buttonIndex 0"
alias dmaestro_meituan_去完成_pos_12="run_maestro_app moto_meituan_only_watch_and_return meituan buttonText 去完成 buttonIndex 1"
alias dmaestro_meituan_去完成_pos_13="run_maestro_app moto_meituan_only_watch_and_return meituan buttonText 去完成 buttonIndex 2"
alias dmaestro_meituan_去完成_pos_14="run_maestro_app moto_meituan_only_watch_and_return meituan buttonText 去完成 buttonIndex 3"
alias dmaestro_meituan_去完成_pos_15="run_maestro_app moto_meituan_only_watch_and_return meituan buttonText 去完成 buttonIndex 4"

alias dmaestro_meituan_去观看_pos_21="run_maestro_app moto_meituan_only_watch_and_return meituan buttonText 去观看 buttonIndex 0"
alias dmaestro_meituan_去观看_pos_22="run_maestro_app moto_meituan_only_watch_and_return meituan buttonText 去观看 buttonIndex 1"
alias dmaestro_meituan_去观看_pos_23="run_maestro_app moto_meituan_only_watch_and_return meituan buttonText 去观看 buttonIndex 2"

alias dmaestro_meituan_去浏览_pos_31="run_maestro_app moto_meituan_only_watch_and_return meituan buttonText 去浏览 buttonIndex 0"
alias dmaestro_meituan_去浏览_pos_32="run_maestro_app moto_meituan_only_watch_and_return meituan buttonText 去浏览 buttonIndex 1"
alias dmaestro_meituan_去浏览_pos_33="run_maestro_app moto_meituan_only_watch_and_return meituan buttonText 去浏览 buttonIndex 2"

# alias dmaestro_meituan_="run_maestro_app meituan"
# alias dmaestro_meituan_="run_maestro_app meituan"

alias dmaestro_toutiao_base_任务_赚钱页面_9="run_maestro_app moto_toutiao_tasks_in_the_zhuangqian_page toutiao_base"
alias dmaestro_toutiao_lite_任务_赚钱页面_9="run_maestro_app moto_toutiaolite_tasks_in_the_zhuangqian_page toutiao_lite"

alias dmaestro_vivo_kuaishou_lite_打卡_观看精彩视频_9="run_special_device_in_maestro_app vivo_kuaishoulite_watch_ads kuaishou_lite @vivo"

# kuaishou lite
alias dmaestro_kuaishou_lite_领金币_pos_11="run_maestro_app moto_kuaishou_app_tasks_in_the_homepage kuaishou_lite buttonText 领金币 buttonIndex 0"
alias dmaestro_kuaishou_lite_领金币_pos_12="run_maestro_app moto_kuaishou_app_tasks_in_the_homepage kuaishou_lite buttonText 领金币 buttonIndex 1"

alias dmaestro_kuaishou_lite_去领取_pos_21="run_maestro_app moto_kuaishou_app_tasks_in_the_homepage kuaishou_lite buttonText 去领取 buttonIndex 0"
alias dmaestro_kuaishou_lite_去领取_pos_22="run_maestro_app moto_kuaishou_app_tasks_in_the_homepage kuaishou_lite buttonText 去领取 buttonIndex 1"

alias dmaestro_kuaishou_lite_去打开_pos_31="run_maestro_app moto_kuaishou_app_tasks_in_the_homepage kuaishou_lite buttonText 去打开 buttonIndex 0"
alias dmaestro_kuaishou_lite_去打开_pos_32="run_maestro_app moto_kuaishou_app_tasks_in_the_homepage kuaishou_lite buttonText 去打开 buttonIndex 1"

alias dmaestro_kuaishou_lite_去浏览_pos_41="run_maestro_app moto_kuaishou_app_tasks_in_the_homepage kuaishou_lite buttonText 去浏览 buttonIndex 0"
alias dmaestro_kuaishou_lite_去浏览_pos_42="run_maestro_app moto_kuaishou_app_tasks_in_the_homepage kuaishou_lite buttonText 去浏览 buttonIndex 1"

# kuaishou base
alias dmaestro_kuaishou_base_去领取_pos_11="run_maestro_app moto_kuaishou_app_tasks_in_the_homepage kuaishou_base buttonText 去领取 buttonIndex 0"
alias dmaestro_kuaishou_base_去领取_pos_12="run_maestro_app moto_kuaishou_app_tasks_in_the_homepage kuaishou_base buttonText 去领取 buttonIndex 1"

alias dmaestro_kuaishou_base_去打开_pos_21="run_maestro_app moto_kuaishou_app_tasks_in_the_homepage kuaishou_base buttonText 去打开 buttonIndex 0"
alias dmaestro_kuaishou_base_去打开_pos_22="run_maestro_app moto_kuaishou_app_tasks_in_the_homepage kuaishou_base buttonText 去打开 buttonIndex 1"

alias dmaestro_kuaishou_base_去浏览_pos_31="run_maestro_app moto_kuaishou_app_tasks_in_the_homepage kuaishou_base buttonText 去浏览 buttonIndex 0"
alias dmaestro_kuaishou_base_去浏览_pos_32="run_maestro_app moto_kuaishou_app_tasks_in_the_homepage kuaishou_base buttonText 去浏览 buttonIndex 1"

alias dmaestro_kuaishou_base_去参与_pos_41="run_maestro_app moto_kuaishou_app_tasks_in_the_homepage kuaishou_base buttonText 去参与 buttonIndex 0"
alias dmaestro_kuaishou_base_去参与_pos_42="run_maestro_app moto_kuaishou_app_tasks_in_the_homepage kuaishou_base buttonText 去参与 buttonIndex 1"

alias dmaestro_google_chrome_close_tabs_9="run_maestro_app moto_google_browser_close_other_tabs google_chrome"

alias dmaestro_moto_aiqiyi_watch_and_return_9="run_special_device_in_maestro_app    moto_aiqiyi_only_watch_and_return aiqiyi @moto"
alias dmaestro_moto_aiqiyi_watch_and_return_自动_8="run_special_device_in_maestro_app   moto_aiqiyi_auto_watch_and_return aiqiyi @moto"

alias dmaestro_vivo_aiqiyi_watch_and_return_9="run_special_device_in_maestro_app  moto_aiqiyi_only_watch_and_return aiqiyi @vivo"
alias dmaestro_vivo_aiqiyi_watch_and_return_自动_8="run_special_device_in_maestro_app   moto_aiqiyi_auto_watch_and_return aiqiyi @vivo"

alias dmaestro_moto_baidumap_watch_and_return_9="run_special_device_in_maestro_app moto_baidumap_only_watch_and_return baidumap @moto"
alias dmaestro_vivo_baidumap_watch_and_return_9="run_special_device_in_maestro_app moto_baidumap_only_watch_and_return baidumap @vivo"
# alias dmaestro_baidumap_="run_maestro_app baidumap"
# alias dmaestro_baidumap_="run_maestro_app baidumap"
# alias dmaestro_baidumap_="run_maestro_app baidumap"
