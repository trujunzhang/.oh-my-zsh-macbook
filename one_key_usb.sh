#!/usr/bin/env bash

source ./bash/shellUtils.sh

ROOT_DIR="/Volumes/MacGame"

buildUSBDir () {
    foldName=$1

    path="$ROOT_DIR/$foldName"
    
    # info "build usb dir, foldName: ${foldName}"
    # echo "build usb dir, foldName: ${foldName}"
    echo "build usb dir, fold path: ${path}"

    if [ -d "${path}" ]
    then
        error "Directory already exist. ${msg}"
    else
        mkdir -p "$path"
        success "Directory does not exist. ${msg}"
    fi
}

FOLD_ROOT=(
    "AppGames/Kegworks"
    "crossover"
    # "IPADShare"
    
    "MacApps/current/Developer/DerivedData"

    "MacCache"
    "MacCache/.android"
    "MacCache/.gradle"

    "MacCache/gitlab-runner"

    "MacCache/HomeCache/ccache"
    "MacCache/HomeCache/typescript"

    "MacCache/HomeOllama"
    "MacCache/jenkins"
    "MacCache/nvmCaches/.npm"
    "MacCache/orbstack/data"
    "MacCache/x86_64"

    "MacCache/__CACHES/github/@http"
    "MacCache/__CACHES/github/@spec"

    "movies/tmpFold"
    "openProjects"
    "whiskey"
    "WinGames/links"
)

for ((i = 0; i < ${#FOLD_ROOT[@]}; i = i + 1)); do
        name="${FOLD_ROOT[$i + 0]}"

        buildUSBDir "$name"
done







