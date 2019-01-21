#!/usr/bin/env bash

# For example:
#    func1 ball mystery
# ============================
function func1 {
    fun=$1
    book=$2
    printf "fun=%s,book=%s\n" "${fun}" "${book}"
}

function  directoryLink {
    
    msg=$1
    src=$2
    dest=$3
    
    echo ""
    printf "msg=%s\n" "${msg}"
    printf "src=%s\n" "${src}"
    printf "dest=%s\n" "${dest}"
    
    if [ ! -d "${dest}" ]
    then
        ln -s "${src}"  "${dest}"
        echo "Directory does not exist. ${msg}"
    else
        echo "Directory already exist. ${msg}"
    fi
    
}


function  fileLink {
    
    msg=$1
    src=$2
    dest=$3
    
    echo ""
    printf "msg=%s\n" "${msg}"
    printf "src=%s\n" "${src}"
    printf "dest=%s\n" "${dest}"
    
    if [ ! -f "${dest}" ]
    then
        ln -s "${src}"  "${dest}"
        echo "Directory does not exist. ${msg}"
    else
        echo "Directory already exist. ${msg}"
    fi
    
}