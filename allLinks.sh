#!/usr/bin/env bash

CURRENT=`pwd`
# Folders in Home.
USER_PROFILE_DJZHANG_HOME="/Users/djzhang"
ORGANIZATIONS_HOME="$USER_PROFILE_DJZHANG_HOME/Documents/Organizations"

# Home(All)
# ======================================
ORGANIZATIONS_APPLICATION_HOME="$ORGANIZATIONS_HOME/__APPLICATIONS/Applications"
TRUJUNZHANG_DOTFILES_HOME="$ORGANIZATIONS_HOME/TRUJUNZHANG/.oh-my-zsh-macbook"

# *Links(IDES)
# ======================================
CACHES_HOME="$ORGANIZATIONS_HOME/__CACHES"
# ==Items==
LIBRARY_YARN_HOME="$CACHES_HOME/Yarn"
LIBRARY_COCOAPODS_HOME="$CACHES_HOME/CocoaPods"


# *Links(IDES)
# ======================================
IDES_HOME="$ORGANIZATIONS_HOME/IDES"
# **IDES(zsh)
OH_MY_ZSH_HOME="$IDES_HOME/oh-my-zsh"
# ==Items==
OH_MY_ZSH_IDE_HOME="$OH_MY_ZSH_HOME/oh-my-zsh"
POWER_LEVEL_9K_HOME="$OH_MY_ZSH_HOME/powerlevel9k"
# **IDES(spacemacs)
SPACEMACS_HOME="$IDES_HOME/spacemacs"
# ==Items==
SPACEMACS_IDE_HOME="$SPACEMACS_HOME/spacemacs"
SPACEMACS_W3M_HOME="$SPACEMACS_HOME/venmos/w3m-layer"
SPACEMACS_VUE_HOME="$SPACEMACS_HOME/lawrsp/vue-layer"
### IDES(cocoapods)
COCOAPODS_HOME="$IDES_HOME/cocoapods/.cocoapods"
### IDES(ENVS)
ENVS_HOME="$IDES_HOME/ENVS"
# ==Items==
# git clone https://github.com/pyenv/pyenv.git ~/.pyenv
PYENV_HOME="$ENVS_HOME/pyenv"


# Import function files.
source ./bash/files-functions.sh

# $USERPROFILE/Library/Caches
directoryLink  "Caches(Yarn)"  "$LIBRARY_YARN_HOME"  "$HOME/Library/Caches/Yarn"
directoryLink  "Caches(CocoaPods)"  "$LIBRARY_COCOAPODS_HOME"  "$HOME/Library/Caches/CocoaPods"


# Environment
directoryLink  "Env(Pyenv)"  "$PYENV_HOME"  "$HOME/.pyenv"

# trujunzhang's profile
directoryLink  "Application(djzhang)"  "$ORGANIZATIONS_APPLICATION_HOME"  "$HOME/Applications"

# cocoapods(ruby)
directoryLink  "cocoapods(respository)"  "$COCOAPODS_HOME"  "$HOME/.cocoapods"

# .oh-my-zsh
# directoryLink  "oh-my-zsh(offline)"  "$OH_MY_ZSH_IDE_HOME"  "$HOME/.oh-my-zsh"

directoryLink  "oh-my-zsh(plugin:trujunzhang)"  "$TRUJUNZHANG_DOTFILES_HOME/custom/plugins/trujunzhang"  "$HOME/.oh-my-zsh/custom/plugins/trujunzhang"
directoryLink  "oh-my-zsh(theme:powerlevel9k)"  "$POWER_LEVEL_9K_HOME"  "$HOME/.oh-my-zsh/custom/themes/powerlevel9k"

# zshrc(rc)
fileLink ".zsh(env)"  "$TRUJUNZHANG_DOTFILES_HOME/zshenv.symlink" "$HOME/.zshenv"
fileLink ".zsh(rc)"  "$TRUJUNZHANG_DOTFILES_HOME/zshrc.symlink" "$HOME/.zshrc"

directoryLink  "dotenv(Express.js environment variables)"  "$TRUJUNZHANG_DOTFILES_HOME/dotenv" "$HOME/.dotenv"

# spacemacs

directoryLink  "spacemacs(.emacs.d)"  "$SPACEMACS_IDE_HOME"  "$HOME/.emacs.d"

fileLink ".spacemacs(profile)" "$TRUJUNZHANG_DOTFILES_HOME/spacemacs.symlink" "$HOME/.spacemacs"

directoryLink "emacs(Private Layout)" "$TRUJUNZHANG_DOTFILES_HOME/emacs.d/layers/trujunzhang-workspace"  "$HOME/.emacs.d/private/trujunzhang-workspace"
directoryLink "w3m(third Layout)" "$SPACEMACS_W3M_HOME"  "$HOME/.emacs.d/private/w3m"
directoryLink "w3m(third Layout)" "$SPACEMACS_VUE_HOME"  "$HOME/.emacs.d/private/vue"

# spacevim
directoryLink "SpaceVim.d(UserProfile)"  "$TRUJUNZHANG_DOTFILES_HOME/SpaceVim.d" "$HOME/.SpaceVim.d"

fileLink "gvimrc(MacVim)" "$TRUJUNZHANG_DOTFILES_HOME/gvimrc.symlink" "$HOME/.gvimrc"

# pending(the following)
# ====================================
# directoryLink "CocoaPods(Library/Caches)"  "$TRUJUNZHANG_DOTFILES_HOME/lib/CocoaPods" "$HOME/Library/Caches/CocoaPods"
# directoryLink ".cocoapods" "$TRUJUNZHANG_DOTFILES_HOME/lib/responsitory.cocoapods" "$HOME/.cocoapods"
