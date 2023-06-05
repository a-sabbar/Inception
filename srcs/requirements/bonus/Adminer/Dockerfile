FROM  debian:buster


RUN apt-get update && apt-get install -y wget && apt-get install -y nginx && apt-get install php-fpm  php-mysql -y

RUN wget "https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php" -O /tmp/index.php

WORKDIR /tmp

CMD [ "php", "-S", "0.0.0.0:8080" , "index.php" ]