#!bin/bash
cd /var/www/wordpress
wp core config	--dbhost=$DB_HOST \
				--dbname=$DB_NAME \
				--dbuser=$DB_USER \
				--dbpass=$DB_PASSWORD \
				--allow-root

wp core install --title=$ $TITLE\
				--admin_user=$ADMIN_USER \
				--admin_password=$ADMIN_PASSWORD \
				--admin_email=$ADMIN_MAIL \
				--url=$URL \
				--allow-root

wp user create $USER $USER_MAIL --role=author --user_pass=$USER_PASSWORD --allow-root
cd -

php-fpm7.3 -F
