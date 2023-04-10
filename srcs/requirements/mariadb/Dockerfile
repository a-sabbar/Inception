FROM  debian:buster


RUN apt-get update && apt-get install mariadb-server -y && apt-get install systemd -y


COPY ./tools/script.sh /

CMD ["bash", "script.sh"]