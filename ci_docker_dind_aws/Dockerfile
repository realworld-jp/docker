FROM docker:19.03-dind

#### docker:19.03-dind ####

ENV DOCKER_VERSION 19.03-dind
ENV DOCKER_SHA256 331dafcf4b675f6ace9212a113d973a9cf56ea55c33415e1853e6ea1b474e0b6

RUN apk add --no-cache \
    curl \
    jq \
    py-pip \
    && pip install wheel \
    && pip install awscli
