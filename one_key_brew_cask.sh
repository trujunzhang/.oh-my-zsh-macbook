#!/usr/bin/env bash

CURRENT=$(pwd)

# Import function files.
source ./bash/files-functions.sh
source ./bash/tools.sh

USER_APPLICATION="$HOME/Applications/"

# https://formulae.brew.sh/cask/
# https://github.com/buo/homebrew-cask-upgrade

brew_apps=(
    "Folx" "Folx" "copy" "no-bak"
    "Keyboard Maestro" "Keyboard Maestro" "copy" "no-bak"
    "Xcode" "xcode" "ssd" "no-bak"
    "CrossOver" "crossover" "ssd" "no-bak"
    "Whiskey" "whiskey" "ssd" "no-bak"
    "Homerow" "homerow" "copy" "no-bak"
    # Editor
    "Visual Studio Code" "visual-studio-code" "copy" "backup"
    # "Emacs"               "emacs" "copy"  "backup"
    # "Sourcetree"          "sourcetree" 'ssd' "backup"
    # "Insomnia"            "insomnia" 'ssd' "backup"
    # https://fbflipper.com/
    # "Flipper"             "flipper" 'copy' 'backup'
    "Realm Studio" "mongodb-realm-studio" 'ssd' 'no-bak'
    "Obsidian" "obsidian" 'ssd' 'no-bak'
    "Alacritty" "alacritty" 'copy' 'backup'
    "Wezterm" "wezterm" 'copy' 'backup'
    "Ghostty" "ghostty" 'copy' 'backup'
    # "Neovide" "Neovide" 'copy' 'no-bak'
    "Sublime Text" "SublimeText" "ssd" 'no-bak'
    "Sublime Merge" "Sublime Merge" "ssd" "no-bak"
    "Android Studio" "AndroidStudio" "ssd" 'no-bak'
    "ResponsivelyApp" "ResponsivelyApp" "ssd" "no-bak"
    "Pixea" "pixea" "ssd" "no-bak"
    "Wondershare PDFelement" "pdfelement" "ssd" "no-bak"
    "DaisyDisk" "daisyDisk" "ssd" "no-bak"
    "Mac FoneLab Screen Recorder" "Mac FoneLab Screen Recorder" "ssd" "no-bak"
    "Amazon Kindle" "Amazon Kindle" "copy" "no-bak"
    "Z-Library" "Z-Library" "ssd" "no-bak"
    "calibre" "calibre" "ssd" "no-bak"
    "Leader Key" "Leader Key" "copy" "no-bak"
    "qBittorrent" "qbittorrent" "copy" "no-bak"
    "Transmit" "Transmit" "ssd" "no-bak"

    # System tools
    "Raycast" "raycast" 'copy' 'no-bak'
    # "SpaceLauncher" "spacelauncher" 'copy' 'backup'
    "Notion" "notion" 'copy' 'backup'
    "ClickUp" "clickup" 'ssd' 'no-bak'
    # "OneDrive" "onedrive" 'copy' 'no-bak'
    # "Docker" "docker" "copy" 'no-bak'
    "OrbStack" "orbstack" "ssd" 'no-bak'
    "FileZilla" "filezilla" 'ssd' 'no-bak'
    "Dash" "dash" 'copy' 'no-bak'
    "WebStorm" 'webstorm' 'ssd' 'no-bak'
    "PyCharm" "pycharm" 'ssd' 'no-bak'
    "Hammerspoon" "hammerspoon" 'copy' 'no-bak'
    # "Grammarly Editor"    "grammarly" 'copy' 'no-bak'

    # Web browser
    # "Google Chrome" "google-chrome" 'copy' 'backup'
    "Vivaldi" "vivaldi" 'ssd' 'backup'
    "Opera" "opera" 'ssd' 'backup'
    "Firefox" "firefox" 'ssd' 'backup'
    "Brave Browser" "brave-browser" 'ssd' 'backup'
    "Brave Browser Beta" "brave-browser-bata" 'ssd' 'backup'
    # "Brave Browser Nightly" "brave-browser-nightly" 'copy' 'backup'

    # =========================================
    # required password
    # =========================================
    "Microsoft Edge" "microsoft-edge" 'ssd' 'backup'

    # Design apps
    "Figma" "figma" 'copy' 'backup'
    "Zeplin" "zeplin" 'ssd' 'backup'
    "VLC" "vlc" 'ssd' 'no-bak'
    "Elmedia Player" "ElmediaPlayer" "ssd" 'no-bak'
    "Kodi" "kodi" 'ssd' 'no-bak'
    "Infuse" "infuse" 'ssd' 'no-bak'

    # chat apps
    # "WeChat"              "wechat" "ssd" 'backup'
    # "QQ"                  "qq" 'ssd' 'backup'
)
brew_apps_arm=(
    "AeroSpace" "nikitabobko/tap/aerospace" "copy" 'no-bak'
    # "Authy Desktop"       "authy" 'copy'
    "BaiduNetdisk_mac" "baidunetdisk" 'ssd' 'no-bak'

    # "Arc" "arc" 'ssd'
    # "ResponsivelyApp"     "responsively" 'copy'

    # "Docker" "docker" 'copy'
    # "pgAdmin 4" "pgadmin4" 'copy'
)
brew_apps_x86=(
    # macOS tool to limit maximum charging percentage
    # https://github.com/davidwernhart/AlDente-Charge-Limiter
    "AlDente" "aldente" 'copy' 'backup'
)

