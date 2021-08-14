# installation
#   https://toutyrater.github.io/app/docker-deploy-v2ray.html


docker run \
    --restart=always \
    -d --name v2ray \
    -v /etc/v2ray:/etc/v2ray \
    -p 8888:8888 \
    -p 6666:6666 \
    -p 443:443 \
    v2ray/official  v2ray \
    -config=/etc/v2ray/config.json




