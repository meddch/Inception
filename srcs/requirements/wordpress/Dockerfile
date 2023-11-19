FROM alpine:3.17

RUN adduser -D -G 'www-data' www-data

 
RUN apk update && apk upgrade && apk add php81 php81-fpm php81-bcmath php81-bz2 php81-calendar php81-cli php81-ctype \
    php81-curl php81-dom php81-exif php81-fileinfo php81-gd php81-gmp \
    php81-iconv php81-imap php81-intl php81-json php81-mbstring \
    php81-mysqli php81-mysqlnd php81-openssl php81-pcntl php81-pdo php81-pdo_mysql \
    php81-pdo_pgsql php81-pdo_sqlite php81-pgsql php81-phar php81-posix php81-session \
    php81-shmop php81-simplexml php81-soap php81-sockets php81-sodium php81-sqlite3 \
    php81-sysvsem php81-sysvshm php81-tokenizer php81-xml php81-xmlreader php81-xmlwriter \
    php81-xsl php81-zip php81-zlib  mariadb-client curl --no-cache && \
    sed -i "s|listen = 127.0.0.1:9000|listen = 9000|g" \
      /etc/php81/php-fpm.d/www.conf && \
    sed -i "s|;listen.owner = nobody|listen.owner = nobody|g" \
      /etc/php81/php-fpm.d/www.conf && \
    sed -i "s|;listen.group = nobody|listen.group = nobody|g" \
      /etc/php81/php-fpm.d/www.conf && \
    rm -f /var/cache/apk/*
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && mv wp-cli.phar /usr/bin/wp

RUN chmod +x /usr/bin/wp

RUN mkdir -p /var/www 

COPY ./tools/wp-config-create.sh /wp-config.sh


RUN chmod +x /wp-config.sh 
    # sh /wp-config.sh

RUN mkdir -p /var/www/wordpress && \
	  cd /var/www/wordpress  && \
	  wp core download --allow-root

WORKDIR /var/www/wordpress






CMD ["/wp-config.sh"]
# CMD ["/usr/sbin/php-fpm81", "-F"]