DEFAULTVALUE="install"
Params="${1:-$DEFAULTVALUE}"

DEFAULBKKEY="local"
ParamsBkKey="${2:-$DEFAULBKKEY}"

app_backup_path_index() {
    case $1 in
    'ssd') return 0 ;;
    'hard') return 1 ;;
    'local') return 2 ;;
    esac
}

hash_vals=("/Volumes/MacGame/MacCache"
    "/Volumes/MacGame/"
    "/Volumes/MacUser/djzhang/Desktop/APPS_BACKUP")

app_backup_path_index ${ParamsBkKey}
CURRENT_THIRD_APPS_PATH=${hash_vals[$?]}

PATH_THIRD_APPLICATIONS="${CURRENT_THIRD_APPS_PATH}/$(uname -m)/Applications"
PATH_THIRD_APPS_BACKUP="${CURRENT_THIRD_APPS_PATH}/$(uname -m)/BACKUP"

if [ "$Params" = "backup" ]; then
    mkdir -p "${PATH_THIRD_APPLICATIONS}"
    mkdir -p "${PATH_THIRD_APPS_BACKUP}"
fi

info "==========================================================="
info "params<brew-type> = ${Params}"
info "params<Backup key> = ${ParamsBkKey}"
info "current app path fold: ${CURRENT_THIRD_APPS_PATH}"
info "current app <APPLICATION> path: ${PATH_THIRD_APPLICATIONS}"
info "current app <BACKUP> path: ${PATH_THIRD_APPS_BACKUP}"
info "==========================================================="

function backup_apps_from_Applications {
    name=$1
    appName="${name}.app"

    app_path_in_backup_file="${PATH_THIRD_APPS_BACKUP}/${name}.zip"
    info "Backup app in Applications: ${appName}"
    info "Backup app path: ${app_path_in_backup_file}"

    # if the app is already in backup folder, delete it first
    if [ -f "${app_path_in_backup_file}" ]; then
        info "** remove the old app zip: ${app_path_in_backup_file}"
        rm "${app_path_in_backup_file}"
    fi

    cd "/Applications"
    zip -y -r -q "${app_path_in_backup_file}" "${appName}"
}

function backup_apps_in_backup_folder {
    name=$1
    appName="${name}.app"

    app_path_in_backup_file="${PATH_THIRD_APPS_BACKUP}/${name}.zip"
    info "Backup app in backup folder: ${appName}"
    info "Backup app path: ${app_path_in_backup_file}"

    # if the app is already in backup folder, delete it first
    if [ -f "${app_path_in_backup_file}" ]; then
        info "** remove the old app zip: ${app_path_in_backup_file}"
        rm "${app_path_in_backup_file}"
    fi

    cd "${PATH_THIRD_APPLICATIONS}"
    zip -y -r -q "${app_path_in_backup_file}" "${appName}"
}

