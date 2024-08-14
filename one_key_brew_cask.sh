#!/usr/bin/env bash

CURRENT=$(pwd)

# Import function files.
source ./bash/files-functions.sh
source ./bash/tools.sh

# https://formulae.brew.sh/cask/
# https://github.com/buo/homebrew-cask-upgrade

brew_apps=(
    # Editor
    "Visual Studio Code.app" "visual-studio-code" "copy"
    # "Emacs.app"               "emacs" "copy"
    # "Sourcetree.app"          "sourcetree" 'ssd'
    # "Insomnia.app"            "insomnia" 'ssd'
    # https://fbflipper.com/
    # "Flipper.app"             "flipper" 'copy'
    # "Realm Studio.app"        "mongodb-realm-studio" 'copy'
    "Obsidian.app" "obsidian" 'copy'
    "Alacritty.app" "alacritty" 'copy'
    "Wezterm.app" "wezterm" 'copy'
    "Neovide.app" "Neovide" 'copy'

    # System tools
    "Raycast.app" "raycast" 'copy'
    "SpaceLauncher.app" "spacelauncher" 'copy'
    "Notion.app" "notion" 'ssd'
    "OneDrive.app" "onedrive" 'copy'
    # "Hammerspoon.app"         "hammerspoon" 'copy'
    # "Authy Desktop.app"       "authy" 'copy'
    "BaiduNetdisk_mac.app" "baidunetdisk" 'ssd'
    # "Grammarly Editor.app"    "grammarly" 'copy'

    # Web browser
    "Google Chrome.app" "google-chrome" 'ssd'
    "Vivaldi.app" "vivaldi" 'ssd'
    "Opera.app" "opera" 'ssd'
    "Firefox.app" "firefox" 'ssd'
    "Brave Browser.app" "brave-browser" 'ssd'
    "Arc.app" "arc" 'ssd'
    # "ResponsivelyApp.app"     "responsively" 'copy'

    # =========================================
    # required password
    # =========================================
    "Microsoft Edge.app" "microsoft-edge" 'ssd'

    # Design apps
    "Figma.app" "figma" 'copy'
    "Zeplin.app" "zeplin" 'copy'

    # chat apps
    "Skype.app" "skype" 'ssd'
    # "WeChat.app"              "wechat" "ssd"
    # "QQ.app"                  "qq" 'ssd'
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

function backup_apps {
    name=$1

    app_path_in_backup_folder="${PATH_BACKUP}/${name}"
    info "Backup app: ${name}"
    info "Backup app path: ${app_path_in_backup_folder}"

    # if the app is already in backup folder, delete it first
    if [ -d "${app_path_in_backup_folder}" ]; then
        info "** remove the old app: ${app_path_in_backup_folder}"
        rm -rf "${app_path_in_backup_folder}"
    fi

    cp -Rvp "/Applications/${name}" "${app_path_in_backup_folder}"
}

function restore_apps {
    name=$1

    app_path_in_backup_folder="${PATH_BACKUP}/${name}"
    info "Restore app: ${name}"
    info "Backup app path: ${app_path_in_backup_folder}"

    if [ -d "${app_path_in_backup_folder}" ]; then
        cp -Rvp "${app_path_in_backup_folder}" "/Applications/${name}"
    fi
}

function link_apps {
    name=$1

    app_path_in_backup_folder="${PATH_BACKUP}/${name}"
    info "Link app: ${name}"
    info "Backup app path: ${app_path_in_backup_folder}"

    directoryLink "app(${name})" "${app_path_in_backup_folder}" "/Applications/${name}" "delete"
}

function install_brew_app {
    name=$1
    app=$2
    shouldCopyInApplications=$3

    if [ "$Params" = "link" ]; then
        if [ ! -d "/Applications/${name}" ]; then
            link_apps "${name}"
        fi
    elif [ "$Params" = "backup" ]; then
        if [ -d "/Applications/${name}" ]; then
            backup_apps "${name}"
        fi
    elif [ "$Params" = "restore" ]; then
        if [ ! -d "/Applications/${name}" ]; then
            if [ "$shouldCopyInApplications" = "copy" ]; then
                restore_apps "${name}"
            fi
        fi
    elif [ "$Params" = "delete" ]; then
        if [ -d "/Applications/${name}" ]; then
            sudo rm -rf "/Applications/${name}"
        fi
    elif [ "$Params" = "open" ]; then
        if [ -d "/Applications/${name}" ]; then
            open "/Applications/${name}"
        fi
    elif [ "$Params" = "$DEFAULTVALUE" ]; then
        if [ ! -d "/Applications/${name}" ]; then
            brew reinstall --cask "${app}"
        fi
    elif [ "$Params" = "fix" ]; then
        if [ ! -d "/Applications/${name}" ]; then
            brew reinstall --cask "${app}"
        fi
    else
        brew reinstall --cask "${app}"
    fi
}

for ((i = 0; i < ${#brew_apps[@]}; i = i + 3)); do
    name="${brew_apps[$i + 0]}"
    app="${brew_apps[$i + 1]}"
    shouldCopyInApplications="${brew_apps[$i + 2]}"

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

if [[ $(uname -m) == 'x86_64' ]]; then
    # macOS tool to limit maximum charging percentage
    # https://github.com/davidwernhart/AlDente-Charge-Limiter
    install_brew_app "AlDente.app" aldente 'copy'
fi

# =========================================
# apps
# =========================================
if [[ $(uname -m) == 'arm64' ]]; then
    info "install apps for arm64"
    # install_brew_app "Docker.app" docker 'copy'
    # install_brew_app "pgAdmin 4.app" pgadmin4 'copy'
fi

## font-fira
if [ ! -f ~/Library/Fonts/FiraCode-Retina.ttf ]; then
    brew tap homebrew/cask-fonts
    brew install --cask font-fira-code
fi

# if [ ! -d  "/Applications/kitty.app" ]; then
# curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
# fi
