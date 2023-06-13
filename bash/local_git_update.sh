#!/usr/bin/env bash

# cocoapods

function git_pull_cocoapods {
    cd "$HOME/.cocoapods/repos/trunk"

    rm -rf "$HOME/.cocoapods/repos/trunk/Specs"

    git reset --hard
    git pull

    cd $ORGANIZATIONS_HOME/TRUJUNZHANG/_oh-my-zsh-macbook/USERS/cocoapods && node offline.js
}


git_pull_cocoapods