function restore_apps {
    name=$1
    appName="${name}.app"

    app_path_in_backup_file="${PATH_THIRD_APPS_BACKUP}/${name}.zip"
    info "Restore app: ${appName}"
    info "Last backup app path: ${app_path_in_backup_file}"

    if [ -f "${app_path_in_backup_file}" ]; then
        unzip "${app_path_in_backup_file}" -d "/Applications"
    fi
}

function link_apps {
    name=$1
    appName="${name}.app"

    app_path_in_backup_file="${PATH_THIRD_APPLICATIONS}/${appName}"
    info "Link app: ${appName}"
    info "Backup app path: ${app_path_in_backup_file}"

    directoryLink "app(${name})" "${app_path_in_backup_file}" "/Applications/${appName}" "delete"
}

function install_brew_app {
    name=$1
    appName="${name}.app"
    app=$2
    shouldCopyInApplications=$3
    needBackup=$4

    if [ "$Params" = "link" ]; then
        if [ ! -d "/Applications/${appName}" ]; then
            if [ "$shouldCopyInApplications" = "ssd" ]; then
                link_apps "${name}"
            fi
        fi
    elif [ "$Params" = "backup" ]; then
        if [ "$needBackup" = "backup" ]; then
            if [ -d "/Applications/${appName}" ]; then
                if [ "$shouldCopyInApplications" = "copy" ]; then
                    backup_apps_from_Applications "${name}"
                fi

                if [ "$shouldCopyInApplications" = "ssd" ]; then
                    backup_apps_in_backup_folder "${name}"
                fi
            fi
        fi
    elif [ "$Params" = "restore" ]; then
        if [ ! -d "/Applications/${appName}" ]; then
            if [ "$shouldCopyInApplications" = "copy" ]; then
                restore_apps "${name}"
            fi
        fi
    elif [ "$Params" = "delete" ]; then
        if [ -d "/Applications/${appName}" ]; then
            sudo rm -rf "/Applications/${appName}"
        fi
    elif [ "$Params" = "open" ]; then
        if [ -d "/Applications/${appName}" ]; then
            open "/Applications/${appName}"
        fi
    elif [ "$Params" = "$DEFAULTVALUE" ]; then
        if [ ! -d "/Applications/${appName}" ]; then
            brew reinstall --cask "${app}"
        fi
    elif [ "$Params" = "fix" ]; then
        if [ ! -d "/Applications/${appName}" ]; then
            brew reinstall --cask "${app}"
        fi
    else
        brew reinstall --cask "${app}"
    fi
}

function install_apps {
    apps=("$@")
    for ((i = 0; i < ${#apps[@]}; i = i + 4)); do
        name="${apps[$i + 0]}"
        app="${apps[$i + 1]}"
        shouldCopyInApplications="${apps[$i + 2]}"
        needBackup="${apps[$i + 3]}"

        info ""
        info "element $i is ${name}"
        info "element $i is ${app}"
        info "element $i is ${shouldCopyInApplications}"
        info "element $i is ${needBackup}"

        info ""
        if [ ! -L "/Applications/${name}" ]; then
            install_brew_app "${name}" "${app}" "${shouldCopyInApplications}" "${needBackup}"
        fi
        info ""
    done
}

function install_apps_on_current_os {
    if [[ $(uname -m) == 'arm64' ]]; then
        # info M2
        install_apps "${brew_apps_arm[@]}"
    fi

    if [[ $(uname -m) == 'x86_64' ]]; then
        # info Mackook
        install_apps "${brew_apps_x86[@]}"
    fi
}

## font-fira
if [ ! -f ~/Library/Fonts/FiraCode-Retina.ttf ]; then
    brew tap homebrew/cask-fonts
    brew install --cask font-fira-code
fi

## install common apps
install_apps "${brew_apps[@]}"
install_apps_on_current_os
