#!/usr/bin/env bash

# For example:
#    func1 ball mystery
# ============================
function func1 {
    fun=$1
    book=$2
    printf "fun=%s,book=%s\n" "${fun}" "${book}"
}

DEFAULTACTION="ignore"

function  directoryLink {

    msg=$1
    src=$2
    dest=$3

    Param="${4:-$DEFAULTACTION}"

    echo ""
    printf "msg=%s\n" "${msg}"
    printf "src=%s\n" "${src}"
    printf "dest=%s\n" "${dest}"
    printf "action=%s\n" "${Param}"

    # It is a symlink!
    if [ -L "${dest}" ]; then
        if [ "$Param" = "delete" ]; then
            rm "${dest}"
        fi
    fi

    if [ -d "${dest}" ]
    then
        echo "Directory already exist. ${msg}"
    else
        if [ -d "${src}" ]
        then
            ln -s "${src}"  "${dest}"
            echo "Directory does not exist. ${msg}"
        fi
    fi

}


function  fileLink {

    msg=$1
    src=$2
    dest=$3

    Param="${4:-$DEFAULTACTION}"

    echo ""
    printf "msg=%s\n" "${msg}"
    printf "src=%s\n" "${src}"
    printf "dest=%s\n" "${dest}"
    printf "action=%s\n" "${Param}"

    # It is a symlink!
    if [ -L "${dest}" ]; then
        if [ "$Param" = "delete" ]; then
            rm "${dest}"
        fi
    fi

    if [ -f "${dest}" ]
    then
        echo "File already exist. ${msg}"
    else
        if [ -f "${src}" ]
        then
            ln -s "${src}"  "${dest}"
            echo "File does not exist. ${msg}"
        fi
    fi

}
