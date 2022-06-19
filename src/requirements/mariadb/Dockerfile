FROM alpine:latest

RUN apk update && apk add mariadb mariadb-client

RUN apk add openrc bash

COPY --chown=mysql:mysql conf/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf

COPY --chown=mysql:mysql conf/my.cnf /etc/my.cnf

COPY  --chown=mysql:mysql tools/entry_point.sh /entry_point.sh

COPY --chown=mysql:mysql conf/init.sql /init.sql


RUN  chmod +x /entry_point.sh

RUN mkdir /run/openrc && touch /run/openrc/softlevel

RUN rc-service mariadb setup

RUN cp /usr/bin/mysqld_safe /etc/init.d/mysqld_safe

# RUN  chown -R mysql:mysql /var/lib/mysql

EXPOSE 3306

STOPSIGNAL SIGINT

ENTRYPOINT [ "/bin/bash", "entry_point.sh" ]

# ENTRYPOINT [ "mysqld_safe --user=mysql --datadir=/var/lib/mysql --init-file=/etc/my.cnf.d/mariadb-server.cnf < /init.sql" ]
