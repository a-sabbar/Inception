FROM  debian:buster


RUN apt-get update

RUN apt-get install php-fpm  php-mysql -y && apt-get install curl -y && apt-get install mariadb-server -y 


COPY ./tools/script.sh /

CMD ["bash","script.sh"]