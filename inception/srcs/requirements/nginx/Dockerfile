FROM debian:stable

RUN apt-get update && apt-get install -y nginx

RUN mkdir -p /etc/nginx/ssl

RUN rm -rf /etc/nginx/sites-enabled/default \
    && rm -rf /etc/nginx/sites-available/default

RUN apt-get install -y openssl

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=MA/ST=NONE/L=MED/O=1337/OU=1337/CN=hassimi.42.fr/UID=hassimi"i

COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod 755 /var/www/
RUN chown -R www-data:www-data /var/www/

CMD ["nginx", "-g", "daemon off;"]


