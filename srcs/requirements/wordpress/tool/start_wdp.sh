echo "------------------------------- WORDPRESS START -----------------------------------"

php-fpm7.3 -v

while ! mariadb -u pudry --password=A1b2c3d4 -h mariadb -P 3306 --silent; do
        sleep 1
        echo "Wait for MariaDb... user : root, pwd : " $MARIADB_ROOT_PASSWORD
done

echo "------------------\n"
mariadb -u pudry --password=$MARIADB_ROOT_PASSWORD -h mariadb -P 3306 -e "SHOW DATABASES;"
echo "------------------\n"


if [ -e /var/www/wordpress/wp-config.php ]
then echo "wp-config existe."
else

        wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
        chmod +x wp-cli.phar
        mv wp-cli.phar /usr/local/bin/wp

        cd /var/www/wordpress
        wp core download --allow-root

        wp config create --dbname=$MARIADB_DB_NAME --dbuser=$MARIADB_USER --dbpass=$MARIADB_PASS --dbhost=$WP_HOST --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root
        wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
        wp user create $WP_USER $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PASS --allow-root
        echo "create " $WP_USER " " $WP_USER_PASS
        echo "create " $WP_ADMIN_USER " " $WP_ADMIN_PASSWORD "as admin"
fi

php-fpm7.3 -F