#!/bin/bash

docker_image_name="blog_trujunzhang"

# First of all, clone the docker respository
git clone https://github.com/trujunzhang/trujunzhang /tmp/trujunzhang

# Build the docker image
cd /tmp/trujunzhang
docker build -t $docker_image_name .

docker run -p 3000:3000 $docker_image_name --restart=always






