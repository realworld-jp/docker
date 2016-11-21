FROM centos:centos6
ENV TZ JST-9
EXPOSE 80
########################################
# Update yum packages
########################################
RUN curl -ks https://mirror.webtatic.com/yum/RPM-GPG-KEY-webtatic-andy > RPM-GPG-KEY-webtatic-andy && \
    gpg --quiet --with-fingerprint ./RPM-GPG-KEY-webtatic-andy && \
    rpm --import ./RPM-GPG-KEY-webtatic-andy && \
    rpm -Uvh http://mirror.webtatic.com/yum/el6/latest.rpm
RUN yum update -y && \
    yum install -y epel-release && \
    yum install -y \
        php70w-devel \
        git \
        gcc \
        gcc-c++ \
        zlib-devel \
        wget
########################################
# Install memcached extensions
########################################
WORKDIR /usr/local/src
RUN wget https://launchpad.net/libmemcached/1.0/1.0.18/+download/libmemcached-1.0.18.tar.gz && \
    tar -zxvf libmemcached-1.0.18.tar.gz && \
    git clone -b php7 --depth 1 https://github.com/php-memcached-dev/php-memcached
WORKDIR /usr/local/src/libmemcached-1.0.18
RUN ./configure --without-memcached && \
    make && \
    make install
WORKDIR /usr/local/src/php-memcached
RUN phpize && \
    ./configure --disable-memcached-sasl && \
    make && \
    make install

