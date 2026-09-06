#!/usr/bin/env bash

# Import function files.
source ./bash/files-functions.sh

source ./bash/shellUtils.sh
source ./bash/games/documents_fix.sh
source ./bash/games/games-data.sh

CURRENT=$(pwd)
# Folders in Home.

# TRUJUNZHANG_DOTFILES_HOME="$CURRENT"

show_info() {
    info "                         "
    info "=================================================================================="
    info "Bash version ${BASH_VERSION}...           "
    info "                                          "
    info "** CURRENT:                         ${CURRENT}       "
    info "** TRUJUNZHANG_DOTFILES_HOME:       ${TRUJUNZHANG_DOTFILES_HOME}       "
    info "=================================================================================="
    info "                                          "
}

link_common() {
    # bash
    # fileLink ".bash(profile)" "$TRUJUNZHANG_DOTFILES_HOME/bash_profile.symlink" "$HOME/.bash_profile"
    fileLink ".bash(rc)" "$TRUJUNZHANG_DOTFILES_HOME/bashrc_linux.symlink" "$HOME/.bashrc"
}

link_common
show_info
