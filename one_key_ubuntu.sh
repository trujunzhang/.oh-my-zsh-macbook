#!/usr/bin/env bash

##################################################################
#    Welcome to Ubuntu 18.04 LTS (GNU/Linux 4.15.0-20-generic x86_64)
#
#
#    git clone https://github.com/trujunzhang/.oh-my-zsh-macbook && cp /$HOME/.oh-my-zsh-macbook/one_key_ubuntu.sh /usr/bin/one_key_ubuntu && chmod +x /usr/bin/one_key_ubuntu && cp /$HOME/.oh-my-zsh-macbook/bash/x_ui_install.sh /usr/bin/x_ui_install && chmod +x /usr/bin/x_ui_install 
#
#
#    cd .oh-my-zsh-macbook && git pull && cp -u /$HOME/.oh-my-zsh-macbook/one_key_ubuntu.sh /usr/bin/one_key_ubuntu && chmod +x /usr/bin/one_key_ubuntu
#
# 
#    git clone https://github.com/trujunzhang/.oh-my-zsh-macbook && cd .oh-my-zsh-macbook && git pull && cp -u /$HOME/.oh-my-zsh-macbook/one_key_vpn.sh /usr/bin/one_key_vpn && chmod +x /usr/bin/one_key_vpn && one_key_vpn
# 
#    cd .oh-my-zsh-macbook && git pull && cp -u /$HOME/.oh-my-zsh-macbook/one_key_vpn.sh /usr/bin/one_key_vpn && chmod +x /usr/bin/one_key_vpn
#
# 
#### common shells    
#    cp /$HOME/.oh-my-zsh-macbook/USERS/cocoapods/generator_git_offline.sh /usr/bin/generator_git_offline && chmod +x /usr/bin/generator_git_offline 
#    cp /$HOME/.oh-my-zsh-macbook/USERS/cocoapods/grpc/generator_grpc_git_offline.sh /usr/bin/generator_grpc_git_offline && chmod +x /usr/bin/generator_grpc_git_offline 
#    cp /$HOME/.oh-my-zsh-macbook/USERS/cocoapods/grpc/git_clone_grpc_branch.sh /usr/bin/git_clone_grpc_branch && chmod +x /usr/bin/git_clone_grpc_branch 
#
#
#    git clone https://github.com/trujunzhang/.oh-my-zsh-macbook && cd .oh-my-zsh-macbook && chmod +x one_key_ubuntu.sh && chmod +x bash/x_ui_install.sh
#
#    cd /$HOME/.oh-my-zsh-macbook && ./one_key_ubuntu.sh
#
#
#    x_ui_install && one_key_ubuntu 
#
#
##################################################################
command_exists () {
    type "$1" &> /dev/null ;
}

function install_zsh {
    # Oh My Zsh
    sudo apt install -y zsh

    # Setup zsh as default shell
    chsh -s /usr/bin/zsh
    echo $SHELL

    # sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    git clone https://github.com/ohmyzsh/ohmyzsh.git "/$HOME/.oh-my-zsh"

    #Theme: https://github.com/ohmyzsh/ohmyzsh/wiki/themes
    rm "/$HOME/.zshrc"
    cp -r "$HOME/.oh-my-zsh-macbook/zshrc_ubuntu.symlink" "/$HOME/.zshrc"

    ## plugins

    if [ -d "/$HOME/.oh-my-zsh/custom/plugins/trujunzhang" ]; then
        rm -rf "/$HOME/.oh-my-zsh/custom/plugins/trujunzhang"
    fi

    cp -r "$HOME/.oh-my-zsh-macbook/oh-my-zsh/custom/plugins/trujunzhang"  "/$HOME/.oh-my-zsh/custom/plugins/trujunzhang"

    source .zshrc
}

function prepare_system {
    # Tools
    sudo apt install -y curl vim

    # python
    sudo apt install python-is-python3
    sudo apt install -y python3-pip

    # zip a folder in Ubuntu Linux using the cli
    sudo apt install -y zip unzip
}

# vpn
# wget https://git.io/vpnsetup -O vpnsetup.sh && sudo \
#         VPN_IPSEC_PSK='wh' \
#         VPN_USER='test' \
#         VPN_PASSWORD='test' \
#         sh vpnsetup.sh

function install_docker_apps {
    # All dockers    
    ##  Installing Docker
if ! command_exists docker; then
     sudo apt install -y docker.io
     sudo systemctl start docker
     sudo systemctl enable docker
fi

## Installing Docker-compose
# https://docs.docker.com/compose/install/
if ! command_exists docker-compose; then
     sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
     sudo chmod +x /usr/local/bin/docker-compose
     sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
fi
      
    ## docker-pure-ftpd & qbittorrent
    cd "$HOME/.oh-my-zsh-macbook/USERS/Docker/docker-transmission"
    docker-compose up -d
    cd "$HOME/.oh-my-zsh-macbook/USERS/Docker/docker-pure-ftpd"
    docker-compose up -d

    ## v2ray   
    #  mkdir -p /etc/v2ray
    #  cp -r "$HOME/.oh-my-zsh-macbook/USERS/Docker/v2ray/etc/config.json" /etc/v2ray/config.json
    #  docker run \
    #         --restart=always \
    #         -d --name v2ray \
    #         -v /etc/v2ray:/etc/v2ray \
    #         -p 8888:8888 \
    #         v2ray/official  v2ray \
    #         -config=/etc/v2ray/config.json

    ## v2ray(x_ui)
    ## https://github.com/vaxilu/x-ui/blob/main/install.sh
    ## port: 8765
    ## port: 31266
    #     config_account="djzhang"
    #     config_password="wanghao720"
    ## b831381d-6324-4d53-ad4f-8cda48b30811
    # ( exec "./bash/x_ui_install.sh" )

    ## factory
    ## https://github.com/yukilzw/factory
   git clone https://github.com/trujunzhang/factory /tmp/factory
   cd /tmp/factory
   docker build -t factory . 
   docker run \
          --restart=always \
          -p 1236:1236 \
          -d factory:latest
}

function install_youtube_download {
    # yt-dlp
    python3 -m pip install --upgrade yt-dlp

    ## usage   
    sudo apt install -y ffmpeg
    mkdir -p /home/deploy/data/youtube

    ## bash file

    ### youtube cli
    cp -r "$HOME/.oh-my-zsh-macbook/bash/yl.sh" /usr/bin/yl
    sudo chmod +x /usr/bin/yl

    cp -r "$HOME/.oh-my-zsh-macbook/bash/ydlcron.sh" /usr/bin/ydlcron
    sudo chmod +x /usr/bin/ydlcron
}

function install_cocoapods_tools {
    ### github offline for cocoapods
    cp -r "$HOME/.oh-my-zsh-macbook/USERS/cocoapods/generator_git_offline.sh" /usr/bin/generator_git_offline
    sudo chmod +x /usr/bin/generator_git_offline
}

install_zsh
prepare_system
install_docker_apps
install_youtube_download
install_cocoapods_tools

