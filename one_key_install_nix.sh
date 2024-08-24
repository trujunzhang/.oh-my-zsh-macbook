#!/usr/bin/env bash

CURRENT=$(pwd)

# Import function files.
source ./bash/files-functions.sh
source ./bash/tools.sh

NIX_CONF="/etc/nix/nix.conf"
NIX_CONF_BAK="/etc/nix/nix.conf.bak"

if type nix &>/dev/null; then
    info "nix already installed"
else
    info "starting to install nix"
    export NIX_FIRST_BUILD_UID=30001
    sudo curl -L https://nixos.org/nix/install | sh
fi

# if type nix &>/dev/null; then
#     info "starting to update nix-channel"
#     nix-channel --add https://mirrors.ustc.edu.cn/nix-channels/nixpkgs-unstable nixpkgs
#     nix-channel --update
# fi

# SSL cert problem for user
if type nix &>/dev/null; then
    info "starting to setup ssl cert"
#     sudo launchctl setenv NIX_SSL_CERT_FILE $NIX_SSL_CERT_FILE
#     sudo launchctl kickstart -k system/org.nixos.nix-daemon
fi

if type nix &>/dev/null; then
    if [ ! -L "/etc/nix/nix.conf" ]; then
        if [  -f "/etc/nix/nix.conf" ]; then
            info "starting to move nix.conf"
            sudo mv /etc/nix/nix.conf /etc/nix/nix.conf.bak
       fi
#        sudo mv /etc/bashrc /etc/bashrc.bak
#        sudo mv /etc/zshrc /etc/zshrc.bak
       if [ ! -f "/etc/nix/nix.conf" ]; then
            info "starting to install nix-darwin"
            nix run nix-darwin -- switch --flake "$TRUJUNZHANG_DOTFILES_HOME/config/nix-darwin/$(uname -m)"
       fi
    fi
fi

if [ -f "/etc/nix/nix.conf.bak" ]; then
    if [ ! -L "/etc/nix/nix.conf" ]; then
        if [ ! -f "/etc/nix/nix.conf" ]; then
           info "failed to install, restore nix.conf"
           sudo mv /etc/nix/nix.conf.bak /etc/nix/nix.conf
       fi
    fi
fi
