#!/usr/bin/env bash

CURRENT=$(pwd)

# Import function files.
source ./bash/files-functions.sh
source ./bash/tools.sh

# homebrew
# if ! command_exists brew; then
# ( exec "./bash/homebrew_install.sh" )
# fi

# HOMEBREW_HOME="/usr/local"
# if [[ $(uname -m) == 'arm64' ]]; then
#     # echo M2
#     HOMEBREW_HOME="/opt/homebrew"
# fi
# HOMEBREW_HOME="$(brew --prefix)"

# if [[ $MY_MAC_TYPE == 'mini' ]]; then
# info M2
# HOMEBREW_HOME="/opt/homebrew/opt"
# fi

# if [[ $(uname -m) == 'x86_64' ]]; then
#     # info Mackook
# fi

export HOMEBREW_API_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles/api"
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles"

brew_apps_arm=(
    # "micromamba" "micromamba"

    # "--cask wine-stable" "wine-stable"

    # "--cask --no-quarantine wine-stable" "wine-stable"

    # https://github.com/emcrisostomo/fswatch
    # "fswatch" "fswatch"

    # "watchman" "watchman"

    # "android-platform-tools" "android-platform-tools"

    # for expensify app
    "yq" "yq"
    "mkcert" "mkcert"

    # python on the asdf-vim
    # brew_install_app openssl
    # "readline" "readline"
    # "xz" "xz"

    # neovim
    # "lua@5.1" "lua@5.1"
    "luarocks" "luarocks"
    "rg" "rg"
    "fd" "fd"
    "lua-language-server" "lua-language-server"
    "tree-sitter-cli" "tree-sitter-cli"

    # "starship" "starship"
    # "zellij" "zellij"
    # "fish" "fish"
    #"neovim" "neovim"

    # "jenkins-lts" "jenkins-lts"

    # https://github.com/Bhupesh-V/ugit
    # "ugit" "ugit"
    # "neovide" "neovide"

    # "ruby@3.3" "ruby@3.3"

    # https://github.com/Muhammed770/hammerspoon-bluetooth-automation
    # "blueutil" "blueutil"

    # asdf install ruby
    # psych:
    #         Could not be configured. It will not be installed.
    # "libyaml" "libyaml"
)
brew_apps_x86=(
    # "starship" "starship"
    # "zellij" "zellij"
    # "fish" "fish"
    # "neovim" "neovim"
)

brew_apps=()
if [[ $MY_MAC_TYPE == mini ]]; then
    # info M2 mini
    brew_apps=("${brew_apps_arm[@]}")
fi
if [[ $MY_MAC_TYPE == pro ]]; then
    # info Mackook pro
    brew_apps=("${brew_apps_x86[@]}")
fi

function install_apps {
    apps=("${brew_apps[@]}")
    for ((i = 0; i < ${#apps[@]}; i = i + 2)); do
        echo "element $i is ${apps[$i+0]}"
        echo "element $i is ${apps[$i+1]}"

        if [ ! -d "$HOMEBREW_CELLAR/${apps[$i+0]}" ]; then
            brew install "${apps[$i+1]}"
        fi
    done
}

## list
# if ! command_exists ssh-copy-id; then
# brew install gpg ssh-copy-id
# fi

## install common apps
install_apps

# jenkins-lts
if [ -d "$HOMEBREW_CELLAR/jenkins-lts" ]; then
    info "copy jenkins-lts list file"
    PLIST_DEST_PATH="/opt/homebrew/opt/jenkins-lts/homebrew.mxcl.jenkins-lts.plist"

    if grep "ALLOW_LOCAL_CHECKOUT" $PLIST_DEST_PATH; then
        error "  ALLOW_LOCAL_CHECKOUT already exists in $PLIST_DEST_PATH"
    else
        success "  ALLOW_LOCAL_CHECKOUT  not exists in $PLIST_DEST_PATH"
        sudo cp -Rvp "$TRUJUNZHANG_DOTFILES_HOME/config/homebrew/homebrew.mxcl.jenkins-lts.plist" "$PLIST_DEST_PATH"
    fi

fi

## Finally, restart the nginx.
# brew services restart nginx
