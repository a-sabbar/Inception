#! /bin/bash

cd /etc/mysql/mariadb.conf.d

sed 's/127.0.0.1/0.0.0.0/g' 50-server.cnf > tt

cat tt > 50-server.cnf

rm tt

service mysql start

touch input.sql
cat << send > input.sql
CREATE DATABASE $DB_NAME;
CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';
GRANT ALL PRIVILEGES ON wp_database.* TO '$DB_USER'@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY '$ROOT_PASSWORD';
send

mysql < input.sql

kill $(cat /var/run/mysqld/mysqld.pid)

/usr/bin/mysqld_safe