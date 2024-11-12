#!/bin/bash

mkdir -p /var/www/html/wordpress
mkdir -p /run/php/ 
chown -R www-data:www-data /run/php/

sleep 10

cd /var/www/html/wordpress

wp core download --allow-root 

mv wp-config-sample.php wp-config.php

# change the database name in the line 23
sed -i "s/database_name_here/$DB_NAME/1" wp-config.php

# change the database user in the line 26
sed -i "s/username_here/$DB_USER/1" wp-config.php

# change the database password in the line 29
sed -i "s/password_here/$DB_PSSWRD/1" wp-config.php

# change the database host in the line 32 (to connect to the mariadb container)
sed -i "s/localhost/mariadb/1" wp-config.php

wp core install \
    --url=$DOMAIN_NAME \
    --title=$WP_NAME \
    --admin_user=$WP_ADMIN \
    --admin_password=$WP_PSSWRD \
    --admin_email=$AD_EMAIL \
    --allow-root \

wp user create $WP_USR $WP_EMAIL \
    --role=author \
    --user_pass=$WP_PWD \
    --allow-root

sed -i "s/^listen = .*$/listen = 9000/" /etc/php/7.4/fpm/pool.d/www.conf

php-fpm7.4 -F