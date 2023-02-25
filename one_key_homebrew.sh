#!/usr/bin/env bash

CURRENT=`pwd` 

# Import function files.
source ./bash/files-functions.sh
source ./bash/tools.sh

# homebrew
if ! command_exists brew; then
    ( exec "./bash/homebrew_install.sh" )
fi

## list
# if ! command_exists ssh-copy-id; then
    # brew install gpg ssh-copy-id
# fi

## autoenv
if [ ! -d  /usr/local/opt/autoenv ]; then
    brew install autoenv
fi

## autojump
if [ ! -d  ~/Library/autojump ]; then
    brew install autojump
fi

## nginx
if [ ! -d  /usr/local/etc/nginx ]; then
    brew install nginx
fi

## direnv
if [ ! -f  /usr/local/bin/direnv ]; then
    # https://direnv.net/#getting-started
    brew install direnv
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
if [ ! -f  ~/Library/Fonts/FiraCode-Retina.ttf ]; then
    brew tap homebrew/cask-fonts
    brew install --cask font-fira-code
fi

## React-native & Expo
if ! command_exists watchman; then
    brew install bundletool
    brew install watchman
fi

## Finally, restart the nginx.
brew services restart nginx