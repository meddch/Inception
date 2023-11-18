#!/bin/sh
sleep 5

mkdir -p /run/php

if [ -f "/var/www/wordpress/wp-config.php" ]; then
	echo -e "wordpress configured"
else
	echo -e "config: wordpress"
	wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_USER_PASSWORD --dbhost=mariadb --dbprefix=wp_ --allow-root --path='/var/www/wordpress'
	# wp config set WP_REDIS_HOST redis
	# wp config set WP_REDIS_PORT 6379
	# wp config set WP_REDIS_TIMEOUT 1
	# wp config set WP_REDIS_READ_TIMEOUT 1
	# wp config set WP_REDIS_DATABASE 0
	wp core install --allow-root --url=$URL --title=$TITLE --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL  --path='/var/www/wordpress'
	wp user create --allow-root \
		$USER_NAME \
		$USER_EMAIL \
		--user_pass=$USER_PASSWORD \
		--role=$ROLE  --path='/var/www/wordpress'
	chmod -R 0777 wp-content/
	
fi
/usr/sbin/php-fpm81 -F