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
    asdf plugin add node "https://github.com/asdf-vm/asdf-nodejs.git"
    asdf install node "$node_global"
    asdf install node "$node_for_nvim"
    asdf global node "$node_global"
}
function install_java {
    # /Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home
    info "starting to install asdf(java)"
    asdf plugin add java "https://github.com/halcyon/asdf-java.git"
    # asdf install java "openjdk-17"
    asdf install java "zulu-17.52.19"
}
function install_python {
    info "starting to install asdf(python)"
    asdf plugin add python "https://github.com/danhper/asdf-python.git"
    asdf install python "3.12.0"
}
function install_ruby {
    info "starting to install asdf(ruby)"
    asdf plugin add ruby "https://github.com/asdf-vm/asdf-ruby.git"
    asdf install ruby "3.0.6"
}
function install_others {
    info "starting to install asdf(cocoapods)"
    asdf plugin add cocoapods "https://github.com/ronnnnn/asdf-cocoapods.git"
    asdf install cocoapods latest

    info "starting to install asdf(lazygit)"
    asdf plugin add lazygit "https://github.com/nklmilojevic/asdf-lazygit.git"
    asdf install lazygit latest


    # asdf plugin add ruby ""
    # asdf install ruby latest
}

if type asdf &>/dev/null; then
    # node
    # install_nodes
    # java
    install_java
    # python
    install_python
    # ruby
    install_ruby
    # others
    install_others
fi
