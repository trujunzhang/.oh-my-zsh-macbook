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

echo "params = ${Params}"

function install_brew_app {
    name=$1
    app=$2

    if [ "$Params" = "delete" ]; then
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
    echo "element $i is ${brew_apps[$i+0]}"
    echo "element $i is ${brew_apps[$i+1]}"

    install_brew_app "${brew_apps[$i+0]}" "${brew_apps[$i+1]}"
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
    echo "install apps for arm64"
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





