##################################################################
#    Welcome to Ubuntu 18.04 LTS (GNU/Linux 4.15.0-20-generic x86_64)
#    git clone https://github.com/trujunzhang/.oh-my-zsh-macbook
#    chmod +x one_key_ubuntu.sh
#    ./one_key_ubuntu.sh
##################################################################

# Import function files.
source ./bash/files-functions.sh

# Tools
sudo apt install -y curl

# python
   sudo apt install python-is-python3

# vpn
wget https://git.io/vpnsetup -O vpnsetup.sh && sudo \
        VPN_IPSEC_PSK='wh' \
        VPN_USER='test' \
        VPN_PASSWORD='test' \
        sh vpnsetup.sh

# Oh My Zsh
    sudo apt install -y zsh
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

   #Theme: https://github.com/ohmyzsh/ohmyzsh/wiki/themes
    rm /root/.zshrc
    cp zshrc_ubuntu.symlink  /root/.zshrc

## plugins
     cp -r oh-my-zsh/custom/plugins/trujunzhang  /root/.oh-my-zsh/custom/plugins/trujunzhang 

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
     cd /root/.oh-my-zsh-macbook
     cd USERS/Docker/docker-pure-ftpd
     docker-compose up -d
     cd /root/.oh-my-zsh-macbook
     cd USERS/Docker/qbittorrent
     docker-compose up -d

## v2ray   
     mkdir /etc/v2ray
     cd /root/.oh-my-zsh-macbook
     cp USERS/Docker/v2ray/etc/config.json /etc/v2ray/config.json
     # docker run \
     #        --restart=always \
     #        -d --name v2ray \
     #        -v /etc/v2ray:/etc/v2ray \
     #        -p 8888:8888\
     #        v2ray/official  v2ray \
     #        -config=/etc/v2ray/config.json

# youtube_dl
     sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
     sudo chmod a+rx /usr/local/bin/youtube-dl

## usage   
      sudo apt install -y ffmpeg
      mkdir /home/deploy/data/youtube

