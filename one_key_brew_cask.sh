#!/usr/bin/env bash

CURRENT=`pwd` 

# Import function files.
source ./bash/files-functions.sh
source ./bash/tools.sh

# https://formulae.brew.sh/cask/
# https://github.com/buo/homebrew-cask-upgrade


if [ ! -d  "/Applications/Visual Studio Code.app" ]; then
    brew install --cask visual-studio-code
fi


# =========================================
# System
# =========================================
if [ ! -d  "/Applications/Raycast.app" ]; then
    brew install --cask raycast
fi

if [[ $(uname -m) == 'x86_64' ]]; then
    # macOS tool to limit maximum charging percentage
    # https://github.com/davidwernhart/AlDente-Charge-Limiter
    if [ ! -d  "/Applications/AlDente.app" ]; then
         brew install --cask aldente
    fi
fi

# =========================================
# Web browse
# =========================================
if [ ! -d  "/Applications/Google Chrome.app" ]; then
    brew install --cask google-chrome
fi

if [ ! -d  "/Applications/Vivaldi.app" ]; then
    brew install --cask vivaldi
fi

if [ ! -d  "/Applications/Opera.app" ]; then
    brew install --cask opera
fi

if [ ! -d  "/Applications/Firefox.app" ]; then
    brew install --cask firefox
fi

if [ ! -d  "/Applications/Brave Browser.app" ]; then
    brew install --cask brave-browser
fi

# =========================================
# apps
# =========================================
if [ ! -d  "/Applications/Kodi.app" ]; then
    brew install --cask kodi
fi

# if [ ! -d  "/Applications/Todoist.app" ]; then
    # brew install --cask todoist
# fi

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

if [ ! -d  "/Applications/Sourcetree.app" ]; then
    brew install --cask sourcetree
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

if [ ! -d  "/Applications/qutebrowser.app" ]; then
    brew install --cask qutebrowser
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







