FROM debian:buster

RUN apt update -y && apt upgrade -y

RUN apt-get install -y wget

RUN apt-get -y install php7.3 php-fpm php-mysql mariadb-client

RUN	mkdir -p /var/www/wordpress
RUN mkdir -p /run/php

# Assignation des droits a l'utilisateur www-data
RUN chown -R www-data:www-data /var/www


RUN chmod -R 755 /var/www

COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY tool/start_wdp.sh /usr/local/start_wdp.sh
RUN chmod +x /usr/local/start_wdp.sh

# Exposition du port 9000
EXPOSE 9000

ENTRYPOINT ["sh", "/usr/local/start_wdp.sh"]