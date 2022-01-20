#!/bin/bash
# docker swarm init
# docker run --privileged -p 4375:2375  --device /dev/vboxdrv:/dev/vboxdrv -v /sys/fs/cgroup:/sys/fs/cgroup:ro -v /tmp:/tmp --name=docker-host  -it vagrant-docker
# docker network create --driver=overlay --attachable vm-network
# SWARM_TOKEN=$(docker swarm join-token -q worker) docker-compose up
# docker network create --driver=bridge --attachable --subnet=172.38.0.0/16 test2-net || true
# export NETWORK_DEVICE="br-$(docker network list | grep test2-net | awk -F ' ' '{ print $1 }')"

docker-compose up
# vagrant up