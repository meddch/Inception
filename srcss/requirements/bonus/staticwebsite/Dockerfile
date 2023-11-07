FROM debian:buster

RUN apt update -y; apt upgrade -y; apt install apache2 -y;\
     sed -i  's/80/81/g' /etc/apache2/ports.conf;

COPY ./site ./var/www/html

CMD ["apachectl", "-D", "FOREGROUND"]