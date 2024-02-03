FROM debian:stable

RUN apt-get update

RUN apt-get install -y php8.2\
    php8.2-fpm\
    php8.2-mysql\
    wget


RUN sed -i "s|listen = /run/php/php8.2-fpm.sock|listen = 0.0.0.0:9000|g" /etc/php/8.2/fpm/pool.d/www.conf


RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY conf/auto_config.sh auto_config.sh

ENTRYPOINT ["sh", "auto_config.sh"]

EXPOSE 9000

CMD ["php-fpm8.2", "-F"]
