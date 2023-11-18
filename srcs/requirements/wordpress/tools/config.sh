sleep 10
mkdir -p /run/php

sed -i'' 's|^listen = /run/php/php7.4-fpm.sock|listen = wordpress:9000|' /etc/php/7.4/fpm/pool.d/www.conf
sed -i'' 's/;clear_env = no/clear_env = no/' /etc/php/7.4/fpm/pool.d/www.conf

if [ -f "/var/www/wordpress/wp-config.php" ]; then
	echo -e "wordpress is already installed and configured"
else
	echo -e "install: wordpress"
	cd /var/www/wordpress
	wp core download --allow-root
	wp config create --allow-root\
		--dbname=$DB_NAME \
		--dbuser=$DB_USER \
		--dbpass=$DB_USER_PASSWORD \
		--dbhost=$DB_HOST --path='/var/www/wordpress'
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
/usr/sbin/php-fpm7.4 -F