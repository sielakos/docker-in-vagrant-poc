FROM docker:dind

RUN apk --update --no-cache add bash curl nmap

WORKDIR /main
COPY ./hello-world /main

# CMD ip route add 172.38.0.0/16 via 172.21.1.18 dev eth0 && /bin/bash -c "while true; do echo 'client hello'; sleep 30; done"
# CMD ip route add 10.200.0.0/16 via 172.21.1.18 && /bin/bash -c "while true; do echo 'client hello'; sleep 30; done"
CMD /bin/bash -c "while true; do echo 'client hello'; sleep 30; done"