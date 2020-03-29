FROM alpine:latest

RUN apk update
RUN apk add mysql mysql-client
RUN apk add openrc
ADD wp.sql /
ADD pma.sql /
ADD users.sql /
ADD configure.sh /
ADD mariadb-server.cnf /etc/my.cnf.d
VOLUME ["/var/lib/mysql"]
EXPOSE 3306
ENTRYPOINT [ "sh", "configure.sh" ]