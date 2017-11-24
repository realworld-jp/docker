FROM docker

RUN apk --no-cache --update add \
    build-base \
    git \
    openssh-client \
    python \
    py-pip \
    zip \
    nodejs \
    nodejs-npm \
    && pip install awscli \
    && npm install -g node-google-apps-script typescript
