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

# homebrew_install_third

# brew install --cask jenkins
brew install jenkins-lts
