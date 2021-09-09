# installation
#   https://toutyrater.github.io/app/docker-deploy-v2ray.html


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




