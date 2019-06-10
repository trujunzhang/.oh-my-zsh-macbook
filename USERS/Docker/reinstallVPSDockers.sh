# https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-compose-on-ubuntu-14-04
# Step 1 — Installing Docker
wget -qO- https://get.docker.com/ | sh
sudo usermod -aG docker $(whoami)

# https://docs.docker.com/compose/install/
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose


#!/usr/bin/env bash

# Important:
#    First, load the IPsec af_key kernel module on the Docker host. This step is optional for Ubuntu and Debian.
sudo modprobe af_key

# Step1: Remove docker ps.
docker rm -f $(docker ps -a -q)

# Step2: Remove docker images.
docker rmi $(docker images -q)

# Step3: Install docker images.
docker pull hwdsl2/ipsec-vpn-server

# Step4: Install vpn docker.
docker run -d --name ipsec-vpn-server --env-file /root/.vpn_env --restart always -p 500:500/udp -p 4500:4500/udp -v /lib/modules:/lib/modules:ro  --privileged hwdsl2/ipsec-vpn-server

cd /root/.oh-my-zsh-macbook
cd USERS/Docker/docker-pure-ftpd

docker-compose up -d

cd /root/.oh-my-zsh-macbook
# cd USERS/Docker/docker-rutorrent
cd USERS/Docker/qbittorrent

docker-compose up -d
