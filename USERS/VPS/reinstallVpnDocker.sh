
#!/usr/bin/env bash

# Step1: Remove docker ps.
docker rm -f $(docker ps -a -q)

# Step2: Remove docker images.
docker rmi $(docker images -q)

# Step3: Install docker images.
docker pull hwdsl2/ipsec-vpn-server

# Step4: Install vpn docker.
docker run \
    --name ipsec-vpn-server \
    --env-file /root/.vpn_env \
    --restart=always \
    -p 500:500/udp \
    -p 4500:4500/udp \
    -v /lib/modules:/lib/modules:ro \
    -d --privileged \
    hwdsl2/ipsec-vpn-server
    
