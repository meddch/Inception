FROM debian:buster

COPY /tools/wp.sh /

RUN chmod +x /wp.sh

ENTRYPOINT ["/bin/sh", "/wp.sh"]

