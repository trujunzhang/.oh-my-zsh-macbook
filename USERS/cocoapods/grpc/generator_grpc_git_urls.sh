#!/usr/bin/env bash

DIR='$HOME/Documents/Organizations/__CACHES/github/@spec/_master/grpc/.git/modules'
OUT_GIT_FILE='/tmp/xxx/grpc.txt'

rm -f $OUT_GIT_FILE
find "$DIR" -maxdepth 4 -mindepth 1 -type f | while read filepath; do
    parentname="$(basename "$filepath")"

    # echo "$filepath"
    # echo "$parentname"

    if [ "$parentname" = "config" ]; then
        echo "$filepath"

        CFG_FILE="$filepath"
        CFG_CONTENT=$(cat $CFG_FILE | sed -r '/[^=]+=[^=]+/!d' | sed -r 's/\s+=\s/=/g')
        echo "$CFG_CONTENT" >> $OUT_GIT_FILE

        # resposityPath="$(dirname "$filepath")"
        # echo "$resposityPath"

        # cd "$resposityPath"
        # git config --get remote.origin.url >> $OUT_GIT_FILE
    fi
done
