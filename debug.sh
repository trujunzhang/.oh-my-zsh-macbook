#!/usr/bin/env bash

source ./bash/files-functions.sh

directoryLink  "oh-my-zsh(plugin:trujunzhang)"  "$HOME/.oh-my-zsh-macbook/custom/plugins/trujunzhang"  "$HOME/.oh-my-zsh/custom/plugins/trujunzhang"

fileLink ".zshrc"  "$HOME/.oh-my-zsh-macbook/zshrc.used" "$HOME/.zshrc"

directoryLink  "dotenv(Express.js environment variables)"  "$HOME/.oh-my-zsh-macbook/dotenv" "$HOME/.dotenv"

fileLink ".spacemacs" "$HOME/.oh-my-zsh-macbook/spacemacs.used" "$HOME/.spacemacs"

directoryLink "emacs(Private Layout)" "$HOME/.oh-my-zsh-macbook/emacs.d/layers/trujunzhang-workspace"  "$HOME/.emacs.d/private/trujunzhang-workspace"

fileLink ".spacevim" "$HOME/.oh-my-zsh-macbook/spacevim.used" "$HOME/.spacevim"


echo ""
echo "This script is about to run npm."
sh ./USERS/NODE.js/global_npm.sh
echo "This script has just run npm."
