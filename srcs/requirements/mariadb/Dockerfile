FROM debian:bullseye

RUN apt update -y && apt upgrade -y && apt install -y mariadb-server curl

RUN sed -i 's/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf

RUN mkdir -p /var/run/mysqld

RUN chown -R mysql:mysql /var/run/mysqld

COPY ./tools/script.sh /

RUN bash /script.sh

CMD ["mysqld"]
