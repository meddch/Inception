FROM alpine:3.18.4

ARG DB_NAME \
    DB_USER \
    DB_USER_PASSWORD \
    DB_ROOT_PASSWORD \
    DB_HOST \
    ROLE \
    URL \
    ADMIN_USER \
    ADMIN_PASSWORD \
    ADMIN_EMAIL \
    TITLE \
    USER_NAME \
    USER_PASSWORD \
    USER_EMAIL
 
RUN apk update && apk upgrade && apk add --no-cache \
    php81 \
    php81-fpm \
    php81-mysqli \
    php81-json \
    php81-curl \
    php81-dom \
    php81-exif \
    php81-fileinfo \
    php81-mbstring \
    php81-openssl \
    php81-phar \
    php81-xml \
    php81-zip \
    php81-redis \
    mysql-client \
    wget \
    unzip && \
    sed -i "s|listen = 127.0.0.1:9000|listen = 9000|g" \
      /etc/php81/php-fpm.d/www.conf && \
    sed -i "s|;listen.owner = nobody|listen.owner = nobody|g" \
      /etc/php81/php-fpm.d/www.conf && \
    sed -i "s|;listen.group = nobody|listen.group = nobody|g" \
      /etc/php81/php-fpm.d/www.conf && \
    rm -f /var/cache/apk/*
WORKDIR /var/www
RUN wget https://wordpress.org/latest.zip && \
    unzip latest.zip && \
    cp -rf wordpress/* . && \
    rm -rf wordpress latest.zip
COPY ./requirements/wordpress/conf/wp-config-create.sh .
RUN sh wp-config-create.sh && rm wp-config-create.sh && \
    chmod -R 0777 wp-content/

EXPOSE 9000

CMD ["/usr/sbin/php-fpm81", "-F"]
