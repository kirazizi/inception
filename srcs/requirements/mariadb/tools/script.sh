#!/bin/bash

service mariadb start

sleep 5

echo "CREATE DATABASE IF NOT EXISTS wordpress;" > db.sql
echo "CREATE USER IF NOT EXISTS 'admin'@'%' IDENTIFIED BY 'admin';" >> db.sql
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'admin'@'%';" >> db.sql
echo "FLUSH PRIVILEGES;" >> db.sql

mysql < db.sql

service mariadb stop

mysqld