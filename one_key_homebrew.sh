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
HOMEBREW_HOME="$(brew --prefix)"

export HOMEBREW_API_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles/api"
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles"

# brew tap FelixKratz/formulae

brew_apps=(
    "starship" "starship"
    "zellij" "zellij"
    "fish" "fish"
    "neovim" "neovim"
)

brew_appsxxx=(
    ## cocoapods(xcode)
    # "opt/cocoapods"             "cocoapods"
    ## supabase
    "opt/supabase" "supabase/tap/supabase"

    # brew services start sketchybar
    "opt/sketchybar" "sketchybar"
    # "opt/thefuck"               "thefuck"

    ## v2ray
    # "opt/v2ray-core"            "v2ray-core"

    ## neovim
    "opt/luarocks" "luarocks"
    "opt/tree-sitter" "tree-sitter"
    "opt/prettierd" "fsouza/prettierd/prettierd"
    ## neovim(telescope)
    "opt/fd" "fd"
    "opt/ripgrep" "ripgrep"
    ## neovim(lazygit)
    "opt/lazygit" "jesseduffield/lazygit/lazygit"
    ## neovim(fzf)
    "opt/fzf" "fzf"
    ## neovim(spectre)
    "opt/gnu-sed" "gnu-sed"
    "opt//buf" "bufbuild/buf/buf"
    "opt/marksman" "marksman"

    ## fish
    "opt/fish" "fish"

    ## neovim
    "opt/neovim" "neovim"

    ## autoenv
    # "opt/autoenv"               "autoenv"

    ## nginx
    "opt/nginx" "nginx"

    # rbenv
    "opt/rbenv" "rbenv"
    ## pyenv
    "opt/pyenv" "pyenv"

    ## jenkins-lts
    # https://www.jenkins.io/download/lts/macos
    "opt/jenkins-lts" "jenkins-lts"
    "opt/fastlane" "fastlane"

    ## direnv
    # https://direnv.net/#getting-started
    "opt/direnv" "direnv"

    ## git
    "opt/git" "git"

    ## autoreconf
    "opt/automake" "pkg-config poppler automake"

    ## wget
    "opt/wget" "wget"

    ## tmux
    # "opt/tmux"               "tmux"
    "opt/zellij" "zellij"

    ## autojump
    "opt/autojump" "autojump"

    ## React-native & Expo
    "opt/watchman" "bundletool watchman"
    "opt/ccache" "ccache"
    # "opt/sccache"            "sccache"
    # https://nektosact.com/installation/homebrew.html
    # "opt/act"                "act"
    # brew tap facebook/fb
    # "opt/idb-companion"      "idb-companion"

    ## neovim
    # https://github.com/universal-ctags/ctags
    "opt/universal-ctags" "universal-ctags"
    "opt/lua" "lua"
    "opt/lua-language-server" "lua-language-server"
    # https://deno.land/
    "opt/deno" "deno"
    "opt/rust" "rust"
    ## emacs
    'opt/sbcl' 'sbcl'
    'opt/ocicl' 'ocicl'

    "opt/mkcert" "mkcert"
)
brew_apps_arm=(

)
brew_apps_x86=(
    ## yabai
    # https://github.com/jqlang/jq
    "opt/jq" "jq"
    "opt/yabai" "koekeishiya/formulae/yabai"
    # yabai --start-service

    ## skhd
    "opt/skhd" "koekeishiya/formulae/skhd"
    # skhd --start-service

)

function install_apps {
    apps=("$@")
    for ((i = 0; i < ${#apps[@]}; i = i + 2)); do
        echo "element $i is ${apps[$i + 0]}"
        echo "element $i is ${apps[$i + 1]}"

        if [ ! -d "$HOMEBREW_HOME/${apps[$i + 0]}" ]; then
            brew install ${apps[$i + 1]}
        fi
    done
}

function install_apps_on_current_os {
    if [[ $(uname -m) == 'arm64' ]]; then
        # info M2
        install_apps "${brew_apps_arm[@]}"
    fi

    if [[ $(uname -m) == 'x86_64' ]]; then
        # info Mackook
        install_apps "${brew_apps_x86[@]}"
    fi
}

## list
# if ! command_exists ssh-copy-id; then
# brew install gpg ssh-copy-id
# fi

## fzf
# if [ ! -d "$HOMEBREW_HOME/opt/fzf" ]; then
#     $(brew --prefix)/opt/fzf/install
# fi

## install common apps
install_apps "${brew_apps[@]}"
# install_apps_on_current_os

## Finally, restart the nginx.
# brew services restart nginx
