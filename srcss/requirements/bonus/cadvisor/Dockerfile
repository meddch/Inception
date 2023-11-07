FROM debian:buster

RUN apt update -y; apt upgrade -y; apt install curl -y;\
    curl -L https://github.com/google/cadvisor/releases/download/v0.37.5/cadvisor -o /usr/bin/cadvisor;\
    chmod +x /usr/bin/cadvisor

ENTRYPOINT cadvisor -logtostderr --port=2000
