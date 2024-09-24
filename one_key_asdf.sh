#!/usr/bin/env bash

CURRENT=$(pwd)

# Import function files.
source ./bash/files-functions.sh
source ./bash/tools.sh

# node_global="20.14.0"
node_global="21.7.2"
node_old="16.16.0"
node_for_nvim="18.0.0"
node_for_old_expensify="20.14.0"

if [ ! -d ~/.asdf ]; then
    # https://github.com/asdf-vm/asdf-plugins/blob/master/plugins/java
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.1
fi

function install_nodes {
    info "starting to install asdf(nodes)"
    asdf plugin add nodejs "https://github.com/asdf-vm/asdf-nodejs.git"
    asdf install nodejs "$node_global"
    asdf install nodejs "$node_for_nvim"
    asdf global nodejs "$node_global"
}
function install_java {
    # /Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home
    info "starting to install asdf(java)"
    asdf plugin add java "https://github.com/halcyon/asdf-java.git"
    # asdf install java "openjdk-17"
    asdf install java "zulu-17.52.19"
    asdf global java "zulu-17.52.19"
}
function install_python {
    info "starting to install asdf(python)"
    asdf plugin add python "https://github.com/danhper/asdf-python.git"
    asdf install python "3.12.0"
    asdf global python "3.12.0"
}
function install_ruby {
    info "starting to install asdf(ruby)"
    asdf plugin add ruby "https://github.com/asdf-vm/asdf-ruby.git"
    # export ASDF_RUBY_BUILD_VERSION=master
    asdf install ruby "3.3.5"
    asdf global ruby "3.3.5"
}
function install_lazygit {
    info "starting to install asdf(lazygit)"
    asdf plugin add lazygit "https://github.com/nklmilojevic/asdf-lazygit.git"
    asdf install lazygit '0.44.1'
    asdf global lazygit '0.44.1'
}
function install_cocoapods {
    info "starting to install asdf(cocoapods)"
    asdf plugin add cocoapods "https://github.com/ronnnnn/asdf-cocoapods.git"
    asdf install cocoapods '1.14.3'
    asdf global cocoapods '1.14.3'

    # asdf plugin add ruby ""
    # asdf install ruby latest
}

if type asdf &>/dev/null; then
    # node
    install_nodes

    if [[ $(uname -m) == 'arm64' ]]; then
        # info M2
        # java
        install_java
        # ruby
        # install_ruby
    fi

    # if [[ $(uname -m) == 'x86_64' ]]; then
    # info Mackook
    # fi
    # python
    install_python
    # lazygit
    install_lazygit
    # cocoapods
    install_cocoapods
fi
