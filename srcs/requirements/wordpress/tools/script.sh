#!/bin/bash

mkdir -p /var/www/html/wordpress
mkdir -p /run/php/ && chown -R www-data:www-data /run/php/

cd /var/www/html/wordpress

if [ ! -f wp-config.php ]; then

wp core download --allow-root

wp config create --dbname=wordpress --dbuser=admin --dbpass=admin --dbhost=mariadb --allow-root
wp core install --url=localhost --title=wordpress --admin_user=admin --admin_password=admin --admin_email=admin@mail.com --skip-email --allow-root
wp user create user user@mail.com --role=author --user_pass=user --allow-root

fi

sed -i 's/^listen = .*$/listen = 9000/' /etc/php/7.4/fpm/pool.d/www.conf

php-fpm7.4 -F