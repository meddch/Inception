FROM debian:buster

COPY conf/conf.db /temp/conf.db

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

RUN apt-get update -y;\
	apt-get install mariadb-server -y;\
	service mysql start;\
	chown -R mechane:mechane /var/lib/mysql;\
	mysql -u root < /temp/conf.db;
ENTRYPOINT ["mysqld_safe"]
