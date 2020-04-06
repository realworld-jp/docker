FROM php:7.4.4-fpm-alpine3.11

#### docker:18.06.0-ce ####

ENV DOCKER_VERSION 18.06.0-ce
ENV DOCKER_SHA256 1c2fa625496465c68b856db0ba850eaad7a16221ca153661ca718de4a2217705

RUN set -x \
    && curl -fSL "https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}.tgz" -o docker.tgz \
    && echo "${DOCKER_SHA256} *docker.tgz" | sha256sum -c - \
    && tar -xzvf docker.tgz \
    && mv docker/* /usr/bin/ \
    && rmdir docker \
    && rm docker.tgz \
    && docker -v

#### php7 memcached ####
ENV MEMCACHED_DEPS zlib-dev libmemcached-dev cyrus-sasl-dev
RUN apk add --no-cache --update libmemcached-libs zlib
RUN set -xe \
    && apk add --no-cache --update --virtual .phpize-deps $PHPIZE_DEPS \
    && apk add --no-cache --update --virtual .memcached-deps $MEMCACHED_DEPS \
    && pecl install memcached \
    && echo "extension=memcached.so" > /usr/local/etc/php/conf.d/20_memcached.ini \
    && rm -rf /usr/share/php7 \
    && rm -rf /tmp/* \
    && apk del .memcached-deps .phpize-deps

RUN apk add --no-cache \
        npm \
        build-base \
        alpine-sdk \
        gcc \
        openssl-dev \
        libffi-dev \
        bash \
        git \
        jq \
        nodejs \
        openssh-client \
        python3 \
        python3-dev \
        zip \
    && npm install -g yarn \
    && pip3 install --upgrade pip \
    && pip3 install docker-compose \
    && pip3 install awscli --ignore-installed six

#### php composer ####
ENV PHP_COMPOSER_VERSION 1.9.1

RUN curl -sS https://getcomposer.org/installer \
  | php -- --install-dir=/usr/local/bin --filename=composer --version=$PHP_COMPOSER_VERSION

#### xdebug ####
RUN set -ex \
    && apk add --no-cache --virtual .xdebug-builddeps \
        autoconf \
        gcc \
        libc-dev \
        make \
    && pecl install xdebug \
    && docker-php-ext-enable xdebug \
    && apk del .xdebug-builddeps

#### pdo-mysql ####
RUN docker-php-ext-install pdo_mysql

#### php-extension zip ####
RUN apk add --no-cache --update libzip-dev
RUN docker-php-ext-install zip

#### ecs-cli ####
RUN curl https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-linux-amd64-latest -o /usr/local/bin/ecs-cli \
    && chmod +x /usr/local/bin/ecs-cli
