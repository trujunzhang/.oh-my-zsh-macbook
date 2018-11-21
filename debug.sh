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
# dotenv(Express.js environment variables)
if [ ! -d $HOME/.dotenv ]
then
    ln -s $HOME/.oh-my-zsh-macbook/dotenv $HOME/.dotenv
    echo "File does not exist. [.dotenv]..."
else
    echo "Exist. [.dotenv]..."
fi

