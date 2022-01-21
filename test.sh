#!/bin/bash
export NAME="kitty-$RANDOM"

docker-compose exec client docker build . -t hello-http 
docker-compose exec client docker run -d --network code-layer-network --name=$NAME hello-http 
# export CON_IP=$(docker-compose exec client ./get_ip.sh $NAME)
docker-compose exec client curl http://$NAME:3000