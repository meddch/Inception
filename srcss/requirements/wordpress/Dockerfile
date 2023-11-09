FROM debian:buster

RUN apt update && apt upgrade && apt install -y \
    php7.3 \
    php7.3-mysql \
    php7.3-fpm \
    curl

RUN curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar --output wp &&\
    chmod +x wp &&\
    mv wp /usr/local/bin/wp

COPY ./tools/config.sh ./config.sh

RUN chmod +x ./config.sh && mkdir -p /var/www/html &&\
    chown -R www-data:www-data /var/www/html && mkdir -p /run/php &&\
    chown -R www-data:www-data /run/php
    cat /var/www/html/wp-config.php 
EXPOSE 9000

ENTRYPOINT ["./config.sh"]