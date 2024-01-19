FROM debian:stable

RUN apt-get -y update

RUN apt-get install -y mariadb-server

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY ./tools/s.sh /etc/mysql/

CMD ["sh", "/etc/mysql/s.sh"]

