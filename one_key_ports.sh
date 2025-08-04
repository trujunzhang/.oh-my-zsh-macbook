#!/usr/bin/env bash

CURRENT=$(pwd)

# Import function files.
source ./bash/files-functions.sh
source ./bash/tools.sh

ports_apps_x86=(
    "yabai" "yabai"

    # "zellij" "zellij"
    # "fish" "fish"
    # "neovim" "neovim"
)

function install_apps {
    apps=("${ports_apps_x86[@]}")
    for ((i = 0; i < ${#apps[@]}; i = i + 2)); do
        echo "element $i is ${apps[$i + 0]}"
        echo "element $i is ${apps[$i + 1]}"

        # if [ ! -d "$HOMEBREW_HOME/${apps[$i + 0]}" ]; then
        sudo ports install ${apps[$i + 1]}
        # fi
    done
}
