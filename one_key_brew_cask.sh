#!/usr/bin/env bash

CURRENT=$(pwd)

# Import function files.
source ./bash/files-functions.sh
source ./bash/tools.sh

# https://formulae.brew.sh/cask/
# https://github.com/buo/homebrew-cask-upgrade

brew_apps=(
    # Editor
    "Visual Studio Code" "visual-studio-code" "copy"
    # "Emacs"               "emacs" "copy"
    # "Sourcetree"          "sourcetree" 'ssd'
    # "Insomnia"            "insomnia" 'ssd'
    # https://fbflipper.com/
    # "Flipper"             "flipper" 'copy'
    # "Realm Studio"        "mongodb-realm-studio" 'copy'
    "Obsidian" "obsidian" 'copy'
    "Alacritty" "alacritty" 'copy'
    "Wezterm" "wezterm" 'copy'
    "Neovide" "Neovide" 'copy'
    "Sublime Text" "SublimeText" "ssd"

    # System tools
    "Raycast" "raycast" 'copy'
    "SpaceLauncher" "spacelauncher" 'copy'
    "Notion" "notion" 'copy'
    "ClickUp" "clickup" 'ssd'
    "OneDrive" "onedrive" 'copy'
    "Docker" "docker" "copy"
    "FileZilla" "filezilla" 'ssd'
    # "Hammerspoon"         "hammerspoon" 'copy'
    # "Grammarly Editor"    "grammarly" 'copy'

    # Web browser
    "Google Chrome" "google-chrome" 'ssd'
    "Vivaldi" "vivaldi" 'ssd'
    "Opera" "opera" 'ssd'
    "Firefox" "firefox" 'ssd'
    "Brave Browser" "brave-browser" 'ssd'
    "Brave Browser Beta" "brave-browser-bata" 'ssd'
    "Brave Browser Nightly" "brave-browser-nightly" 'copy'

    # =========================================
    # required password
    # =========================================
    "Microsoft Edge" "microsoft-edge" 'ssd'

    # Design apps
    "Figma" "figma" 'ssd'
    "Zeplin" "zeplin" 'ssd'
    "VLC" "VLC" 'ssd'

    # chat apps
    "Skype" "skype" 'ssd'
    # "WeChat"              "wechat" "ssd"
    # "QQ"                  "qq" 'ssd'
)
brew_apps_arm=(
    "AeroSpace" "nikitabobko/tap/aerospace" "copy"
    # "Authy Desktop"       "authy" 'copy'
    "BaiduNetdisk_mac" "baidunetdisk" 'ssd'

    "Arc" "arc" 'ssd'
    # "ResponsivelyApp"     "responsively" 'copy'

    # "Docker" "docker" 'copy'
    # "pgAdmin 4" "pgadmin4" 'copy'
)
brew_apps_x86=(
    # macOS tool to limit maximum charging percentage
    # https://github.com/davidwernhart/AlDente-Charge-Limiter
    "AlDente" "aldente" 'copy'
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
CURRENT_APP_BACKUP_PATH=${hash_vals[$?]}

PATH_BACKUP="${CURRENT_APP_BACKUP_PATH}/$(uname -m)/Applications"

if [ "$Params" = "backup" ]; then
    mkdir -p "${PATH_BACKUP}"
fi

info "==========================================================="
info "params<brew-type> = ${Params}"
info "params<Backup key> = ${ParamsBkKey}"
info "current app backup fold: ${CURRENT_APP_BACKUP_PATH}"
info "current app backup path: ${PATH_BACKUP}"
info "==========================================================="

function backup_apps_from_Applications {
    name=$1
    appName="${name}.app"

    app_path_in_backup_folder="${PATH_BACKUP}/${name}.zip"
    info "Backup app in Applications: ${appName}"
    info "Backup app path: ${app_path_in_backup_folder}"

    # if the app is already in backup folder, delete it first
    if [ -f "${app_path_in_backup_folder}" ]; then
        info "** remove the old app zip: ${app_path_in_backup_folder}"
        rm "${app_path_in_backup_folder}"
    fi

    # cp -Rvp "/Applications/${name}" "${app_path_in_backup_folder}"
    cd "/Applications"
    zip -r "${app_path_in_backup_folder}" "${appName}"
}

function backup_apps_in_backup_folder {
    name=$1
    appName="${name}.app"

    app_path_in_backup_folder="${PATH_BACKUP}/${name}.zip"
    info "Backup app in backup folder: ${appName}"
    info "Backup app path: ${app_path_in_backup_folder}"

    # if the app is already in backup folder, delete it first
    if [ -f "${app_path_in_backup_folder}" ]; then
        info "** remove the old app zip: ${app_path_in_backup_folder}"
        rm "${app_path_in_backup_folder}"
    fi

    # cp -Rvp "/Applications/${name}" "${app_path_in_backup_folder}"
    cd "${PATH_BACKUP}"
    zip -r "${app_path_in_backup_folder}" "${appName}"
}

function restore_apps {
    name=$1
    appName="${name}.app"

    app_path_in_backup_folder="${PATH_BACKUP}/${name}.zip"
    info "Restore app: ${appName}"
    info "Backup app path: ${app_path_in_backup_folder}"

    # if [ -d "${app_path_in_backup_folder}" ]; then
    #     cp -Rvp "${app_path_in_backup_folder}" "/Applications/${name}"
    # fi

    if [ -f "${app_path_in_backup_folder}" ]; then
        unzip "${app_path_in_backup_folder}" -d "/Applications"
    fi
}

function link_apps {
    name=$1
    appName="${name}.app"

    app_path_in_backup_folder="${PATH_BACKUP}/${appName}"
    info "Link app: ${appName}"
    info "Backup app path: ${app_path_in_backup_folder}"

    directoryLink "app(${name})" "${app_path_in_backup_folder}" "/Applications/${appName}" "delete"
}

function install_brew_app {
    name=$1
    appName="${name}.app"
    app=$2
    shouldCopyInApplications=$3

    if [ "$Params" = "link" ]; then
        if [ ! -d "/Applications/${appName}" ]; then
            if [ "$shouldCopyInApplications" = "ssd" ]; then
                link_apps "${name}"
            fi
        fi
    elif [ "$Params" = "backup" ]; then
        if [ -d "/Applications/${appName}" ]; then
            if [ "$shouldCopyInApplications" = "copy" ]; then
                backup_apps_from_Applications "${name}"
            fi

            if [ "$shouldCopyInApplications" = "ssd" ]; then
                backup_apps_in_backup_folder "${name}"
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
    for ((i = 0; i < ${#apps[@]}; i = i + 3)); do
        name="${apps[$i + 0]}"
        app="${apps[$i + 1]}"
        shouldCopyInApplications="${apps[$i + 2]}"

        info ""
        info "element $i is ${name}"
        info "element $i is ${app}"
        info "element $i is ${shouldCopyInApplications}"

        info ""
        if [ ! -L "/Applications/${name}" ]; then
            install_brew_app "${name}" "${app}" "${shouldCopyInApplications}"
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
