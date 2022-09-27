#!/usr/bin/env bash

DIR='/Users/djzhang/Documents/Organizations/__CACHES/github/common'
OUT_GIT_FILE='/Users/djzhang/Documents/Organizations/__CACHES/github/resposity.txt'

rm -f $OUT_GIT_FILE
find "$DIR" -maxdepth 4 -mindepth 1 -type d | while read filepath; do
    parentname="$(basename "$filepath")"

    # echo "$filepath"
    # echo "$parentname"

    if [ "$parentname" = ".git" ]; then
        # echo "$filepath"
        resposityPath="$(dirname "$filepath")"
        # echo "$resposityPath"

        cd "$resposityPath"
        git config --get remote.origin.url >> $OUT_GIT_FILE
    fi
done
