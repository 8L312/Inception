#!/bin/sh
sleep 5
if [ ! -f /var/www/wordpress/wp-config.php ] ; then
{
	wp config create	--allow-root \
						--dbname=$DB_NAME \
						--dbuser=$DB_USER \
						--dbpass=$DB_PASS \
						--dbhost=$DB_HOST \
						--path='/var/www/wordpress' >> log.txt

	wp core install		--url=$DOMAIN_NAME \
						--title=$SITE_TITLE \
						--admin_user=$DB_USER \
						--admin_password=$DB_PASS \
						--admin_email=$ADMIN_EMAIL \
						--allow-root --path='/var/www/wordpress' >> log.txt

	wp user create		--allow-root --role=author \
						$USER2_LOGIN $USER2_MAIL --user_pass=$USER2_PASS \
						--path='/var/www/wordpress' >> /log.txt
	
	wp plugin update --all --path='/var/www/wordpress' >> log.txt

	wp theme install oceanwp --activate --path='/var/www/wordpress' >> log.txt

	if [ ! -d /run/php ] ; then
		mkdir /run/php
	fi
}
fi

/usr/sbin/php-fpm8 -F
