#!/usr/bin/env bash

# How to Configure Uncomplicated Firewall
#    sudo apt-get install -y ufw
#    echo "y" | sudo ufw enable
#    sudo ufw allow 22/tcp
#    sudo ufw allow 8765/tcp
#    sudo ufw allow 8888/tcp

# All dockers    
##  Installing Docker
     sudo apt install -y docker.io
     sudo systemctl start docker
     sudo systemctl enable docker

## Installing Docker-compose
   # https://docs.docker.com/compose/install/
     sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
     sudo chmod +x /usr/local/bin/docker-compose
     sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
  
## docker-ipsec-vpn-server
     cd "$HOME/.oh-my-zsh-macbook/USERS/Docker/docker-ipsec-vpn-server"
     docker-compose up -d  
