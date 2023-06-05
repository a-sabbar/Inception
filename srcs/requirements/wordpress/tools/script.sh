#! /bin/bash

if [ -f /tmp/wp-config.php ]
then
    rm -rf /tmp/wp*
fi


curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

wp core download --locale=nl_NL  --path="/tmp" --allow-root


wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS --path="/tmp" --dbhost=$DB_HOST --allow-root

sed -i 's/\/run\/php\/php7.3-fpm.sock/ wordpress:9000/g' "/etc/php/7.3/fpm/pool.d/www.conf"

wp core install --url=$WP_URL --title=$WP_TITLE --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --path="/tmp" --skip-email --allow-root

wp user create $WP_USER $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PASSWORD --path="/tmp" --allow-root

wp theme install astra --activate --path="/tmp" --allow-root


#redis cache bonus part
wp plugin install redis-cache --activate --path="/tmp" --allow-root


wp config set WP_REDIS_HOST 'redis'  --path="/tmp" --allow-root
wp config set WP_REDIS_PORT '6379'  --path="/tmp" --allow-root
wp config set WP_REDIS_DATABASE '0' --path="/tmp" --allow-root
wp redis  enable --path="/tmp" --allow-root

chown -R www-data:www-data /tmp
chmod -R 755 /tmp

mkdir -p /run/php

/usr/sbin/php-fpm7.3 -F
