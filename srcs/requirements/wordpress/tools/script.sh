#! /bin/bash



curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

wp core download --locale=nl_NL  --path="/tmp" --allow-root

wp config create --dbname=wp_database --dbuser=newUser --dbpass=hello+@+123 --path="/tmp" --dbhost=mariadb --allow-root

sed -i 's/\/run\/php\/php7.3-fpm.sock/ wordpress:9000/g' "/etc/php/7.3/fpm/pool.d/www.conf"

wp core install --url=localhost --title=asabbar --admin_user=asabbar --admin_password=Achraf2002 --admin_email=asabbar@1337.ma --path="/tmp" --skip-email --allow-root

wp user create achraf achraf@gmail.com --role=author --user_pass=asabbar --path="/tmp" --allow-root

wp theme install twentytwentyone --activate --path="/tmp" --allow-root

wp config set WP_CACHE_KEY_SALT 'localhost'  --path="/tmp" --allow-root
wp config set WP_REDIS_HOST 'redis'  --path="/tmp" --allow-root
wp config set WP_REDIS_PORT '6379'  --path="/tmp" --allow-root
wp config set WP_REDIS_SCHEME 'tcp'  --path="/tmp" --allow-root
wp config set WP_REDIS_TIMEOUT 60 --path="/tmp" --allow-root
wp config set WP_CACHE true --path="/tmp" --allow-root

wp plugin install redis-cache --activate --path="/tmp" --allow-root

wp redis enable --path="/tmp" --allow-root

mkdir -p /run/php

/usr/sbin/php-fpm7.3 -F
