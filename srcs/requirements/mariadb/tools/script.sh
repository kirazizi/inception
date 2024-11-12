#!/bin/bash

service mariadb start

echo "CREATE DATABASE IF NOT EXISTS $DB_NAME;" > db.sql
echo "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PSSWRD';" >> db.sql
echo "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';" >> db.sql
echo "ALTER USER '$RT_USER'@'localhost' IDENTIFIED BY '$RT_PASSWRD';" >> db.sql
echo "FLUSH PRIVILEGES;" >> db.sql

mysql < db.sql