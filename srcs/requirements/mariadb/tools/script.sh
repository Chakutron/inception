#!/bin/sh
service mysql start 

echo "CREATE USER '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD';" | mysql

echo "GRANT ALL PRIVILEGES ON *.* TO '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD';" | mysql
echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$SQL_ROOT_PASSWORD';" | mysql
echo "FLUSH PRIVILEGES;" | mysql

echo "CREATE DATABASE $SQL_DATABASE;" | mysql

kill $(cat /var/run/mysqld/mysqld.pid)

mysqld
