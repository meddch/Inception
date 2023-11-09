#!/bin/sh
sleep 10

sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf

wp core download --path=/var/www/ --allow-root

cat /var/www/wp-config-sample.php >  /var/www/wp-config.php

wp config set DB_NAME $DB_DATABASE --path=/var/www/ --allow-root
wp config set DB_USER $DB_USER --path=/var/www/ --allow-root
wp config set DB_PASSWORD $DB_PASSWORD --path=/var/www/ --allow-root
wp config set DB_HOST $DB_HOST --path=/var/www/ --allow-root

wp core install --path=/var/www/ --url=$URL --title=$TITLE --admin_user=$ADMIN_PASSWORD --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL --allow-root

wp user create --path=/var/www/ $ADMIN_USER $ADMIN_EMAIL --user_pass=$ADMIN_PASSWORD --allow-root

exec php-fpm7.3 -F