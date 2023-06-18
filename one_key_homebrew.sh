#!/usr/bin/env bash

CURRENT=`pwd` 

# Import function files.
source ./bash/files-functions.sh
source ./bash/tools.sh

# homebrew
if ! command_exists brew; then
    ( exec "./bash/homebrew_install.sh" )
fi

HOMEBREW_HOME="/usr/local"
if [[ $(uname -m) == 'arm64' ]]; then
    # echo M2
    HOMEBREW_HOME="/opt/homebrew"
fi

brew_apps=(
    ## autoenv
    "fold"    "opt/neovim"            "neovim"

    ## autoenv
    "fold"    "opt/autoenv"            "autoenv"

    ## nginx
    "file"    "bin/nginx"              "nginx"

    ## direnv
    # https://direnv.net/#getting-started
    "file"    "bin/direnv"             "direnv"


)
## list
# if ! command_exists ssh-copy-id; then
    # brew install gpg ssh-copy-id
# fi

## autojump
if [ ! -d  ~/Library/autojump ]; then
    brew install autojump
fi



## emacs
# if [ ! -d  "$HOMEBREW_HOME/opt/emacs-plus@29" ]; then
#     ## https://github.com/d12frosted/homebrew-emacs-plus
#     ## url = https://github.com/emacs-mirror/emacs.git
#     brew tap d12frosted/emacs-plus
#     brew install emacs-plus@29 --with-spacemacs-icon
#     brew link emacs-plus@29
#     # open /usr/local/opt/emacs-plus@29
# fi

## git
if [ ! -f "$HOMEBREW_HOME/bin/git" ]; then
    brew install git
fi

## autoreconf
if [ ! -f "$HOMEBREW_HOME/bin/autoreconf" ]; then
    brew install pkg-config poppler automake
fi

## wget
if [ ! -f "$HOMEBREW_HOME/bin/wget" ]; then
    brew install wget
fi

## tmux
if [ ! -f "$HOMEBREW_HOME/bin/tmux" ]; then
    brew install tmux
fi

## fzf
if [ ! -f "$HOMEBREW_HOME/bin/fzf" ]; then
    brew install fzf
    $(brew --prefix)/opt/fzf/install
fi

## font-fira
if [ ! -f  ~/Library/Fonts/FiraCode-Retina.ttf ]; then
    brew tap homebrew/cask-fonts
    brew install --cask font-fira-code
fi

## yabai
if [ ! -f  "$HOMEBREW_HOME/bin/yabai" ]; then
    brew install koekeishiya/formulae/yabai
    # yabai --start-service
fi

## skhd
if [ ! -f  "$HOMEBREW_HOME/bin/skhd" ]; then
    brew install koekeishiya/formulae/skhd
    # skhd --start-service
fi

## React-native & Expo
if ! command_exists watchman; then
    brew install bundletool
    brew install watchman
fi

## Finally, restart the nginx.
brew services restart nginx