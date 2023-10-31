FROM debian:buster

RUN apt-get update;\
	apt-get install apache2 -y;\
	sed -i "s/80/81/" /etc/apache2/ports.conf;\
	service apache2 restart;

COPY /tools /var/www/html

ENTRYPOINT ["apachectl", "-D", "FOREGROUND"]
