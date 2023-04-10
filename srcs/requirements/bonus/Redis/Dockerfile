FROM  debian:buster

RUN apt-get update && \
    apt-get install -y redis-server

COPY ./redis.conf /etc/redis/redis.conf

CMD ["/usr/bin/redis-server", "/etc/redis/redis.conf"]