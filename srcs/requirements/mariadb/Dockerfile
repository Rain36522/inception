FROM debian:buster

RUN apt update -y && apt upgrade -y
RUN apt-get install -y mariadb-server procps

RUN mkdir -p /run/mysqld /var/lib/mysql

COPY conf/server.cnf /etc/mysql/mariadb.conf.d/server.cnf
COPY tools/start_mdb.sh /usr/local/start_mdb.sh
RUN chmod +x /usr/local/start_mdb.sh

#Port de connexion
EXPOSE 3306

ENTRYPOINT [ "sh", "/usr/local/start_mdb.sh" ]