##################################################################
#    Welcome to Ubuntu 18.04 LTS (GNU/Linux 4.15.0-20-generic x86_64)
#    git clone https://github.com/trujunzhang/.oh-my-zsh-macbook
#    chmod +x one_key_ubuntu.sh
##################################################################

# Import function files.
source ./bash/files-functions.sh

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
    fileLink ".zsh(rc)"   "zshrc_ubuntu.symlink"  "/root/.zshrc"

# plugins
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
     sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose- (uname -s)- (uname -m)" -o /usr/local/bin/docker-compose
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
     cd /root/.oh-my-zsh-macbook
     cp USERS/Docker/v2ray/etc/config.json /etc/v2ray/config.json
     docker run \
            --restart=always \
            -d --name v2ray \
            -v /etc/v2ray:/etc/v2ray \
            -p 1901:1901\
            -p 1902:1902\
            -p 1903:1903\
            -p 1904:1904\
            -p 1905:1905\
            -p 1906:1906\
            -p 1907:1907\
            -p 1908:1908\
            -p 1909:1909\
            -p 1910:1910\
            -p 1911:1911\
            -p 1912:1912\
            -p 1913:1913\
            -p 1914:1914\
            -p 1915:1915\
            -p 1916:1916\
            -p 1917:1917\
            -p 1918:1918\
            -p 1919:1919\
            -p 1920:1920\
            -p 1921:1921\
            -p 1922:1922\
            -p 1923:1923\
            -p 1924:1924\
            -p 1925:1925\
            -p 1926:1926\
            -p 1927:1927\
            -p 1928:1928\
            -p 1929:1929\
            -p 1930:1930\
            -p 1931:1931\
            v2ray/official  v2ray \
            -config=/etc/v2ray/config.json

# youtube_dl
     sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
     sudo chmod a+rx /usr/local/bin/youtube-dl

## usage   
      sudo apt install -y ffmpeg
      mkdir /home/deploy/data/youtube

