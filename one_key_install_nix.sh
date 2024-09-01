#!/usr/bin/env bash

CURRENT=$(pwd)

# Import function files.
source ./bash/files-functions.sh
source ./bash/tools.sh

NIX_CONF="/etc/nix/nix.conf"
NIX_CONF_BAK="/etc/nix/nix.conf.bak"

function nix_install_official {
    info "Starting to install nix(official)"
    export NIX_FIRST_BUILD_UID=30001
    sudo curl -L https://nixos.org/nix/install | sh
}

function nix_install_proxy {
    info "Starting to install nix(proxy)"
    export NIX_FIRST_BUILD_UID=30001
    sudo curl -L https://mirrors.tuna.tsinghua.edu.cn/nix/latest/install | sh
}

function nix_install_third {
    info "Starting to install nix(third)"
     NIX_INSTALLER_NIX_BUILD_USER_ID_BASE=400 curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install --extra-conf 'trusted-users = $(whoami)'
     if [  -f "/etc/nix/nix.conf" ]; then
       if [ ! -L "/etc/nix/nix.conf" ]; then
         . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
       fi
     fi
}

if type nix &>/dev/null; then
    info "nix already installed"
else
    nix_install_official
#     nix_install_proxy
    # nix_install_third
fi

# if type nix &>/dev/null; then
#     info "starting to update nix-channel"
#     nix-channel --add https://mirrors.ustc.edu.cn/nix-channels/nixpkgs-unstable nixpkgs
#     nix-channel --update
# fi

# SSL cert problem for user
if type nix &>/dev/null; then
    info "Starting to setup ssl cert"
#     sudo launchctl setenv NIX_SSL_CERT_FILE $NIX_SSL_CERT_FILE
#     sudo launchctl kickstart -k system/org.nixos.nix-daemon
fi

function copy_nvim_flake {
    if [ -d "/tmp/neovim-flake-jordanisaacs" ]; then
        info "Already exist nvim flake(neovim-flake-jordanisaacs)"
        rm -rf "/tmp/neovim-flake-jordanisaacs"
    fi
    info "Starting to copy nvim flake(neovim-flake-jordanisaacs) to '/tmp/neovim-flake-jordanisaacs'"
    cp -Rvp  "$TRUJUNZHANG_DOTFILES_HOME/config/neovim-flake-jordanisaacs" "/tmp/neovim-flake-jordanisaacs"
}

if type nix &>/dev/null; then
    copy_nvim_flake
    if [ ! -L "/etc/nix/nix.conf" ]; then
       if [  -f "/etc/nix/nix.conf" ]; then
            info "Starting to move nix.conf to nix.conf.bak"
            sudo mv /etc/nix/nix.conf /etc/nix/nix.conf.bak
       fi
       if [  -L "$HOME/.zshrc" ]; then
           rm "$HOME/.zshrc"  
       fi
       if [  -L "$HOME/.zshenv" ]; then
           rm "$HOME/.zshenv"  
       fi
#        sudo mv /etc/bashrc /etc/bashrc.bak
#        sudo mv /etc/zshrc /etc/zshrc.bak
       if [ ! -f "/etc/nix/nix.conf" ]; then
            info "Starting to install nix-darwin"
            nix run nix-darwin -- switch --flake "$TRUJUNZHANG_DOTFILES_HOME/config/nix-darwin/universal"
       fi
    fi
fi

if [ -f "/etc/nix/nix.conf.bak" ]; then
    if [ ! -L "/etc/nix/nix.conf" ]; then
        if [ ! -f "/etc/nix/nix.conf" ]; then
           info "Failed to install, restore nix.conf"
           sudo mv /etc/nix/nix.conf.bak /etc/nix/nix.conf
        fi
        # zshrc(rc)
        info "Failed to install, restore zshrc to (users.HOME)"
        fileLink ".zsh(env)" "$TRUJUNZHANG_DOTFILES_HOME/zshenv.symlink" "$HOME/.zshenv"
        fileLink ".zsh(rc)" "$TRUJUNZHANG_DOTFILES_HOME/zshrc.symlink" "$HOME/.zshrc"
    fi
fi
