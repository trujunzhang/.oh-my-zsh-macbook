##################################################################
#    Welcome to Ubuntu 18.04 LTS (GNU/Linux 4.15.0-20-generic x86_64)
##################################################################

# Oh My Zsh
    sudo apt install zsh
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

   #Theme: https://github.com/ohmyzsh/ohmyzsh/wiki/themes

# plugins
     cd /tmp && git clone https://github.com/trujunzhang/.oh-my-zsh-macbook
     # rm -rf /root/.oh-my-zsh/custom/plugins/trujunzhang 
     cp -r /tmp/.oh-my-zsh-macbook/oh-my-zsh/custom/plugins/trujunzhang  /root/.oh-my-zsh/custom/plugins/trujunzhang 

# zip a folder in Ubuntu Linux using the cli
      sudo apt install zip unzip
      # zip -r filename.zip folder

# All dockers    
##  Installing Docker
   # https://docs.docker.com/install/linux/docker-ce/ubuntu/
   # Tutorial: 
   #   https://phoenixnap.com/kb/how-to-install-docker-on-ubuntu-18-04
     sudo apt install docker.io
     sudo systemctl start docker
     sudo systemctl enable docker

## Installing Docker-compose
   # https://docs.docker.com/compose/install/
     sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose- (uname -s)- (uname -m)" -o /usr/local/bin/docker-compose
     sudo chmod +x /usr/local/bin/docker-compose
     sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
  
## docker-pure-ftpd & qbittorrent
     cd .oh-my-zsh-macbook/USERS/Docker && ./reinstallVPSDockers.sh

## v2ray   
     cp .oh-my-zsh-macbook/USERS/Docker/v2ray/etc/config.json /etc/v2ray/config.json
     cd .oh-my-zsh-macbook/USERS/Docker && ./v2ray.sh
   
# youtube_dl
   # https://github.com/ytdl-org/youtube-dl
   # https://ostechnix.com/youtube-dl-tutorial-with-examples-for-beginners/

## install   
     sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
     sudo chmod a+rx /usr/local/bin/youtube-dl

## usage   
      sudo apt install ffmpeg

