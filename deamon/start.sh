#!/bin/bash

# sudo modprobe dummy
# sudo ip link add dm100 type dummy
# sudo ifconfig eth0 hw ether C8:D7:4A:4E:47:50
# sudo ip addr add 172.38.1.100/16 brd + dev eth0 label eth0:0
vagrant up
while true; do echo "Docker host is alive"; sleep 30; done