# installation
#   https://toutyrater.github.io/app/docker-deploy-v2ray.html


docker run \
    --restart=always \
    -d --name v2ray \
    -v /etc/v2ray:/etc/v2ray \
    -p 1111:1111\
    -p 1112:1112\
    -p 1113:1113\
    -p 1114:1114\
    -p 1115:1115\
    -p 1116:1116\
    -p 1117:1117\
    v2ray/official  v2ray \
    -config=/etc/v2ray/config.json




