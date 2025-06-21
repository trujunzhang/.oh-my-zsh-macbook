#!/usr/bin/env bash

CURRENT=$(pwd)

DEFAULTEVENTTYPE="all"
ASDF_EVENT_TYPE="${1:-$DEFAULTEVENTTYPE}"

DEFAULPLUGINTYPE="node"
ASDF_PLUGIN_TYPE="${2:-$DEFAULPLUGINTYPE}"

# Import function files.
source ./bash/files-functions.sh
source ./bash/tools.sh

# node_global="20.14.0"
# node_global="21.7.2"
node_global="22.14.0"
# node_old="16.16.0"
node_for_nvim="18.0.0"
# node_for_old_expensify="20.15.1"
node_for_old_expensify="20.18.1"

python_global="3.12.0"

# java_global="zulu-17.52.19"
java_global="zulu-17.52.19"

# if [ ! -d ~/.asdf ]; then
    # https://github.com/asdf-vm/asdf-plugins/blob/master/plugins/java
    # git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.16.0
# fi


# function uninstall_nodes {
#     info "starting to uninstall asdf(nodes)"
#     asdf uninstall nodejs "$node_global"
#     asdf uninstall nodejs "$node_for_nvim"
#     asdf uninstall nodejs "$node_for_old_expensify"
# }

function install_nodes {
    info "starting to install asdf(nodes)"
    asdf plugin add nodejs "https://github.com/asdf-vm/asdf-nodejs.git"
    asdf install nodejs "$node_global"
    asdf install nodejs "$node_for_nvim"
    asdf install nodejs "$node_for_old_expensify"
    asdf set -u nodejs "$node_global"
}
function install_java {
    # /Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home
    info "starting to install asdf(java)"
    asdf plugin add java "https://github.com/halcyon/asdf-java.git"
    # asdf install java "openjdk-17"
    asdf install java "$java_global"
    asdf set -u java "$java_global"
}
function install_python {
    info "starting to install asdf(python)"

    brew_install_app openssl 
    brew_install_app readline
    brew_install_app xz

    asdf plugin add python "https://github.com/danhper/asdf-python.git"
    asdf install python "$python_global"
    asdf set -u python "$python_global"
}
function install_ruby {
    info "starting to install asdf(ruby)"
    asdf plugin add ruby "https://github.com/asdf-vm/asdf-ruby.git"
    # export ASDF_RUBY_BUILD_VERSION=master
    asdf install ruby "3.4.0"
    asdf set -u ruby "3.4.0"
}
function install_lazygit {
    info "starting to install asdf(lazygit)"
    asdf plugin add lazygit "https://github.com/nklmilojevic/asdf-lazygit.git"
    # asdf install lazygit '0.44.1'
    # asdf global lazygit '0.44.1'
    asdf install lazygit 'latest'
    asdf set -u lazygit 'latest'
}
function install_uv {
    info "starting to install asdf(uv)"
    asdf plugin add uv https://github.com/asdf-community/asdf-uv.git
    asdf install uv latest
    asdf set -u uv 'latest'
}
function install_cocoapods {
    info "starting to install asdf(cocoapods)"
    asdf plugin add cocoapods "https://github.com/ronnnnn/asdf-cocoapods.git"
    # asdf install cocoapods '1.14.3'
    # asdf global cocoapods '1.14.3'
    asdf install cocoapods 'latest'
    asdf set -u cocoapods 'latest'
}

function install_asdf_plugins {
    if type asdf &>/dev/null; then
        # node
        install_nodes

        if [[ $(uname -m) == 'arm64' ]]; then
            info "M2 arm"
            # java
            # install_java
            # ruby
            # install_ruby
        fi

        # if [[ $(uname -m) == 'x86_64' ]]; then
        # info Mackook
        # fi
        # python
        # install_python
        # lazygit
        # install_lazygit
        # cocoapods
        # install_cocoapods
    fi
}

function update_asdf_plugins {
    if [ "$ASDF_PLUGIN_TYPE" = "node" ]; then
        # uninstall_nodes
        install_nodes
    elif [ "$ASDF_PLUGIN_TYPE" = "python" ]; then
        asdf uninstall python "$python_global"
        install_python
    elif [ "$ASDF_PLUGIN_TYPE" = "java" ]; then
        asdf uninstall java "$java_global"
        install_java
    elif [ "$ASDF_PLUGIN_TYPE" = "uv" ]; then
        asdf uninstall uv "latest"
        install_uv
    fi
}

function install_asdf_one_plugin {
    if [ "$ASDF_PLUGIN_TYPE" = "node" ]; then
        install_nodes
    elif [ "$ASDF_PLUGIN_TYPE" = "python" ]; then
        install_python
    elif [ "$ASDF_PLUGIN_TYPE" = "java" ]; then
        install_java
    elif [ "$ASDF_PLUGIN_TYPE" = "lazygit" ]; then
        install_lazygit
    # elif [ "$ASDF_PLUGIN_TYPE" = "cocoapods" ]; then
    #     install_cocoapods
    elif [ "$ASDF_PLUGIN_TYPE" = "ruby" ]; then
        install_ruby
    elif [ "$ASDF_PLUGIN_TYPE" = "uv" ]; then
        install_uv
    fi
}

if [ "$ASDF_EVENT_TYPE" = "all" ]; then
    install_asdf_plugins
elif [ "$ASDF_EVENT_TYPE" = "install" ]; then
    install_asdf_one_plugin
elif [ "$ASDF_EVENT_TYPE" = "update" ]; then
    update_asdf_plugins
fi


