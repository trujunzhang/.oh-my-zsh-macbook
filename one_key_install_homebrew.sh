ORGANIZATIONS_HOME="$HOME/Documents/Organizations"
TRUJUNZHANG_DOTFILES_HOME="$ORGANIZATIONS_HOME/TRUJUNZHANG/_oh-my-zsh-macbook"

# see https://mirrors.tuna.tsinghua.edu.cn/help/homebrew/

export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"
export HOMEBREW_INSTALL_FROM_API=1
# export HOMEBREW_API_DOMAIN
# export HOMEBREW_BOTTLE_DOMAIN
# export HOMEBREW_PIP_INDEX_URL

function homebrew_install_third {
    git clone --depth=1 https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/install.git "/tmp/brew-install"
    /bin/bash /tmp/brew-install/install.sh
}

# /bin/bash -c "$(curl -fsSL https://github.com/Homebrew/install/raw/master/install.sh)"

export HOMEBREW_API_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles/api"
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles"

# brew install --cask jenkins
function brew_install_jenkins {
    brew install jenkins-lts
    sudo cp -Rvp "$TRUJUNZHANG_DOTFILES_HOME/config/homebrew/homebrew.mxcl.jenkins-lts.plist" "/opt/homebrew/opt/jenkins-lts/homebrew.mxcl.jenkins-lts.plist"
}

function brew_install_common {
    # https://github.com/Bhupesh-V/ugit
    brew install ugit
    brew install neovide

    brew install ruby@3.3

    # https://github.com/Muhammed770/hammerspoon-bluetooth-automation
    brew install blueutil

    # https://github.com/Kegworks-App/Kegworks
    # brew install --cask --no-quarantine Kegworks-App/kegworks/kegworks
}

function brew_install_libs {
    # asdf install ruby
    # psych:
    #         Could not be configured. It will not be installed.
    brew install libyaml
}

homebrew_install_third
# brew_install_jenkins
# brew_install_common 
# brew_install_libs
