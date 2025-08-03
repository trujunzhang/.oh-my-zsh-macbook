if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -gx TERM xterm-256color

# environment variable
set -g -x ORGANIZATIONS_HOME "$HOME/Documents/Organizations"
set -g -x TRUJUNZHANG_DOTFILES_HOME "$ORGANIZATIONS_HOME/TRUJUNZHANG/_oh-my-zsh-macbook"

# Android SDK
# ======================================================================
# Add environment variable ANDROID_SDK_ROOT for cocos2d-x
set -g -x ANDROID_HOME "$HOME/Library/Android/sdk"
set -g -x ANDROID_SDK_ROOT "$HOME/Library/Android/sdk"
set -g -x ANDROID_USER_HOME "$HOME/Library/Android/sdk"
set -g -x REACT_NATIVE_DOWNLOADS_DIR "$HOME/.local/RN_DOWNLOADS"
set -g -x ACT_BINARY "$HOME/.local/bin/act"

# set -g -x SCCACHE_CXX=sccache
# set -g -x SCCACHE_CC=sccache

# set -g -x NDK_CCACHE ccache
# set -g -x NDK_CCACHE sccache
set -g -x ANDROID_NDK_HOME $HOME/Library/Android/sdk/ndk/25.1.8937393

# set -g -x HOMEBREW_BOTTLE_DOMAIN "https://mirrors.aliyun.com/homebrew/homebrew-bottles"
# set -g -x HOMEBREW_API_DOMAIN "https://mirrors.aliyun.com/homebrew/homebrew-bottles/api"

if test -d /opt/homebrew # MacOS arm64
    set -gx HOMEBREW_PREFIX /opt/homebrew
    set -gx HOMEBREW_CELLAR "$HOMEBREW_PREFIX/Cellar"
    set -gx HOMEBREW_REPOSITORY "$HOMEBREW_PREFIX/homebrew"
end

fish_add_path -gP "$HOMEBREW_PREFIX/bin" "$HOMEBREW_PREFIX/sbin"
set -q MANPATH; and set MANPATH ''
set -gx MANPATH "$HOMEBREW_PREFIX/share/man" $MANPATH
set -q INFOPATH; and set INFOPATH ''
set -gx INFOPATH "$HOMEBREW_PREFIX/share/info" $INFOPATH

# set -g -x http_proxy "http://127.0.0.1:1087"
# set -g -x https_proxy "http://127.0.0.1:1087"
# set -g -x ALL_PROXY "socks5://127.0.0.1:1086"

set -g -x NVM_NODEJS_ORG_MIRROR "http://nodejs.org/dist"

set -g -x ZELLIJ_AUTO_ATTACH true

fish_add_path "$ANDROID_SDK_ROOT"
fish_add_path "$ANDROID_SDK_ROOT/tools"
fish_add_path "$ANDROID_SDK_ROOT/platform-tools"

# djzhang's bin
# ======================================================================
fish_add_path "$HOME/.local/bin"
fish_add_path "$HOME/Documents/Organizations/__APPLICATIONS/BinApps"

if test "$(uname -m)" = arm64
    fish_add_path "$HOME/.local/bin/helix-aarch64-macos"
end

if test "$(uname -m)" = x86_64
    fish_add_path "$HOME/.local/bin/helix-x86_64-macos"
    fish_add_path "$HOME/.local/bin/nvim-macos-x86_64/bin"
end

# if "$(uname -m)" == 'arm64'
# end

# switch "$(uname -m)"
#     case "x86_64"
#         echo "wanghao x86_64"
#     case '*'
#         echo I have no idea what a $animal is
# end

# echo "arm macos system! $(uname -m)"
# echo "arm macos system! $(uname)"

# ======================================================================
# java environment
# ======================================================================
# set up java with jenv
# do not set JAVA_HOME here
if [ -d $HOME/.jenv ]
    set PATH $HOME/.jenv/bin $PATH
    eval (jenv init - | source)
end

# set -e JAVA_HOME ( jenv javahome )

# ======================================================================
# Python environment
# ======================================================================
# >>> conda initialize >>>
# Refer:
#    https://stackoverflow.com/questions/34280113/add-conda-to-path-in-fish
if [ -f $HOME/miniforge3/bin/conda ]
    eval "$HOME/miniforge3/bin/conda" "shell.fish" hook $argv | source
end
# <<< conda initialize <<<

if type conda &>/dev/null
    conda activate tf_m1
end

if type starship &>/dev/null
    starship init fish | source
end

if [ -d $HOME/.pyenv ]
    if type pyenv &>/dev/null
        pyenv init - | source
    end
end

if type -q eza
    alias ll "eza -l -g --icons"
    alias lla "ll -a"
end

# ======================================================================
# finally
# ======================================================================
# Aliases
if [ -f $HOME/.config/fish/functions/trujunzhang.fish ]
    source $HOME/.config/fish/functions/trujunzhang.fish
end

# https://rvm.io/integration/fish
if [ -d $HOME/.rvm ]
    rvm default
end

if type fzf &>/dev/null
    fzf --fish | source

    # Fzf
    set -g FZF_PREVIEW_FILE_CMD "bat --style=numbers --color=always --line-range :500"
    set -g FZF_LEGACY_KEYBINDINGS 0
end

set -x THEFUCK_OVERRIDDEN_ALIASES 'gsed,git'

if type zellij &>/dev/null
    if set -q ZELLIJ
    else
        zellij attach -c djzhang-mac
    end
end

# if status is-interactive
#     eval (zellij setup --generate-auto-start fish | string collect)
# end

# if not set -q ZELLIJ
#     if test "$ZELLIJ_AUTO_ATTACH" = true
#         zellij attach -c
#     else
#         zellij
#     end

#     if test "$ZELLIJ_AUTO_EXIT" = true
#         kill $fish_pid
#     end
# end

fish_add_path "/opt/homebrew/opt/ruby@3.3/bin"

# ASDF configuration code
if test -z $ASDF_DATA_DIR
    set _asdf_shims "$HOME/.asdf/shims"
else
    set _asdf_shims "$ASDF_DATA_DIR/shims"
end

# Do not use fish_add_path (added in Fish 3.2) because it
# potentially changes the order of items in PATH
if not contains $_asdf_shims $PATH
    set -gx --prepend PATH $_asdf_shims
end
set --erase _asdf_shims
