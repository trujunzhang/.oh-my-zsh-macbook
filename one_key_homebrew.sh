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
    ## supabase
    "opt/supabase"              "supabase/tap/supabase"

    ## v2ray
    "opt/v2ray-core"            "v2ray-core"

    ## neovim
    "opt/tree-sitter"           "tree-sitter"   
    "opt/prettierd"             "fsouza/prettierd/prettierd"   
    ## neovim(telescope)
    "opt/fd"                    "fd"
    "opt/ripgrep"               "ripgrep"
    ## neovim(lazygit)
    "opt/lazygit"               "jesseduffield/lazygit/lazygit"
    ## neovim(fzf)
    "opt/fzf"                   "fzf"

    ## fish
    "opt/fish"                  "fish"

    ## autoenv
    "opt/neovim"                "neovim"

    ## autoenv
    "opt/autoenv"               "autoenv"

    ## nginx
    "opt/nginx"                 "nginx"

    ## direnv
    # https://direnv.net/#getting-started
    "opt/direnv"             "direnv"

    ## git
    "opt/git"                "git"

    ## autoreconf
    "opt/automake"           "pkg-config poppler automake"

    ## wget
    "opt/wget"               "wget"

    ## tmux
    "opt/tmux"               "tmux"

    ## autojump
    "opt/autojump"           "autojump"

    ## yabai
    "opt/yabai"              "yabai"
    # yabai --start-service

    ## skhd
    "opt/skhd"               "skhd"
    # skhd --start-service

    ## React-native & Expo
    "opt/watchman"           "bundletool watchman"
)

for (( i=0; i<${#brew_apps[@]}; i=i+2 ));
do
    echo "element $i is ${brew_apps[$i+0]}"
    echo "element $i is ${brew_apps[$i+1]}"

    if [ ! -d  "$HOMEBREW_HOME/${brew_apps[$i+0]}" ]; then
        brew install ${brew_apps[$i+1]} 
    fi
done

## list
# if ! command_exists ssh-copy-id; then
    # brew install gpg ssh-copy-id
# fi

## emacs
# if [ ! -d  "$HOMEBREW_HOME/opt/emacs-plus@29" ]; then
#     ## https://github.com/d12frosted/homebrew-emacs-plus
#     ## url = https://github.com/emacs-mirror/emacs.git
#     brew tap d12frosted/emacs-plus
#     brew install emacs-plus@29 --with-spacemacs-icon
#     brew link emacs-plus@29
#     # open /usr/local/opt/emacs-plus@29
# fi

## fzf
if [ ! -d "$HOMEBREW_HOME/opt/fzf" ]; then
    $(brew --prefix)/opt/fzf/install
fi

## Finally, restart the nginx.
brew services restart nginx
