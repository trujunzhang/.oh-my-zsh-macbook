#!/bin/bash

# permissions 0644 for 'id_rsa.pub' are too open

if [ -f "$HOME/.ssh/id_rsa" ]; then
    chmod 400 "$HOME/.ssh/id_rsa"
fi

funtion install_ssl {
    # Install Certbot.
    sudo apt-get update
    sudo apt-get install certbot

    # Install Python Certbot-nginx.
    apt install python3-certbot-nginx

    # Run Certbot to generate the SSL certificate.
    # email: trujunzhang@gmail.com
    if [ ! -d "/etc/letsencrypt"]; then
        sudo certbot certonly --nginx -d trujunzhang.com
    fi

}


DOCKER_IMAGE="blog_trujunzhang"

install_ssl

# First of all, clone the docker respository
git clone https://github.com/trujunzhang/trujunzhang /tmp/trujunzhang
git clone git@bitbucket.org:trujunzhang/projects_envs.git /tmp/projects_envs
# git clone https://trujunzhang@bitbucket.org/trujunzhang/projects_envs.git /tmp/projects_envs

cp /tmp/projects_envs/github/trujunzhang/env.example /tmp/trujunzhang/.env.local

# Build the docker image
cd /tmp/trujunzhang
# docker image rm $(DOCKER_IMAGE) || (echo "Image $(DOCKER_IMAGE) didn't exist so not removed."; exit 0)
docker build -t $DOCKER_IMAGE .

# stop runnin container(s)
docker ps -q --filter "name=$DOCKER_IMAGE" | xargs -r docker stop
# remove existing container(s)
docker ps -aq --filter "name=$DOCKER_IMAGE" | xargs -r docker rm

docker-compose up -d

# docker run \
#             --restart=always \
#             -d --name $DOCKER_IMAGE \
#             -v /etc/v2ray:/etc/v2ray \
#             -p 80:3000\
#             $DOCKER_IMAGE


# Why the "none" image appears in Docker and how can we avoid it
docker rmi $(docker images -f "dangling=true" -q)




