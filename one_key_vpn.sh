#!/usr/bin/env bash

command_exists () {
    type "$1" &> /dev/null ;
}

# How to Configure Uncomplicated Firewall
#    sudo apt-get install -y ufw
#    echo "y" | sudo ufw enable
#    sudo ufw allow 1:65535/tcp
#    sudo ufw allow 1:65535/udp

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
  
## docker-ipsec-vpn-server
     cd "$HOME/.oh-my-zsh-macbook/USERS/Docker/docker-ipsec-vpn-server"
     docker-compose up -d  

    ## v2ray   
     #  mkdir -p /etc/v2ray
     #  cp -r "$HOME/.oh-my-zsh-macbook/USERS/Docker/v2ray/etc/config.json" /etc/v2ray/config.json
     #  docker run \
     #         --restart=always \
     #         -d --name v2ray \
     #         -v /etc/v2ray:/etc/v2ray \
     #         -p 31743:31743 \
     #         v2ray/official  v2ray \
     #         -config=/etc/v2ray/config.json
