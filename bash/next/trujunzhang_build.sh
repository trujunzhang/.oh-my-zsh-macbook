#!/bin/bash

# permissions 0644 for 'id_rsa.pub' are too open

if [ -f "$HOME/.ssh/id_rsa" ]; then
    chmod 400 "$HOME/.ssh/id_rsa"
fi


docker_image_name="blog_trujunzhang"

# First of all, clone the docker respository
git clone https://github.com/trujunzhang/trujunzhang /tmp/trujunzhang
git clone git@bitbucket.org:trujunzhang/projects_envs.git /tmp/projects_envs
# git clone https://trujunzhang@bitbucket.org/trujunzhang/projects_envs.git /tmp/projects_envs

cp /tmp/projects_envs/github/trujunzhang/env.example /tmp/trujunzhang/.env.local

# Build the docker image
cd /tmp/trujunzhang
docker build -t $docker_image_name .

# stop runnin container(s)
docker ps -q --filter "name=$docker_image_name" | xargs -r docker stop
# remove existing container(s)
docker ps -aq --filter "name=$docker_image_name" | xargs -r docker rm

docker run \
            --restart=always \
            -d --name $docker_image_name \
            -v /etc/v2ray:/etc/v2ray \
            -p 80:3000\
            $docker_image_name







