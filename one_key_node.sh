#!/usr/bin/env bash

CURRENT=`pwd` 

# Import function files.
source ./bash/files-functions.sh
source ./bash/tools.sh

# nvm(node.js)
if [ ! -d  ~/.nvm ]; then
    cd ~/ && rm -rf .nvm 
    git clone file:///Users/djzhang/Documents/Organizations/IDES/nvm/localNVM .nvm
    cd ~/.nvm  && git checkout v0.39.0 && . ~/.nvm/nvm.sh && nvm install 16.16.0 && nvm use 16.16.0
fi    

    npm install --location=global prettier

## list
# if ! command_exists yarn; then
    npm install --location=global yarn
    npm install --location=global npm-check-updates
    npm install --location=global monia-cli
    # npm install --location=global firebase-tools
# fi    

## typescript
# if ! command_exists tsc; then
    npm install --location=global typescript typescript-formatter tern js-beautify eslint 
# fi    

# expo
# if ! command_exists expo; then
    # https://docs.expo.dev/get-started/installation/
    npm install --location=global expo-cli 
    # https://docs.expo.dev/build/setup/
    npm install --location=global eas-cli
# fi    

