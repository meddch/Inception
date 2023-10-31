FROM debian:buster

RUN apt-get update -y;

RUN	apt-get install wget apache2 php libapache2-mod-php php-mysql -y;\
	cd /var/www/html;\
	rm -rf index.html;\
	wget "https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1-mysql-en.php" -O index.php;\
	sed -i 's/80/8080/g' /etc/apache2/ports.conf;\
	service apache2 restart;

ENTRYPOINT ["apachectl", "-D", "FOREGROUND"]