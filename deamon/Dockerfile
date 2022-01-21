FROM jrei/systemd-ubuntu

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get install -y virtualbox vagrant
RUN apt install net-tools iputils-ping
# using OpenWRT image, only 7MB in size
WORKDIR /app
# RUN vagrant init living42/openwrt-15.05-x86
# RUN vagrant box add living42/openwrt-15.05-x86
RUN vagrant init alvistack/ubuntu-21.04
RUN vagrant box add --provider virtualbox alvistack/ubuntu-21.04 
COPY ./deamon/Vagrantfile /app/
COPY ./deamon/start.sh /app/
CMD ./start.sh 