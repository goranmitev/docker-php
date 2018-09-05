FROM php:7.2-apache

RUN apt-get update && apt-get install -y \
    gnupg git zlib1g-dev libpng-dev libicu-dev libjpeg-dev libffi-dev wget zip \
    libxml2-dev libfreetype6 libfreetype6-dev g++ make autoconf \
    build-essential libfontconfig1-dev libssl-dev libx11-dev libxext-dev libxrender-dev python \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && pecl install xdebug \
    && pecl install redis \
    && docker-php-ext-enable redis xdebug \
    && docker-php-ext-install pdo_mysql intl zip gd pcntl bcmath calendar \
    && curl -sL https://deb.nodesource.com/setup_8.x | bash \
    && apt-get install -y nodejs

RUN a2enmod rewrite

COPY 000-default.conf /etc/apache2/sites-available/000-default.conf

COPY php.ini /usr/local/etc/php/

COPY xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini

WORKDIR /var/www/html

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
