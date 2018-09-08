#!/usr/bin/env bash

# submodule
echo "First of all, pull all submodules. [spacemacs]"
#git submodule init
#git submodule update

echo ""
# .oh-my-zsh(plugins)
if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/trujunzhang" ]
then
ln -s "$HOME/.oh-my-zsh-macbook/custom/plugins/trujunzhang"  "$HOME/.oh-my-zsh/custom/plugins/trujunzhang"
    echo "File does not exist. [trujunzhang, zsh plugin]..."
else
    echo "Exist. [trujunzhang, zsh's plugin]..."
fi

echo ""
# .oh-my-zsh
if [ ! -f $HOME/.zshrc ]
then
ln -s $HOME/.oh-my-zsh-macbook/zshrc.used $HOME/.zshrc
    echo "File does not exist. [.zshrc]..."
else
    echo "Exist. [.zshrc]..."
fi

echo ""
# emacs.d
if [ ! -d $HOME/.emacs.d ]
then
ln -s $HOME/.oh-my-zsh-macbook/emacs.d $HOME/.emacs.d
    echo "File does not exist. [.emacs.d]..."
else
    echo "Exist. [.emacs.d]..."
fi

echo ""
# spacemacs
if [ ! -f $HOME/.spacemacs ]
then
ln -s $HOME/.oh-my-zsh-macbook/spacemacs.used $HOME/.spacemacs
    echo "File does not exist. [.spacemacs]..."
else
    echo "Exist. [.spacemacs]..."
fi


echo ""
# dotenv(Express.js environment variables)
if [ ! -d $HOME/.dotenv ]
then
ln -s $HOME/.oh-my-zsh-macbook/dotenv $HOME/.dotenv
    echo "File does not exist. [.dotenv]..."
else
    echo "Exist. [.dotenv]..."
fi


echo ""
# vim.d
if [ ! -d $HOME/.SpaceVim.d ]
then
ln -s $HOME/.oh-my-zsh-macbook/SpaceVim.d $HOME/.SpaceVim.d
    echo "File does not exist. [.SpaceVim.d]..."
else
    echo "Exist. [.SpaceVim.d]..."
fi


echo ""
# vim.d
if [ ! -d $HOME/Library/Caches/CocoaPods ]
then
ln -s $HOME/.oh-my-zsh-macbook/lib/CocoaPods $HOME/Library/Caches/CocoaPods
    echo "File does not exist. [CocoaPods]..."
else
    echo "Exist. [CocoaPods]..."
fi


echo ""
# vim.d
if [ ! -d $HOME/.cocoapods ]
then
ln -s $HOME/.oh-my-zsh-macbook/lib/responsitory.cocoapods $HOME/.cocoapods
    echo "File does not exist. [.cocoapods]..."
else
    echo "Exist. [.cocoapods]..."
fi


echo ""
echo "This script is about to run npm."
sh ./USERS/NODE.js/global_npm.sh
echo "This script has just run npm."
