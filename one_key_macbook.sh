# Requirements
#   .1 the lastest macos
#   .2 vpn
#   .3 xcode command line tools
#   .4 .oh-my-zsh
#   .5 ./allLinks

# cp ~/Desktop/zip/Homebrew /usr/local/Homebrew
# cp ~/Desktop/zip/Homebrew /usr/local/Homebrew

# Import function files.
source ./bash/files-functions.sh
source ./bash/tools.sh

# homebrew
if ! command_exists brew; then
    ( exec "./bash/homebrew_install.sh" )
    brew install autojump gpg ssh-copy-id
fi    

# nvm(node.js)
if [ ! -d  ~/.nvm ]; then
    cd ~/ && rm -rf .nvm 
    git clone file:///Users/djzhang/Documents/Organizations/IDES/nvm/localNVM .nvm
    cd ~/.nvm  && git checkout v0.38.0 && . ~/.nvm/nvm.sh && nvm install 12.13.1 && nvm use 12.13.1
    npm install -g yarn
    npm install -g npm-check-updates
    npm install -g monia-cli
fi    


