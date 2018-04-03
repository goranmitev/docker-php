FROM php:7.2-fpm-alpine

RUN set -ex \
  	&& apk update \
    && apk add --no-cache libpng-dev mariadb-client curl make g++ autoconf icu-dev zlib-dev \
    && pecl install xdebug \
    && docker-php-ext-enable xdebug \
    && docker-php-ext-install pdo_mysql zip gd

WORKDIR /var/www/html

CMD ["php-fpm"]