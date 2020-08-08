# Docker

## Build

change to root folder, and exec:

```
docker build -t gerapy -f docker/Dockerfile .
```


docker build -t gerapy:v6 -f docker/Dockerfile .


# docker run --restart=always -d --name gerapy -v ~/gerapy:/app/gerapy -p 8000:8000 gerapy:v6

