FROM ruby:alpine

#### dpl ####

ENV DPL_VERSION 1.9.8
ENV NOKOGIRI_VERSION 1.8.4
ENV AWS_SDK_VERSION 3.0.1
ENV RUBY_ZIP_VERSION 1.2.1

RUN set -ex \
  && apk add --no-cache --virtual .dpl-builddeps \
  autoconf \
  gcc \
  libc-dev \
  libxml2-dev \
  make \
  && gem install nokogiri -v $NOKOGIRI_VERSION \
  && gem install dpl -v $DPL_VERSION \
  && gem install aws-sdk -v $AWS_SDK_VERSION \
  && gem install rubyzip -v $RUBY_ZIP_VERSION \
  && apk del .dpl-builddeps

#### aws ####

RUN apk add --no-cache \
  git \
  py-pip \
  zip \
  && pip install awscli --ignore-installed six

#### rsync ####

RUN set -ex \
  && apk add --no-cache rsync

#### docker + rwhub/ci_docker ####

RUN set -ex \
  && apk add --no-cache docker

#### file ####

RUN set -ex \
  && apk add --no-cache file

#### s3 deploy ####

RUN set -ex \
  && gem install jmespath --version 1.4.0 -N \
  && gem install aws-sigv4 --version 1.0.3 -N \
  && gem install aws-sdk-core --version 3.22.1 -N \
  && gem install aws-sdk-resources --version 3.22.0 -N \
  && gem install aws-sdk --version 3.0.1 -N \
  && gem install mime-types --version 3.1 -N

#### make ####

RUN set -ex \
  && apk add --no-cache make