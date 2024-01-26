#!/bin/bash

if [ ! -f "/var/www/wordpress/wp-config.php" ]; then
    cd /var/www/wordpress
    rm -rf /var/www/wordpress/*

    wp core download --allow-root

    wp config create --allow-root \
        --dbname=${SQL_DATABASE} \
        --dbuser=${SQL_USER} \
        --dbpass=${SQL_PASSWORD} \
        --dbhost=mariadb

    wp core install --allow-root \
        --url=${WORDPRESS_URL} \
        --title=${WORDPRESS_TITLE} \
        --admin_user=${WORDPRESS_ADMIN_NAME} \
        --admin_password=${WORDPRESS_ADMIN_PASSWD} \
        --admin_email=${WORDPRESS_ADMIN_EMAIL}


    #changes the ownership of the "/var/www//" directory and all its contents to the user and group 'www-data', allowing the web server to have appropriate permissions to read, write, and execute files within the directory.
    sleep 2
    chown -R www-data:www-data /var/www/wordpress
    chmod -R 777 /var/www/wordpress

fi

exec "$@"
