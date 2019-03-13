
CURRENT=`pwd`
ORGANIZATIONS_HOME="/Users/djzhang/Documents/Organizations"
TRUJUNZHANG_DOTFILES_HOME="$ORGANIZATIONS_HOME/TRUJUNZHANG/.oh-my-zsh-macbook"
OH_MY_ZSH_HOME="$ORGANIZATIONS_HOME/IDES/oh-my-zsh/oh-my-zsh"
SPACEMACS_HOME="$ORGANIZATIONS_HOME/IDES/spacemacs/spacemacs"
SPACEMACS_W3M_HOME="$ORGANIZATIONS_HOME/IDES/spacemacs/venmos/w3m-layer"


#!/usr/bin/env bash

source ./bash/files-functions.sh

# .oh-my-zsh
directoryLink  "oh-my-zsh(offline)"  "$OH_MY_ZSH_HOME"  "$HOME/.oh-my-zsh"

directoryLink  "oh-my-zsh(plugin:trujunzhang)"  "$TRUJUNZHANG_DOTFILES_HOME/custom/plugins/trujunzhang"  "$HOME/.oh-my-zsh/custom/plugins/trujunzhang"

# zshrc(rc)

fileLink ".zshrc"  "$TRUJUNZHANG_DOTFILES_HOME/zshrc.used" "$HOME/.zshrc"

directoryLink  "dotenv(Express.js environment variables)"  "$TRUJUNZHANG_DOTFILES_HOME/dotenv" "$HOME/.dotenv"

# spacemacs

directoryLink  "spacemacs(.emacs.d)"  "$SPACEMACS_HOME"  "$HOME/.emacs.d"

fileLink ".spacemacs(profile)" "$TRUJUNZHANG_DOTFILES_HOME/spacemacs.used" "$HOME/.spacemacs"

directoryLink "emacs(Private Layout)" "$TRUJUNZHANG_DOTFILES_HOME/emacs.d/layers/trujunzhang-workspace"  "$HOME/.emacs.d/private/trujunzhang-workspace"
directoryLink "w3m(third Layout)" "$SPACEMACS_W3M_HOME"  "$HOME/.emacs.d/private/w3m"

# spacevim
directoryLink "SpaceVim.d(UserProfile)"  "$TRUJUNZHANG_DOTFILES_HOME/SpaceVim.d" "$HOME/.SpaceVim.d"

fileLink "gvimrc(MacVim)" "$TRUJUNZHANG_DOTFILES_HOME/gvimrc.used" "$HOME/.gvimrc"

# pending(the following)
# fileLink ".spacevim" "$TRUJUNZHANG_DOTFILES_HOME/spacevim.used" "$HOME/.spacevim"

# pending(the following)
# ====================================
# directoryLink "CocoaPods(Library/Caches)"  "$TRUJUNZHANG_DOTFILES_HOME/lib/CocoaPods" "$HOME/Library/Caches/CocoaPods"
# directoryLink ".cocoapods" "$TRUJUNZHANG_DOTFILES_HOME/lib/responsitory.cocoapods" "$HOME/.cocoapods"
 Unknown layer w3m declared in dotfile. 
