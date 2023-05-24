FROM php:7.4-apache
WORKDIR /var/www/html

# Mod rewrite
RUN a2enmod rewrite

# Install dependencies
RUN apt-get update -y && apt-get install -y libicu-dev unzip zip

# Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install PHP extensions
RUN docker-php-ext-install pdo pdo_mysql intl
