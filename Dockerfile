FROM php:8.2-apache

# PHP
RUN apt update
RUN apt install -y zlib1g-dev g++ git libicu-dev zip libzip-dev zip
RUN docker-php-ext-install intl opcache pdo pdo_mysql
RUN docker-php-ext-configure zip
RUN docker-php-ext-install zip

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer


# Apache
RUN a2enmod rewrite
RUN service apache2 restart

EXPOSE 80
