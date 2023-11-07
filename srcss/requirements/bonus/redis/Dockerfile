FROM debian:buster

RUN apt update -y && apt upgrade -y && apt install redis -y && sed -i 's/# bind 127.0.0.1/bind 0.0.0.0/g' /etc/redis/redis.conf

ENTRYPOINT redis-server --protected-mode no
