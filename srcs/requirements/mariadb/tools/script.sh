#!/bin/bash

service mariadb start

echo "CREATE DATABASE IF NOT EXISTS wordpress;" > db.sql
echo "CREATE USER IF NOT EXISTS 'admin'@'%' IDENTIFIED BY 'admin';" >> db.sql
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'admin'@'%';" >> db.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '1234';" >> db.sql
echo "FLUSH PRIVILEGES;" >> db.sql

mysql < db.sql