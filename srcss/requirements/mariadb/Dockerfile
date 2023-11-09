FROM debian:bullseye

COPY ./conf/db.sql /tmp/db.sql

RUN apt update -y;\
    apt install mariadb-server -y; service mysql start;\
    chown -R mysql:mysql /var/lib/mysql;\
    sed -i "s/#port/port/" /etc/mysql/mariadb.conf.d/50-server.cnf;\
    chmod 777 /var/run/mysqld;\
    sed -i "s/127.0.0.1/0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf;\
    mysql -e CREATE DATABASE my_database;
    mysql -e  CREATE USER 'mechane'@'localhost' IDENTIFIED BY '123';
    mysql -e GRANT ALL PRIVILEGES ON my_database.* TO 'mechane'@'%';
    mysql -e FLUSH PRIVILEGES;

ENTRYPOINT [ "mysqld_safe" ]
