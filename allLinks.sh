
#!/usr/bin/env bash

source ./bash/files-functions.sh

directoryLink  "oh-my-zsh(plugin:trujunzhang)"  "$HOME/.oh-my-zsh-macbook/custom/plugins/trujunzhang"  "$HOME/.oh-my-zsh/custom/plugins/trujunzhang"

fileLink ".zshrc"  "$HOME/.oh-my-zsh-macbook/zshrc.used" "$HOME/.zshrc"

directoryLink  "dotenv(Express.js environment variables)"  "$HOME/.oh-my-zsh-macbook/dotenv" "$HOME/.dotenv"

fileLink ".spacemacs" "$HOME/.oh-my-zsh-macbook/spacemacs.used" "$HOME/.spacemacs"

directoryLink "emacs(Private Layout)" "$HOME/.oh-my-zsh-macbook/emacs.d/layers/trujunzhang-workspace"  "$HOME/.emacs.d/private/trujunzhang-workspace"

directoryLink "SpaceVim.d(UserProfile)"  "$HOME/.oh-my-zsh-macbook/SpaceVim.d" "$HOME/.SpaceVim.d"

# pending(the following)
# fileLink ".spacevim" "$HOME/.oh-my-zsh-macbook/spacevim.used" "$HOME/.spacevim"

# pending(the following)
# ====================================
# directoryLink "CocoaPods(Library/Caches)"  "$HOME/.oh-my-zsh-macbook/lib/CocoaPods" "$HOME/Library/Caches/CocoaPods"
# directoryLink ".cocoapods" "$HOME/.oh-my-zsh-macbook/lib/responsitory.cocoapods" "$HOME/.cocoapods"