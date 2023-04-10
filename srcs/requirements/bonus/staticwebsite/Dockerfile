FROM  debian:buster


RUN apt-get update

RUN apt-get install nginx -y

RUN mkdir -p myweb

COPY ./tools/ToDoList /myweb

COPY /conf/default /etc/nginx/sites-enabled

CMD ["nginx", "-g", "daemon off;"]