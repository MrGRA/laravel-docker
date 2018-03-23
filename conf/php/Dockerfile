FROM php:7.2-fpm-alpine
MAINTAINER Webtools

# Base image is PHP7 FPM based on Alpine Linux
# We're adding some php extensions: mcrypt, intl and gd

# Installing all dependencies for the PHP extensions we're adding
RUN apk update \
        && apk upgrade  \
        #---- Some utilities
        && apk add shadow \
        #---- Libraries required to build extensions
        && apk add autoconf g++ make \
        #---- Libraries required for mcrypt
        && apk add libmcrypt libmcrypt-dev libltdl \
        #---- Libraries required for intl
        && apk add icu-dev \
        #---- Libraries required for gd
        && apk add freetype libpng libjpeg-turbo freetype-dev libpng-dev libjpeg-turbo-dev \
        #--- Clean up APK cache
        && rm -rf /var/cache/apk/*

# Change the www-data UID and GUID because they do not match between my Debian and Alpine
# On Debian 8: www-data is UID 33 and GUID 33, which is already taken by the XFS user
RUN usermod -u 44 xfs && groupmod -g 44 xfs && usermod -u 33 www-data && groupmod -g 33 www-data

# Installing PHP extensions
RUN echo "\n" | pecl install mcrypt-1.0.1 \
        && docker-php-ext-enable mcrypt \
        && docker-php-ext-install intl \
        && docker-php-ext-configure gd --with-freetype-dir=/usr/include --with-png-dir=/usr/include --with-jpeg-dir=/usr/include \
        && docker-php-ext-install -j1 gd \
        && docker-php-ext-install pdo pdo_mysql

EXPOSE 9000

ENTRYPOINT ["php-fpm"]