FROM php:7.1-alpine

#### docker:17.06.0-ce ####

ENV DOCKER_VERSION 17.06.0-ce
ENV DOCKER_SHA256 e582486c9db0f4229deba9f8517145f8af6c5fae7a1243e6b07876bd3e706620

RUN set -x \
    && curl -fSL "https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}.tgz" -o docker.tgz \
    && echo "${DOCKER_SHA256} *docker.tgz" | sha256sum -c - \
    && tar -xzvf docker.tgz \
    && mv docker/* /usr/bin/ \
    && rmdir docker \
    && rm docker.tgz \
    && docker -v

RUN apk add --no-cache \
        git \
        openssh-client \
        python \
        py-pip \
        zip \
        bash \
        nodejs \
    && npm install -g yarn \
    && pip install docker-compose \
    && pip install awscli --ignore-installed six

#### php composer ####

ENV PHP_COMPOSER_VERSION 1.4.2

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

