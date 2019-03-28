#!/usr/bin/env bash

CURRENT=`pwd`
# Folders in Home.
USER_PROFILE_DJZHANG_HOME="/Users/djzhang"
ORGANIZATIONS_HOME="$USER_PROFILE_DJZHANG_HOME/Documents/Organizations"
# Links
ORGANIZATIONS_APPLICATION_HOME="$ORGANIZATIONS_HOME/__APPLICATIONS/Applications"
TRUJUNZHANG_DOTFILES_HOME="$ORGANIZATIONS_HOME/TRUJUNZHANG/.oh-my-zsh-macbook"
## Links(IDES)
IDES_HOME="$ORGANIZATIONS_HOME/IDES"
OH_MY_ZSH_HOME="$IDES_HOME/oh-my-zsh/oh-my-zsh"
POWER_LEVEL_9K_HOME="$IDES_HOME/oh-my-zsh/powerlevel9k"
### IDES(spacemacs)
SPACEMACS_HOME="$ORGANIZATIONS_HOME/spacemacs"
SPACEMACS_IDE_HOME="$SPACEMACS_HOME/spacemacs"
SPACEMACS_W3M_HOME="$SPACEMACS_HOME/venmos/w3m-layer"
SPACEMACS_VUE_HOME="$SPACEMACS_HOME/lawrsp/vue-layer"
COCOAPODS_HOME="$IDES_HOME/cocoapods/.cocoapods"
### IDES(ENVS)
IDES_HOME="$ORGANIZATIONS_HOME/IDES"

# Import function files.
source ./bash/files-functions.sh

# Environment


# trujunzhang's profile
directoryLink  "Application(djzhang)"  "$ORGANIZATIONS_APPLICATION_HOME"  "$HOME/Applications"

# cocoapods(ruby)
directoryLink  "cocoapods(respository)"  "$COCOAPODS_HOME"  "$HOME/.cocoapods"

# .oh-my-zsh
directoryLink  "oh-my-zsh(offline)"  "$OH_MY_ZSH_HOME"  "$HOME/.oh-my-zsh"

directoryLink  "oh-my-zsh(plugin:trujunzhang)"  "$TRUJUNZHANG_DOTFILES_HOME/custom/plugins/trujunzhang"  "$HOME/.oh-my-zsh/custom/plugins/trujunzhang"
directoryLink  "oh-my-zsh(theme:powerlevel9k)"  "$POWER_LEVEL_9K_HOME"  "$HOME/.oh-my-zsh/custom/themes/powerlevel9k"

# zshrc(rc)

fileLink ".zshrc"  "$TRUJUNZHANG_DOTFILES_HOME/zshrc.used" "$HOME/.zshrc"

directoryLink  "dotenv(Express.js environment variables)"  "$TRUJUNZHANG_DOTFILES_HOME/dotenv" "$HOME/.dotenv"

# spacemacs

directoryLink  "spacemacs(.emacs.d)"  "$SPACEMACS_IDE_HOME"  "$HOME/.emacs.d"

fileLink ".spacemacs(profile)" "$TRUJUNZHANG_DOTFILES_HOME/spacemacs.used" "$HOME/.spacemacs"

directoryLink "emacs(Private Layout)" "$TRUJUNZHANG_DOTFILES_HOME/emacs.d/layers/trujunzhang-workspace"  "$HOME/.emacs.d/private/trujunzhang-workspace"
directoryLink "w3m(third Layout)" "$SPACEMACS_W3M_HOME"  "$HOME/.emacs.d/private/w3m"
directoryLink "w3m(third Layout)" "$SPACEMACS_VUE_HOME"  "$HOME/.emacs.d/private/vue"

# spacevim
directoryLink "SpaceVim.d(UserProfile)"  "$TRUJUNZHANG_DOTFILES_HOME/SpaceVim.d" "$HOME/.SpaceVim.d"

fileLink "gvimrc(MacVim)" "$TRUJUNZHANG_DOTFILES_HOME/gvimrc.used" "$HOME/.gvimrc"

# pending(the following)
# fileLink ".spacevim" "$TRUJUNZHANG_DOTFILES_HOME/spacevim.used" "$HOME/.spacevim"

# pending(the following)
# ====================================
# directoryLink "CocoaPods(Library/Caches)"  "$TRUJUNZHANG_DOTFILES_HOME/lib/CocoaPods" "$HOME/Library/Caches/CocoaPods"
# directoryLink ".cocoapods" "$TRUJUNZHANG_DOTFILES_HOME/lib/responsitory.cocoapods" "$HOME/.cocoapods"
