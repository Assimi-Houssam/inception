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

    wp user create --allow-root \
        ${NORMAL_USER_NAME} \
        ${NORMAL_USER_EMAIL} \
        --role=editor \
        --user_pass=${NORMAL_USER_PASSWD}

    sleep 2
    chown -R www-data:www-data /var/www/wordpress
    chmod -R 777 /var/www/wordpress

fi

exec "$@"
