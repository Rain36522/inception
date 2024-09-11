FROM debian:buster

RUN apt-get update -y 
RUN apt upgrade -y

RUN apt-get install -y nginx

RUN mkdir -p /etc/nginx/ssl
RUN apt install -y openssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=CH/ST=VD/L=Lausanne/O=42/OU=42/CN=pudry.42.ch/emailAddress=pudry@student.42lausanne.ch"

RUN mkdir -p /var/run/nginx
RUN mkdir -p /var/www/wordpress

RUN chmod -R 755 /var/www/wordpress

RUN chown -R www-data:www-data /var/www/wordpress

COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY tool/start_ngx.sh /usr/local/start_ngx.sh
RUN chmod +x /usr/local/start_ngx.sh

# Exposition du port 443 qui est le port requis pour le protocole SSL (https)
EXPOSE 443

ENTRYPOINT ["sh", "/usr/local/start_ngx.sh"]