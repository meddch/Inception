FROM debian:buster



RUN apt-get update -y; \ 
    apt-get install nginx openssl -y; \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj="/C=MA/ST=none/O=./CN=sakllam.42.fr"

COPY ./conf/default /etc/nginx/sites-available/default

CMD ["daemon off;"]

ENTRYPOINT ["nginx", "-g"]
