# Show hidden files
    $ defaults write com.apple.finder AppleShowAllFiles -boolean true

# “XXXXX” is damaged and can’t be opened. You should move it to the Trash
    $ sudo spctl --master-disable

# xcode
    $ app store

# oh-my-zsh
    $ /Volumes/Data/ALLNew_Macbook/Users/djzhang/.oh-my-zsh

#  _oh-my-zsh-macbook
    $ ./allLinks.sh

# homebrew
    $ /usr/local/Homebrew
    $ /usr/local/Homebrew/Library/Taps/homebrew/homebrew-core
    $ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    $ brew install autojump gpg

# emacs-plus
  $ path: /Volumes/Data/MACBOOK_ORG/ApplicationBackup/emacs-plus@28--git.zip
  $ brew tap d12frosted/emacs-plus
  # to install Emacs 28
  $ brew install emacs-plus@28 --with-spacemacs-icon
  $ brew link emacs-plus@28
  
## font-fira
  $ brew tap homebrew/cask-fonts
  $ brew install --cask font-fira-code

## vue.js
  $ npm install -g eslint-cli prettier vls 

## javascript/typescript
  $ npm install -g typescript tslint typescript-formatter tern js-beautify eslint 

## python
  $ pinstall 'python-language-server[all]' pyls-isort pyls-mypy pyls-black  pyls-memestra flake8 autoflake importmagic epc

## pdf
  https://github.com/politza/pdf-tools#server-prerequisites
  $ brew install poppler automake
  $ run the command =pdf-tools-install=.

# pipenv
    $ brew install pipenv

# (pending)rvn(ruby)
    $ https://rvm.io/
		$ rvm install 2.6.0
		$ rvm use 2.6.0

# cocoapods(ruby)
    $ gem install cocoapods
		$ pod setup
        $ https://github.com/CocoaPods/Specs
		$ "/Users/djzhang/.cocoapods/repos/master/Specs/"

# nvm(node)
    $ dnvmreset
    
## global dependencies
    $ npm install -g npm-check-updates

# atom(ide)
    $ /Users/djzhang/.atom
    $ /Volumes/Data/ALLNew_Macbook/Users/djzhang/.atom

# vscode(ide)
    $ /Users/djzhang/.vscode
    $ /Volumes/Data/ALLNew_Macbook/Users/djzhang/.vscode

# vim-devicons(vim)
    $ https://github.com/ryanoasis/vim-devicons

#  nerd-fonts
    $ https://github.com/ryanoasis/nerd-fonts
    $ install:
       brew tap homebrew/cask-fonts
       brew install --cask font-hack-nerd-font

# neovim
    $ brew install neovim
    $ yarn global add neovim
    $ pip install pynvim

# node dependencies
    $ https://github.com/raineorshine/npm-check-updates    
    $ npm install -g npm-check-updates

# firebase cli
    $ firebase-tools-macos
    $ https://github.com/firebase/firebase-tools/releases
    $ copy to /usr/local/bin/firebase
