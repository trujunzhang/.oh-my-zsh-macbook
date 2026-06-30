#!/usr/bin/env bash

source ./bash/shellUtils.sh

DEFAULTACTION="ignore"

# ln -s /Volumes/MacUser/djzhang /Users/djzhang

function directoryLink {

    msg=$1
    src=$2
    dest=$3

    Param="${4:-$DEFAULTACTION}"

    info ""
    info "msg=${msg}"
    info "src=${src}"
    info "dest=${dest}"
    info "action=${Param}"

    # It is a symlink!
    if [ -L "${dest}" ]; then
        if [ "$Param" = "delete" ]; then
            rm "${dest}"
        fi
    fi

    fixed_src="${src}"
    if [ -d "${src}-${MY_MAC_TYPE}" ]; then
        fixed_src="${src}-${MY_MAC_TYPE}"
    fi

    if [ -d "${dest}" ]; then
        error "Directory already exist, ${msg}"
    else
        if [ -d "${fixed_src}" ]; then
            ln -s "${fixed_src}" "${dest}"
            success "Directory does not exist, ${msg}"
        fi
    fi

}

function fileLink {

    msg=$1
    src=$2
    dest=$3

    Param="${4:-$DEFAULTACTION}"

    info ""
    info "msg=${msg}"
    info "src=${src}"
    info "dest=${dest}"
    info "action=${Param}"

    # It is a symlink!
    if [ -L "${dest}" ]; then
        if [ "$Param" = "delete" ]; then
            rm "${dest}"
        fi
    fi

    fixed_src="${src}"
    if [ -f "${src}-${MY_MAC_TYPE}" ]; then
        fixed_src="${src}-${MY_MAC_TYPE}"
    fi

    if [ -f "${dest}" ]; then
        error "File already exist, ${msg}"
    else
        if [ -f "${fixed_src}" ]; then
            ln -s "${fixed_src}" "${dest}"
            success "File does not exist, ${msg}"
        fi
    fi

}
