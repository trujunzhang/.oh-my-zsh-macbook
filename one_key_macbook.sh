#!/usr/bin/env bash

# Requirements
#   .1 the lastest macos
#   .2 vpn
#   .3 xcode command line tools
#   .4 .oh-my-zsh
#   .5 ./allLinks

CURRENT=`pwd` 

# Import function files.
source ./bash/files-functions.sh
source ./bash/tools.sh


# cocoapods
if ! command_exists pod; then
    gem install cocoapods --verbose
fi    

# firebase cli(pending)
## https://github.com/firebase/firebase-tools/releases
# if [ -f ~/Desktop/zip/firebase-tools-macos ]; then
    # if [ ! -f /usr/local/bin/firebase ]; then
        # mv ~/Desktop/zip/firebase-tools-macos /usr/local/bin/firebase
        # chmod +x /usr/local/bin/firebase
    # fi
# fi

