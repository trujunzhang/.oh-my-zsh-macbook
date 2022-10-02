#!/usr/bin/env bash

CURRENT=`pwd` 

# Import function files.
source ./bash/files-functions.sh
source ./bash/tools.sh

# https://formulae.brew.sh/cask/
# https://github.com/buo/homebrew-cask-upgrade


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

if [ ! -d  "/Applications/Microsoft Edge.app" ]; then
    brew install --cask microsoft-edge
fi

# =========================================
# apps
# =========================================
    brew install --cask kodi