#!/usr/bin/env bash

# Requirements
#   .1 the lastest macos
#   .2 vpn
#   .3 xcode command line tools
#   .4 .oh-my-zsh
#   .5 ./allLinks

CURRENT=`pwd` 

# Import function files.
source ./bash/files-functions.sh
source ./bash/tools.sh

# copy 'homebrew'
# if [ -d  ~/Desktop/ZIP/Homebrew ]; then
#     if [ ! -d  /usr/local/Homebrew ]; then
        # mv ~/Desktop/ZIP/Homebrew /usr/local/Homebrew
#     fi
# fi

# homebrew
if ! command_exists brew; then
    ( exec "./bash/homebrew_install.sh" )
fi

## list
if ! command_exists ssh-copy-id; then
    brew install gpg ssh-copy-id
fi

## autoenv
if [ ! -d  /usr/local/opt/autoenv ]; then
    brew install autoenv
fi

## autojump
if [ ! -d  ~/Library/autojump ]; then
    brew install autojump
fi

## emacs
if [ ! -d  /usr/local/opt/emacs-plus@29 ]; then
    ## https://github.com/d12frosted/homebrew-emacs-plus
    ## url = https://github.com/emacs-mirror/emacs.git
    brew tap d12frosted/emacs-plus
    brew install emacs-plus@29 --with-spacemacs-icon
    brew link emacs-plus@29
    open /usr/local/opt/emacs-plus@29
fi

## git
if [ ! -f /usr/local/bin/git ]; then
    brew install git
fi

## autoreconf
if [ ! -f /usr/local/bin/autoreconf ]; then
    brew install pkg-config poppler automake
fi

## font-fira
if [ ! -f  ~/Library/Fonts/FiraCode-Bold.ttf ]; then
    brew tap homebrew/cask-fonts
    brew install --cask font-fira-code
fi

## React-native & Expo
if ! command_exists watchman; then
    brew install bundletool
    brew install watchman
fi

# nvm(node.js)
if [ ! -d  ~/.nvm ]; then
    cd ~/ && rm -rf .nvm 
    git clone file:///Users/djzhang/Documents/Organizations/IDES/nvm/localNVM .nvm
    cd ~/.nvm  && git checkout v0.39.0 && . ~/.nvm/nvm.sh && nvm install 16.16.0 && nvm use 16.16.0
fi    

## list
if ! command_exists yarn; then
    npm install --location=global yarn
    npm install --location=global npm-check-updates
    npm install --location=global monia-cli
    npm install --location=global firebase-tools
fi    

## typescript
if ! command_exists tsc; then
    npm install --location=global typescript typescript-formatter tern js-beautify eslint 
fi    

# expo
if ! command_exists expo; then
    # https://docs.expo.dev/get-started/installation/
    npm install --location=global expo-cli 
    # https://docs.expo.dev/build/setup/
    npm install --location=global eas-cli
fi    

# cocoapods
if ! command_exists pod; then
    gem install cocoapods
fi    

# firebase cli(pending)
## https://github.com/firebase/firebase-tools/releases
# if [ -f ~/Desktop/zip/firebase-tools-macos ]; then
    # if [ ! -f /usr/local/bin/firebase ]; then
        # mv ~/Desktop/zip/firebase-tools-macos /usr/local/bin/firebase
        # chmod +x /usr/local/bin/firebase
    # fi
# fi

