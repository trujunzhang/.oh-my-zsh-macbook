#!/usr/bin/env bash

CURRENT=$(pwd)

# Import function files.
source ./bash/files-functions.sh
source ./bash/tools.sh

# node_global="20.14.0"
node_global="21.7.2"
node_old="16.16.0"
node_for_nvim="18"
node_for_old_expensify="20.14.0"

# nvm(node.js)
# if [ ! -d ~/.nvm ]; then
#     cd ~/ && rm -rf .nvm
#     git clone file://$ORGANIZATIONS_HOME/IDES/nvm/localNVM .nvm
#     cd ~/.nvm && git checkout v0.40.0 && . ~/.nvm/nvm.sh
#     nvm install "$node_global"
#     nvm alias default "$node_global" # default node.js
#     nvm install "$node_old"
#     nvm install "$node_for_nvim"
#     nvm install "$node_for_old_expensify"
# fi

node_apps=(
    "eslint_d"
    "prettier"

    # cli
    "netlify-cli"   # https://docs.netlify.com/cli/get-started/
    "vercel"        # https://vercel.com/docs/cli
    "sanity@latest" # https://www.sanity.io/docs/cli

    ## list
    # if ! command_exists yarn; then
    "yarn"
    "npm-check-updates"
    "monia-cli"
    "firebase-tools"
    # fi

    ## typescript
    "typescript tern js-beautify eslint"

    # supabase
    # "supabase"

    # expo
    # if ! command_exists expo; then
    # https://docs.expo.dev/get-started/installation/
    # "expo-cli"
    # https://docs.expo.dev/build/setup/
    "eas-cli"
    # fi

    # neovim
    "neovim"
    "pyright"
    "typescript-language-server"
    "vscode-langservers-extracted" # Ready:"vscode-eslint-language-server"
    "emmet-ls"

    # spacemacs typescript-mode
    # https://develop.spacemacs.org/layers/+lang/typescript/README.html
    "tslint typescript-formatter"

)

function install_global_npm {
    for ((i = 0; i < ${#node_apps[@]}; i = i + 1)); do
        echo "element $i is ${node_apps[$i]}"
        npm install --location=global ${node_apps[$i]}
    done

}

# nvm
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# nvm use "$node_global"
# install_global_npm

# nvm use "$node_old"
install_global_npm
