FROM docker:dind

RUN apk --update --no-cache add bash curl nmap

WORKDIR /main
COPY ./hello-world /main

# CMD ip route add 172.38.0.0/16 via 172.28.1.16 dev eth0 && /bin/bash -c "while true; do echo 'client hello'; sleep 30; done"
CMD /bin/bash -c "while true; do echo 'client hello'; sleep 30; done"