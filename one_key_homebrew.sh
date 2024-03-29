#!/usr/bin/env bash

CURRENT=`pwd`

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

brew_apps=(
    ## cocoapods(xcode)
    # "opt/cocoapods"             "cocoapods"
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
    ## neovim(spectre)
    "opt/gnu-sed"               "gnu-sed"

    ## fish
    "opt/fish"                  "fish"

    ## neovim
    "opt/neovim"                "neovim"

    ## autoenv
    # "opt/autoenv"               "autoenv"

    ## nginx
    "opt/nginx"                 "nginx"

    ## pyenv
    "opt/pyenv"                 "pyenv"

    ## jenkins-lts
    # https://www.jenkins.io/download/lts/macos
    "opt/jenkins-lts"           "jenkins-lts"
    "opt/fastlane"               "fastlane"

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
    # https://github.com/jqlang/jq
    "opt/jq"                 "jq"
    "opt/yabai"              "koekeishiya/formulae/yabai"
    # yabai --start-service

    ## skhd
    "opt/skhd"               "koekeishiya/formulae/skhd"
    # skhd --start-service

    ## React-native & Expo
    "opt/watchman"           "bundletool watchman"
    # brew tap facebook/fb
    "opt/idb-companion"      "idb-companion"

    ## neovim
    # https://github.com/universal-ctags/ctags
    "opt/universal-ctags"                    "universal-ctags"
    "opt/lua"                                "lua"
    "opt/lua-language-server"                "lua-language-server"
    # https://deno.land/
    "opt/deno"               "deno"

    "opt/mkcert"             "mkcert"
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

function install_emacs {
    brew tap d12frosted/emacs-plus

    # install latest stable release, with Spacemacs icon and native compilation
    brew install emacs-plus --with-spacemacs-icon --with-native-comp

    osascript -e 'tell application "Finder" to make alias file to posix file "/opt/homebrew/opt/emacs-plus@29/Emacs.app" at POSIX file "/Applications"'
}

## fzf
if [ ! -d "$HOMEBREW_HOME/opt/fzf" ]; then
    $(brew --prefix)/opt/fzf/install
fi

## Finally, restart the nginx.
brew services restart nginx
