#!/usr/bin/env bash

CURRENT=$(pwd)

# Import function files.
source ./bash/files-functions.sh
source ./bash/tools.sh

if [ ! -d "/etc/nix" ]; then
     NIX_INSTALLER_NIX_BUILD_USER_ID_BASE=400 curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install --extra-conf 'trusted-users = $(whoami)'
     if [  -d "/etc/nix" ]; then
         . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
     fi
fi

if [ -d "/etc/nix" ]; then
    if [  -f "/etc/nix/nix.conf" ]; then
       if [ ! -L "/etc/nix/nix.conf" ]; then
           sudo mv /etc/nix/nix.conf /etc/nix/nix.conf.bak
       fi
    fi
    if [ ! -f "/etc/nix/nix.conf" ]; then
       nix run nix-darwin -- switch --flake "${TRUJUNZHANG_DOTFILES_HOME}/config/nix-darwin/$(uname -m)"
    fi
fi
