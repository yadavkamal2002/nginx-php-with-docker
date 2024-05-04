FROM php:7.4-fpm
RUN apt-get update && \
    apt-get install -y \
    curl \
    vim \
    sudo \
    supervisor \
    nginx

WORKDIR /var/www
COPY heer/index.php /var/www/index.php
COPY heer/default.conf /etc/nginx/sites-enabled/default
COPY heer/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
CMD ["/usr/bin/supervisord"]