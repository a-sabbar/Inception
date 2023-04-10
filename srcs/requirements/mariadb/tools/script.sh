#! /bin/bash

cd /etc/mysql/mariadb.conf.d && pwd

sed 's/127.0.0.1/0.0.0.0/g' 50-server.cnf > tt

cat tt > 50-server.cnf


cd /

service mysql start

touch input.sql

cat << send > input.sql
CREATE DATABASE wp_database;
CREATE USER 'newUser'@'%' IDENTIFIED BY 'hello+@+123';
GRANT ALL PRIVILEGES ON wp_database.* TO 'newUser'@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY 'Achraf';
FLUSH PRIVILEGES;
send


mysql < input.sql

systemctl stop mysql
systemctl disable mysql
systemctl status mysql
killall -9 mysqld
/usr/bin/mysqld_safe

#wp config create --dbname="Achraf" --dbuser="root" --dbpass="Achraf" --dbhost="my-maria" --path="/tmp" --allow-root
#wp config create --dbname=Achraf --dbuser=newUser --dbpass=hello+@+123 --dbhost=mariadb --allow-root
#wp core download --locale=nl_NL --allow-root --allow-root
#wp core install --url=localhost --title=asabbar --admin_user=asabbar --admin_password=Achraf2002 --admin_email=asabbar@1337.ma --allow-root