#!/bin/bash
# export DOCKER_HOST=tcp://$(netstat -rn | grep "^0.0.0.0 " | cut -d " " -f10):4375 
docker run --network vm-network hello-world-http -d