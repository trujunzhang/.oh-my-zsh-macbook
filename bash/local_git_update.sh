#!/usr/bin/env bash

# cocoapods

function git_pull_cocoapods {
    cd "$HOME/.cocoapods/repos/trunk"

    rm -rf "$HOME/.cocoapods/repos/trunk/Specs"

    git reset --hard
    git pull

    cd "$ORGANIZATIONS_HOME/TRUJUNZHANG/_oh-my-zsh-macbook/USERS/cocoapods" && node offline.js
}

function git_pull_spacemacs {
    cd "$ORGANIZATIONS_HOME/IDES/emacs-shim/spacemacs"
    git pull
}

function git_pull_spacevim {
    cd "$ORGANIZATIONS_HOME/IDES/vim-shim/SpaceVim"
    git pull
}

function git_pull_nvm {
    cd "$ORGANIZATIONS_HOME/IDES/nvm/localNVM"
    git pull
}

if [ -d  "$HOME/.cocoapods/repos/trunk/Specs" ]; then
    git_pull_cocoapods
fi

git_pull_spacemacs
git_pull_spacevim
git_pull_nvm