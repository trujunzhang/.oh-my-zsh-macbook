#!/usr/bin/env bash

CURRENT=`pwd` 

# Import function files.
source ./bash/files-functions.sh
source ./bash/tools.sh

# https://formulae.brew.sh/cask/
# https://github.com/buo/homebrew-cask-upgrade

brew_apps=(
    # Editor
    "Visual Studio Code.app"  "visual-studio-code"
    "Emacs.app"               "emacs"
    "Sourcetree.app"          "sourcetree"


    # System tools
    "Raycast.app"             "raycast"
    "SpaceLauncher.app"       "spacelauncher"
    "Notion.app"              "notion"
    # "BaiduNetdisk.app"        "baidunetdisk"

    # Web browser
    "Google Chrome.app"       "google-chrome"
    "Vivaldi.app"             "vivaldi"
    "Opera.app"               "opera"
    "Firefox.app"             "firefox"
    "Brave Browser.app"       "brave-browser"
    "qutebrowser.app"         "qutebrowser"

    # =========================================
    # required password
    # =========================================
    "Microsoft Edge.app"      "microsoft-edge"


    # Video player
    "Kodi.app"                "kodi"
    "VLC.app"                 "vlc"
    "mpv.app"                 "mpv"


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

for (( i=0; i<${#brew_apps[@]}; i=i+2 ));
do
    echo "element $i is ${brew_apps[$i+0]}"
    echo "element $i is ${brew_apps[$i+1]}"

    if [ ! -d  "/Applications/${brew_apps[$i+0]}" ]; then

        if [ "$Params" = "$DEFAULTVALUE" ]; then
            brew install --cask ${brew_apps[$i+1]}
        else
            brew reinstall --cask ${brew_apps[$i+1]}
        fi

    fi
done

if [[ $(uname -m) == 'x86_64' ]]; then
    # macOS tool to limit maximum charging percentage
    # https://github.com/davidwernhart/AlDente-Charge-Limiter
    if [ ! -d  "/Applications/AlDente.app" ]; then
         brew install --cask aldente
    fi
fi

# =========================================
# apps
# =========================================
if [[ $(uname -m) == 'arm64' ]]; then
    if [ ! -d  "/Applications/Docker.app" ]; then
        brew install --cask docker
    fi

    if [ ! -d  "/Applications/pgAdmin 4.app" ]; then
        brew install --cask pgadmin4
    fi

    if [ ! -d  "/Applications/iTerm.app" ]; then
        brew install --cask iterm2
    fi
fi

if [ ! -d  "/Applications/kitty.app" ]; then
    curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
fi





