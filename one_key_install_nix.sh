#!/usr/bin/env bash

CURRENT=$(pwd)

# Import function files.
source ./bash/files-functions.sh
source ./bash/tools.sh

NIX_CONF="/etc/nix/nix.conf"
NIX_CONF_BAK="/etc/nix/nix.conf.bak"

if [ ! -f "/etc/nix/nix.conf" ]; then
     NIX_INSTALLER_NIX_BUILD_USER_ID_BASE=400 curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
     if [  -f "/etc/nix/nix.conf" ]; then
       if [ ! -L "/etc/nix/nix.conf" ]; then
         . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
       fi
     fi
fi

# SSL cert problem for user
if type nix &>/dev/null; then
    sudo launchctl setenv NIX_SSL_CERT_FILE $NIX_SSL_CERT_FILE
    sudo launchctl kickstart -k system/org.nixos.nix-daemon
fi

if [ -f "/etc/nix/nix.conf" ]; then
    if [  -f "/etc/nix/nix.conf" ]; then
       if [ ! -L "/etc/nix/nix.conf" ]; then
           sudo mv /etc/nix/nix.conf /etc/nix/nix.conf.bak
       fi
    fi
    if [ ! -f "/etc/nix/nix.conf" ]; then
       nix run nix-darwin -- switch --flake "${TRUJUNZHANG_DOTFILES_HOME}/config/nix-darwin/$(uname -m)"
    fi
fi

if [ -f "/etc/nix/nix.conf.bak" ]; then
    if [ ! -L "/etc/nix/nix.conf" ]; then
        if [ ! -f "/etc/nix/nix.conf" ]; then
           sudo mv /etc/nix/nix.conf.bak /etc/nix/nix.conf
       fi
    fi
fi
