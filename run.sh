#!/bin/bash
# docker swarm init
# docker run --privileged -p 4375:2375  --device /dev/vboxdrv:/dev/vboxdrv -v /sys/fs/cgroup:/sys/fs/cgroup:ro -v /tmp:/tmp --name=docker-host  -it vagrant-docker
# docker network create --driver=overlay --attachable vm-network
# SWARM_TOKEN=$(docker swarm join-token -q worker) docker-compose up
# docker network create --driver=bridge --attachable --subnet=172.21.0.0/16 test2-net || true
# export NETWORK_DEVICE="br-$(docker network list | grep test2-net | awk -F ' ' '{ print $1 }')"

docker swarm leave --force || true 
docker-compose up -d
cd ./deamon && vagrant up || true

# export SWARM_IP=172.21.1.18
export SWARM_IP=192.168.56.201

echo "Waiting for swarm manager to get up, can take a while"

checkStatusCode() {
    local  response=$(curl -s -w "%{http_code}" http://$SWARM_IP:2375)
    local http_code=${response:(-3)}
    echo "$http_code"
}

until [ $(checkStatusCode) -eq 404 ]
do
    printf "."
    sleep 20
done
sleep 10

echo "Swarm manager is up, connecting"

export SWARM_TOKEN=$(DOCKER_HOST=tcp://$SWARM_IP:2375 docker swarm join-token -q worker)
echo $SWARM_TOKEN

docker swarm join --token $SWARM_TOKEN $SWARM_IP:2377 --advertise-addr 192.168.56.1 

echo "Connected succesfully"

echo "Create docker overlay network on swarm manager"

# DOCKER_HOST=tcp://$SWARM_IP:2375 docker network create --driver=bridge --attachable code-layer-network --subnet 10.200.0.0/16
DOCKER_HOST=tcp://$SWARM_IP:2375 docker network create --driver=overlay --attachable code-layer-network --subnet 10.200.0.0/16 || true

echo "Connect client container to overlay network"
export CLIENT_ID=$(docker ps -a | grep client | awk -F ' ' '{ print $1 }')
docker network connect code-layer-network $CLIENT_ID