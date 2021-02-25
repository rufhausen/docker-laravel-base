#!/bin/bash

#https://medium.com/@juan_cortes/local-domains-through-nginx-proxy-and-docker-13d97ee8c010

docker network inspect nginx-proxy >/dev/null 2>&1 || \
    docker network create --driver bridge nginx-proxy

if [ ! "$(docker ps -q -f name=nginx-proxy)" ]; then
    if [ "$(docker ps -aq -f status=exited -f name=nginx-proxy)" ]; then
        # cleanup
        docker rm nginx-proxy
    fi
    # run your container
    docker run -d --name=nginx-proxy -p 80:80 --restart unless-stopped --net nginx-proxy -v /var/run/docker.sock:/tmp/docker.sock jwilder/nginx-proxy
fi