FROM debian:buster

RUN apt-get update -y;\
	apt-get install nginx openssl -y

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/mechane.key -out /etc/ssl/mechane.crt \
	-subj "/C=MA/ST=Khouribga/L=Khouribga/O=42 School/OU=mechane/CN=mechane.42.fr"

COPY conf/nginx.conf /etc/nginx/

CMD [ "nginx", "-g", "daemon off;" ]