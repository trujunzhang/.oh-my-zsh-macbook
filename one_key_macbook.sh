# Requirements
#   .1 the lastest macos
#   .2 vpn
#   .3 xcode command line tools
#   .4 .oh-my-zsh
#   .5 ./allLinks

# cp ~/Desktop/zip/Homebrew /usr/local/Homebrew
# cp ~/Desktop/zip/emacs-plus@28--git /usr/local/Homebrew

# Import function files.
source ./bash/files-functions.sh
source ./bash/tools.sh

# copy 'homebrew'
if [ -d  ~/Desktop/zip/Homebrew ]; then
    if [ ! -d  /usr/local/Homebrew ]; then
        mv ~/Desktop/zip/Homebrew /usr/local/Homebrew
    fi
fi

# copy 'emacs'
if [ -d  '~/Desktop/zip/emacs-plus@28--git' ]; then
    if [ ! -d  '~/Library/Caches/Homebrew/emacs-plus@28--git' ]; then
        mkdir -p '~/Library/Caches/Homebrew'
        mv '~/Desktop/zip/emacs-plus@28--git' '~/Library/Caches/Homebrew/emacs-plus@28--git' 
    fi
fi

# homebrew
if ! command_exists brew; then
    ( exec "./bash/homebrew_install.sh" )
fi

## list
if ! command_exists ssh-copy-id; then
    brew install autojump gpg ssh-copy-id
fi

## emacs
if [ ! -d  /usr/local/opt/emacs-plus@28 ]; then
    brew tap d12frosted/emacs-plus
    brew install emacs-plus@28 --with-spacemacs-icon
    brew link emacs-plus@28
fi

## font-fira
if [ ! -f  ~/Library/Fonts/FiraCode-Bold.ttf ]; then
    brew tap homebrew/cask-fonts
    brew install --cask font-fira-code
fi

# nvm(node.js)
if [ ! -d  ~/.nvm ]; then
    cd ~/ && rm -rf .nvm 
    git clone file:///Users/djzhang/Documents/Organizations/IDES/nvm/localNVM .nvm
    cd ~/.nvm  && git checkout v0.38.0 && . ~/.nvm/nvm.sh && nvm install 12.13.1 && nvm use 12.13.1
fi    

## list
if ! command_exists yarn; then
    npm install -g yarn
    npm install -g npm-check-updates
    npm install -g monia-cli
fi    

## typescript
if ! command_exists tsc; then
    npm install -g typescript typescript-formatter tern js-beautify eslint 
fi    

# cocoapods
if ! command_exists pod; then
    gem install cocoapods
fi    

# firebase cli
if [ -f ~/Desktop/zip/firebase-tools-macos ]; then
    if [ ! -f /usr/local/bin/firebase ]; then
        mv ~/Desktop/zip/firebase-tools-macos /usr/local/bin/firebase
        chmod +x /usr/local/bin/firebase
    fi
fi
