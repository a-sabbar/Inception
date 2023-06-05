FROM  debian:buster

RUN apt-get update && apt-get install -y nginx && apt-get install openssl -y


RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=MO/L=KH/O=1337/CN=127.0.0.1"

RUN rm -rf /etc/nginx/sites-available/* && rm -rf /etc/nginx/sites-enabled/*

COPY /conf/default /etc/nginx/sites-enabled


CMD ["nginx", "-g", "daemon off;"]