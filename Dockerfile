FROM php:8.0-fpm-alpine

RUN apk update && apk add \
  libzip-dev \
  zip \
  unzip

RUN docker-php-ext-configure zip && \
  docker-php-ext-install opcache pdo_mysql zip bcmath pcntl sockets

RUN apk add --no-cache pcre-dev $PHPIZE_DEPS \
  && pecl install redis \
  && docker-php-ext-enable redis.so
