#!/usr/bin/env bash

CURRENT=`pwd`

# Import function files.
source ./bash/files-functions.sh
source ./bash/tools.sh

# https://formulae.brew.sh/cask/
# https://github.com/buo/homebrew-cask-upgrade

brew_apps=(
    # Editor
    # "MacVim.app"              "macvim"
    "Visual Studio Code.app"  "visual-studio-code"
    # "Emacs.app"               "emacs"
    # "Sourcetree.app"          "sourcetree"
    # "Insomnia.app"            "insomnia"
    # https://fbflipper.com/
    # "Flipper.app"             "flipper"
    # "Realm Studio.app"        "mongodb-realm-studio"
    # "Zed.app"                 "zed"
    "Obsidian.app"            "obsidian"
    "Alacritty.app"           "alacritty"

    # System tools
    # "V2rayU.app"              "v2rayu"
    "Raycast.app"             "raycast"
    "SpaceLauncher.app"       "spacelauncher"
    "Notion.app"              "notion"
    "OneDrive.app"            "onedrive"
    # "Hammerspoon.app"         "hammerspoon"
    # "Authy Desktop.app"       "authy"
    # "BaiduNetdisk_mac.app"    "baidunetdisk"
    "Grammarly Editor.app"    "grammarly"

    # Web browser
    "Google Chrome.app"       "google-chrome"
    "Vivaldi.app"             "vivaldi"
    "Opera.app"               "opera"
    "Firefox.app"             "firefox"
    "Brave Browser.app"       "brave-browser"
    # "qutebrowser.app"         "qutebrowser"
    "Arc.app"                 "arc"
    # "ResponsivelyApp.app"     "responsively"

    # =========================================
    # required password
    # =========================================
    "Microsoft Edge.app"      "microsoft-edge"

    # Video player
    # "Kodi.app"                "kodi"
    # "VLC.app"                 "vlc"
    # "mpv.app"                 "mpv"

    # Design apps
    "Figma.app"               "figma"
    "Zeplin.app"              "zeplin"
    # "Adobe Creative Cloud"    "adobe-creative-cloud"

    # chat apps
    "Skype.app"               "skype"
    # "WeChat.app"              "wechat"
    # "QQ.app"                  "qq"
)

DEFAULTVALUE="install"
Params="${1:-$DEFAULTVALUE}"

DEFAULBKKEY="local"
ParamsBkKey="${2:-$DEFAULBKKEY}"

app_backup_path_index() {
    case $1 in
        'ssd') return 0;;
        'hard') return 1;;
        'local') return 2;;
    esac
}


hash_vals=("/Volumes/MacGame/APPS_BACKUP"
           "/Volumes/MacGame/"
           "/Volumes/MacUser/djzhang/Desktop/APPS_BACKUP");

app_backup_path_index ${ParamsBkKey}
CURRENT_APP_BACKUP_PATH=${hash_vals[$?]}

PATH_BACKUP="${CURRENT_APP_BACKUP_PATH}/$(uname -m)/Applications"

mkdir -p "${PATH_BACKUP}"

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
    if [ -d  "${app_path_in_backup_folder}" ]; then
        info "** remove the old app: ${app_path_in_backup_folder}"
        rm -rf "${app_path_in_backup_folder}"
    fi
    
    setopt -s dotglob
    cp -Rvp "/Applications/${name}" "${app_path_in_backup_folder}"
}

function restore_apps {
    name=$1

    app_path_in_backup_folder="${PATH_BACKUP}/${name}"
    info "Restore app: ${name}"
    info "Backup app path: ${app_path_in_backup_folder}"

    if [ -d  "${app_path_in_backup_folder}" ]; then
         setopt -s dotglob
         cp -Rvp "${app_path_in_backup_folder}" "/Applications/${name}"
    fi
}

function install_brew_app {
    name=$1
    app=$2

    if [ "$Params" = "backup" ]; then
        if [ -d  "/Applications/${name}" ]; then
            backup_apps "${name}"
        fi
    elif [ "$Params" = "restore" ]; then
        if [ ! -d  "/Applications/${name}" ]; then
            restore_apps "${name}"
        fi
    elif [ "$Params" = "delete" ]; then
        if [ -d  "/Applications/${name}" ]; then
            sudo rm -rf "/Applications/${name}"
        fi
    elif [ "$Params" = "open" ]; then
        if [ -d  "/Applications/${name}" ]; then
            open "/Applications/${name}"
        fi
    elif [ "$Params" = "$DEFAULTVALUE" ]; then
        if [ ! -d  "/Applications/${name}" ]; then
            brew reinstall --cask "${app}"
        fi
    elif [ "$Params" = "fix" ]; then
        if [ ! -d  "/Applications/${name}" ]; then
            brew reinstall --cask "${app}"
        fi
    else
        brew reinstall --cask "${app}"
    fi
}

for (( i=0; i<${#brew_apps[@]}; i=i+2 ));
do
    info ""
    info "element $i is ${brew_apps[$i+0]}"
    info "element $i is ${brew_apps[$i+1]}"

    info ""
    install_brew_app "${brew_apps[$i+0]}" "${brew_apps[$i+1]}"
    info ""
done

if [[ $(uname -m) == 'x86_64' ]]; then
    # macOS tool to limit maximum charging percentage
    # https://github.com/davidwernhart/AlDente-Charge-Limiter
    install_brew_app "AlDente.app" aldente
fi

# =========================================
# apps
# =========================================
if [[ $(uname -m) == 'arm64' ]]; then
    info "install apps for arm64"
    # install_brew_app "Docker.app" docker

    # install_brew_app "pgAdmin 4.app" pgadmin4
    # install_brew_app "iTerm.app" iterm2
fi

## font-fira
if [ ! -f  ~/Library/Fonts/FiraCode-Retina.ttf ]; then
    brew tap homebrew/cask-fonts
    brew install --cask font-fira-code
fi

# if [ ! -d  "/Applications/kitty.app" ]; then
    # curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
# fi





