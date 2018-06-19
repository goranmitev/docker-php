FROM php:7.2-apache

RUN apt-get update && apt-get install -y \
    nodejs zlib1g-dev libpng-dev cron wget \
    && pecl install xdebug \
    && pecl install redis \
    && docker-php-ext-enable redis xdebug \    
    && docker-php-ext-install pdo_mysql zip gd pcntl bcmath

RUN a2enmod rewrite

# Add crontab file in the cron directory
ADD crontab /etc/cron.d/cronjobs

# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/cronjobs

# Create the log file to be able to run tail
RUN touch /var/log/cron.log

# RUN apt-get update && apt-get install -y \
#         libfreetype6-dev \
#         libjpeg62-turbo-dev \
#         libmcrypt-dev \
#         libpng-dev \
#     && docker-php-ext-install -j$(nproc) iconv mcrypt \
#     && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
#     && docker-php-ext-install -j$(nproc) gd

COPY 000-default.conf /etc/apache2/sites-available/000-default.conf

COPY php.ini /usr/local/etc/php/

COPY xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini

# RUN set -ex \
#   	&& apk update \
#     && apk add --no-cache libpng-dev mariadb-client curl make g++ autoconf icu-dev zlib-dev \
#     && pecl install xdebug \
#     && docker-php-ext-enable xdebug \
#     && docker-php-ext-install pdo_mysql zip gd

WORKDIR /var/www/html

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]