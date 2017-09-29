FROM docker

RUN apk --no-cache --update add \
        build-base \
        git \
        go \
        openssh-client \
        python \
        py-pip \
        zip \
    && pip install awscli --ignore-installed six
