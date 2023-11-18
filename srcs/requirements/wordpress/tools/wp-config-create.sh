sleep 10

mkdir -p /run/php

if [ -f "/var/www/wordpress/wp-config.php" ]; then
	echo -e "wordpress is already installed and configured"
else
	echo -e "install: wordpress"
	cd /var/www/wordpress
	wp core download --allow-root
	wp config create --dbname=$DB_NAME \
		--dbuser=$DB_USER \
		--dbpass=$DB_USER_PASSWORD \
		--dbhost='mariadb' --path='/var/www/'
	wp core install --allow-root\
		--url=$URL \
		--title=$TITLE \
		--admin_user=$ADMIN_USER \
		--admin_password=$ADMIN_PASSWORD \
		--admin_email=$ADMIN_EMAIL
	wp user create --allow-root \
		$USER_NAME \
		$USER_EMAIL \
		--user_pass=$USER_PASSWORD \
		--role=$ROLE
	
fi
/usr/sbin/php-fpm81 -F