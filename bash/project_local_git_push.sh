#!/usr/bin/env bash

CURRENT_TIME=$(date +%Y-%m-%d_%H-%M-%S)

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR=$(pwd)
PROJECT_DOT_GIT_PATH="$PROJECT_DIR/.git"
PROJECT_NAME=$(basename "$PROJECT_DIR")
PARENT_DIR=$(dirname "$PROJECT_DIR")
GITHUB_DIR="$PARENT_DIR/_github"
PROJECT_GITHUB_PATH="$GITHUB_DIR/$PROJECT_NAME"
PROJECT_GITHUB_DOT_GIT_PATH="$GITHUB_DIR/$PROJECT_NAME/.git"
PROJECT_BACKUP_PATH="$GITHUB_DIR/${PROJECT_NAME}_BAK"
PROJECT_BACKUP_CURRENT_DIR="$PROJECT_BACKUP_PATH/${CURRENT_TIME}"

GIT_REMOTE_ORIGIN_URL=$(git config --get remote.origin.url)

source "$SCRIPT_DIR/shellUtils.sh"

show_messages() {
    title "Local git push"
    echo
    info "Current Time:                   $CURRENT_TIME"
    info "Project Name:                   $PROJECT_NAME"
    info "Project Dir:                    $PROJECT_DIR"
    info "Project '.git' path:            $PROJECT_DOT_GIT_PATH"
    info "Parent Dir:                     $PARENT_DIR"
    info "Github Dir:                     $GITHUB_DIR"
    info "Project Github Path:            $PROJECT_GITHUB_PATH"
    info "Project Github '.git' Path:     $PROJECT_GITHUB_DOT_GIT_PATH"

    info "Project Backup Path:            $PROJECT_BACKUP_PATH"
    echo
}

backup_current_local_git() {
    if [ -d "$PROJECT_GITHUB_PATH" ]; then
        mkdir -p "$PROJECT_BACKUP_PATH"
        mkdir -p "$PROJECT_BACKUP_CURRENT_DIR"

        info " Starting to backup the local '.git' to 'backup' folder"
        echo
        zip -y -r -q "${PROJECT_BACKUP_CURRENT_DIR}/git.zip" ".git"

        info " Starting to move the local '.git' to 'backup' folder"
        echo
        mv "$PROJECT_DOT_GIT_PATH" "$PROJECT_BACKUP_CURRENT_DIR/.git"
    else
        error "Not found '.git' folder: $PROJECT_GITHUB_PATH"
    fi
}

move_online_git_to_current_project() {
    success " Starting to move the online '.git' to 'Project' folder"
    echo
    mv "$PROJECT_GITHUB_DOT_GIT_PATH" "$PROJECT_DIR/.git"
}

push_local_git_to_online() {
    # empty 'remote origin url'
    if [ "$GIT_REMOTE_ORIGIN_URL" = "" ]; then
        success "It is the local '.git'"
        echo

        backup_current_local_git
        move_online_git_to_current_project
    else
        error "It is the online '.git'"
        echo
    fi
}

restore_online_git_to_dot_github_folder() {

    # empty 'remote origin url'
    if [ "$GIT_REMOTE_ORIGIN_URL" = "" ]; then
        error "It is the local '.git'"
        echo
    else
        success "It is the online '.git'"
        echo

        info " Starting to move the online '.git' to '.github' folder"
        echo
        mv "$PROJECT_DOT_GIT_PATH" "$PROJECT_GITHUB_DOT_GIT_PATH"
    fi
}

_help() {
    cat <<EOF
Usage: $(basename "$0") [OPTIONS]

OPTIONS
  push    push the local git to online 
  restore move the .git folder to the 'tmp' folder
EOF
}

case "$1" in
push)
    show_messages

    if [ -d "$PROJECT_DOT_GIT_PATH" ]; then
        push_local_git_to_online
    else
        error " Not found the '.git' folder"
    fi
    ;;
restore)
    show_messages

    if [ -d "$PROJECT_DOT_GIT_PATH" ]; then

        if [ -d "$PROJECT_GITHUB_DOT_GIT_PATH" ]; then
            error " already found the online '.git' folder in the '.github' folder"
        else
            restore_online_git_to_dot_github_folder
        fi

    else
        error " Not found the '.git' folder"
    fi
    ;;
h)
    show_messages
    _help
    exit 0
    ;;
*)
    show_messages
    _help
    exit 0
    ;;
esac
