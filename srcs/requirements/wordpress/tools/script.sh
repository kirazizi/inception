#!/bin/bash

mkdir -p /var/www/html/wordpress
mkdir -p /run/php/ 
chown -R www-data:www-data /run/php/

sleep 10

cd /var/www/html/wordpress

# if [ ! -f wp-config.php ]; then

wp core download --allow-root 

mv wp-config-sample.php wp-config.php

# change the database name in the line 23
sed -i "s/database_name_here/wordpress/1" wp-config.php

# change the database user in the line 26
sed -i "s/username_here/admin/1" wp-config.php

# change the database password in the line 29
sed -i "s/password_here/admin/1" wp-config.php

# change the database host in the line 32 (to connect to the mariadb container)
sed -i "s/localhost/mariadb/1" wp-config.php

wp core install \
    --url=localhost \
    --title=wordpress \
    --admin_user=admin \
    --admin_password=admin \
    --admin_email=admin@mail.com \
    --skip-email \
    --allow-root \

wp user create user user@mail.com \
    --role=author \
    --user_pass=user \
    --allow-root

# fi

sed -i 's/^listen = .*$/listen = 9000/' /etc/php/7.4/fpm/pool.d/www.conf

php-fpm7.4 -F