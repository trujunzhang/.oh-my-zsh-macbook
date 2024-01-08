#!/usr/bin/env bash

source ./shellUtils.sh

DEFAULTACTION="ignore"

function  directoryLink {

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

    if [ -d "${dest}" ]
    then
        error "Directory already exist. ${msg}"
    else
        if [ -d "${src}" ]
        then
            ln -s "${src}"  "${dest}"
            success "Directory does not exist. ${msg}"
        fi
    fi

}


function  fileLink {

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

    if [ -f "${dest}" ]
    then
        error "File already exist. ${msg}"
    else
        if [ -f "${src}" ]
        then
            ln -s "${src}"  "${dest}"
            success "File does not exist. ${msg}"
        fi
    fi

}
