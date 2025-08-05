#!/usr/bin/env bash

CURRENT=$(pwd)

# Import function files.
source ./bash/files-functions.sh
source ./bash/tools.sh

DEFAULTVALUE="install"
Params="${1:-$DEFAULTVALUE}"

ports_apps_x86=(
    # python on the asdf-vim
    "openssl" "openssl"
    "readline" "readline"
    # "xz" "xz"

    "yabai" "yabai"

    "zellij" "zellij"
    # "fish" "fish"
    "nvim" "neovim"

    "starship" "starship"
    "fzf" "fzf"

    # neovim
    "luarocks" "luarocks"
    "rg" "rg"
    "fd" "fd"
    "lua-language-server" "lua-language-server"
)

function install_apps {
    apps=("${ports_apps_x86[@]}")
    for ((i = 0; i < ${#apps[@]}; i = i + 2)); do
        echo "element $i is ${apps[$i + 0]}"
        echo "element $i is ${apps[$i + 1]}"

        if [ -f "/opt/local/bin/${apps[$i + 0]}" ]; then
            info "${apps[$i + 0]} already installed in the /opt/local/bin/${apps[$i + 0]}"
        elif [ -d "/opt/local/include/${apps[$i + 0]}" ]; then
            info "${apps[$i + 0]} already installed in the /opt/local/include/${apps[$i + 0]}"
        else
            sudo port install ${apps[$i + 1]}
        fi
    done
}

function uninstall_apps {
    sudo port uninstall asdf
}

if [ "$Params" = "install" ]; then
    install_apps
elif [ "$Params" = "asdf" ]; then
    sudo port install "asdf"
elif [ "$Params" = "uninstall" ]; then
    uninstall_apps
else
    info "Params is ${Params}"
fi
