FROM alpine:3.16

RUN	apk update && apk upgrade && \
	apk add mariadb=10.6.10-r0 mysql-client=10.6.10-r0 gettext=0.21-r2 && \
	rm -f /etc/my.cnf.d/mariadb-server.cnf

COPY	conf/my.cnf /etc/my.cnf.d/

COPY	conf/cmd.sql /cmd.sql

COPY	conf/start_config.sh /start_config.sh

RUN		chown -R mysql:mysql /var/lib/mysql

EXPOSE 3306

CMD	["sh", "start_config.sh"]
