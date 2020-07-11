### Scrapyd with pyenv

cd scrapyd && docker build -t politicl/scrapyd:v6 .

docker run \
    --restart=always \
    -t -d -i -p 6800:6800 \
    -v /var/docker_data/scrapyd:/var/lib/scrapyd \
    --name politicl-scrapyd  politicl/scrapyd:v6
            
# $ docker exec -it politicl-scrapyd bash


# docker run --restart=always -d --name gerapy -v ~/gerapy:/app/gerapy -p 8000:8000 germey/gerapy


