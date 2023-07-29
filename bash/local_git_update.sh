#!/usr/bin/env bash

# cocoapods

function git_pull_cocoapods {
    echo "element 0 is cocoapods"
    cd "$HOME/.cocoapods/repos/trunk"

    rm -rf "$HOME/.cocoapods/repos/trunk/Specs"

    git reset --hard
    git pull

    cd "$ORGANIZATIONS_HOME/TRUJUNZHANG/_oh-my-zsh-macbook/USERS/cocoapods" && node offline.js
}

fold_apps=(
    "$ORGANIZATIONS_HOME/IDES/emacs-shim/spacemacs"
    "$ORGANIZATIONS_HOME/IDES/nvm/localNVM"
    "$HOME/.local/share/lunarvim/lvim"
    # "$HOME/.local/share/omf"
  )

if [ -d  "$HOME/.cocoapods/repos/trunk/Specs" ]; then
    git_pull_cocoapods
fi

    for (( i=0; i<${#fold_apps[@]}; i=i+1 ));
    do
        echo "element $i is ${fold_apps[$i]}"
        if [ -d  "${fold_apps[$i]}" ]; then
           cd "${fold_apps[$i]}"
           git pull
        fi
    done
