#!/bin/bash

export SWARM_TOKEN=$(docker-compose exec docker-vm-deamon vagrant ssh -c 'docker swarm join-token -q worker' | head -n 1)
echo $SWARM_TOKEN
