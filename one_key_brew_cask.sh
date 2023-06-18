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

    # System tools
    "Raycast.app"             "raycast"

    # Web browser
    "Google Chrome.app"       "google-chrome"
    "Vivaldi.app"             "vivaldi"
    "Opera.app"               "opera"
    "Firefox.app"             "firefox"
    "Brave Browser.app"       "brave-browser"
    "qutebrowser.app"         "qutebrowser"



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
if [ ! -d  "/Applications/Kodi.app" ]; then
    brew install --cask kodi
fi

if [ ! -d  "/Applications/Notion.app" ]; then
    brew install --cask notion
fi

if [ ! -d  "/Applications/Figma.app" ]; then
    brew install --cask figma
fi

if [ ! -d  "/Applications/Zeplin.app" ]; then
    brew install --cask zeplin
fi

# if [ ! -d  "/Applications/WeChat.app" ]; then
    # brew install --cask wechat
    # brew install --cask qq
# fi

if [ ! -d  "/Applications/SpaceLauncher.app" ]; then
    brew install --cask spacelauncher
fi

if [ ! -d  "/Applications/Emacs.app" ]; then
    brew install --cask emacs
fi

if [ ! -d  "/Applications/Sourcetree.app" ]; then
    brew install --cask sourcetree
fi

if [ ! -d  "/Applications/mpv.app" ]; then
    brew install --cask mpv
fi

# if [ ! -d  "/Applications/VLC.app" ]; then
    # brew install --cask vlc
# fi

if [[ $(uname -m) == 'arm64' ]]; then
    if [ ! -d  "/Applications/Docker.app" ]; then
        brew install --cask docker
    fi

    if [ ! -d  "/Applications/pgAdmin 4.app" ]; then
        brew install --cask pgadmin4
    fi
fi

if [ ! -d  "/Applications/kitty.app" ]; then
    curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
fi

if [[ $(uname -m) == 'arm64' ]]; then
    if [ ! -d  "/Applications/iTerm.app" ]; then
        brew install --cask iterm2
    fi
fi


# if [ ! -d  "/Applications/Skype.app" ]; then
#     brew install --cask skype
# fi

# =========================================
# required password
# =========================================
if [ ! -d  "/Applications/Microsoft Edge.app" ]; then
    brew install --cask microsoft-edge
fi

# if [ ! -d  "/Applications/Adobe Creative Cloud" ]; then
#     brew install --cask adobe-creative-cloud
# fi

# =========================================
# apps
# =========================================
# if [ ! -d  "/Applications/BaiduNetdisk.app" ]; then
    # brew install --cask baidunetdisk
# fi







