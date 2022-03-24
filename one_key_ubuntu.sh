##################################################################
#    Welcome to Ubuntu 18.04 LTS (GNU/Linux 4.15.0-20-generic x86_64)
#    git clone https://github.com/trujunzhang/.oh-my-zsh-macbook && cp /root/.oh-my-zsh-macbook/one_key_ubuntu.sh /usr/bin/one_key_ubuntu && chmod +x /usr/bin/one_key_ubuntu 
#    cd .oh-my-zsh-macbook && git pull && cp -u /root/.oh-my-zsh-macbook/one_key_ubuntu.sh /usr/bin/one_key_ubuntu && chmod +x /usr/bin/one_key_ubuntu
#    one_key_ubuntu
##################################################################

# CURRENT=`pwd`
CURRENT='/root/.oh-my-zsh-macbook'

# Oh My Zsh
sudo apt install -y zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#Theme: https://github.com/ohmyzsh/ohmyzsh/wiki/themes
rm /root/.zshrc
cp -r "$CURRENT/zshrc_ubuntu.symlink" /root/.zshrc

## plugins

if [ -d /root/.oh-my-zsh/custom/plugins/trujunzhang ]; then
    rm -rf /root/.oh-my-zsh/custom/plugins/trujunzhang
fi

cp -r "$CURRENT/oh-my-zsh/custom/plugins/trujunzhang"  /root/.oh-my-zsh/custom/plugins/trujunzhang 

# Tools
sudo apt install -y curl vim

# python
sudo apt install python-is-python3
sudo apt install -y python3-pip

# vpn
wget https://git.io/vpnsetup -O vpnsetup.sh && sudo \
        VPN_IPSEC_PSK='wh' \
        VPN_USER='test' \
        VPN_PASSWORD='test' \
        sh vpnsetup.sh

# zip a folder in Ubuntu Linux using the cli
      sudo apt install -y zip unzip

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
  
## docker-pure-ftpd & qbittorrent
     cd "$CURRENT/USERS/Docker/docker-transmission"
     docker-compose up -d
     cd "$CURRENT/USERS/Docker/docker-pure-ftpd"
     docker-compose up -d
     # cd "$CURRENT/USERS/Docker/qbittorrent"
     # docker-compose up -d
     # mkdir -p /home/deploy/data/config/qBittorrent
     # cp -r "$CURRENT/USERS/Docker/qbittorrent/qBittorrent.conf" /home/deploy/data/config/qBittorrent/qBittorrent.conf

## v2ray   
     # mkdir -p /etc/v2ray
     # cp -r "$CURRENT/USERS/Docker/v2ray/etc/config.json" /etc/v2ray/config.json
     # docker run \
     #        --restart=always \
     #        -d --name v2ray \
     #        -v /etc/v2ray:/etc/v2ray \
     #        -p 8888:8888\
     #        v2ray/official  v2ray \
     #        -config=/etc/v2ray/config.json

# yt-dlp
     python3 -m pip install --upgrade yt-dlp

## usage   
      sudo apt install -y ffmpeg
      mkdir -p /home/deploy/data/youtube

## bash file

      cp -r "$CURRENT/bash/yl.sh" /usr/bin/yl
      sudo chmod +x /usr/bin/yl

      cp -r "$CURRENT/bash/ydlcron.sh" /usr/bin/ydlcron
      sudo chmod +x /usr/bin/ydlcron




