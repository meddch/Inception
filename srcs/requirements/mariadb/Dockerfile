FROM debian:buster

COPY conf/conf.db /temp/conf.db


RUN apt-get update -y;\
	apt-get install mariadb-server -y;\
	service mysql start;\
	chown -R mechane:mechane /var/lib/mysql;\
	sed -i "s/#port/3306/" /etc/mysql/mariadb.conf.d/50-server.cnf;\
	sed -i "s/127.0.0.1/0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf;\
	mysql -u root < /temp/conf.db;

ENTRYPOINT ["mysqld_safe"]
