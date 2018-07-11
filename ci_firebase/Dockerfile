FROM debian:latest

EXPOSE 5000

ENV NVM_DIR /usr/local/nvm
ENV DEFAULT_NODE_VERSION 10.5.0
ENV NODE_PATH $NVM_DIR/v$DEFAULT_NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$DEFAULT_NODE_VERSION/bin:$PATH

RUN rm /bin/sh \
    && ln -s /bin/bash /bin/sh

RUN apt-get update \
    && apt-get install -y \
        ca-certificates \
        curl \
        fonts-liberation \
        gconf-service \
        libappindicator1 \
        libasound2 \
        libatk1.0-0 \
        libc6 \
        libcairo2 \
        libcups2 \
        libdbus-1-3 \
        libexpat1 \
        libfontconfig1 \
        libgcc1 \
        libgconf-2-4 \
        libgdk-pixbuf2.0-0 \
        libglib2.0-0 \
        libgtk-3-0 \
        libnspr4 \
        libnss3 \
        libpango-1.0-0 \
        libpangocairo-1.0-0 \
        libstdc++6 \
        libx11-6 \
        libx11-xcb1 \
        libxcb1 \
        libxcomposite1 \
        libxcursor1 \
        libxdamage1 \
        libxext6 \
        libxfixes3 \
        libxi6 \
        libxrandr2 \
        libxrender1 \
        libxss1 \
        libxtst6 \
        lsb-release \
        python-setuptools \
        python2.7-dev \
        wget \
        xdg-utils \
    && apt-get -y autoclean \
    && easy_install pip \
    && pip install awscli \
    && curl --silent -o- \
        https://raw.githubusercontent.com/creationix/nvm/v0.31.2/install.sh | bash \
    && source $NVM_DIR/nvm.sh \
    && nvm install $DEFAULT_NODE_VERSION \
    && nvm alias firebase $DEFAULT_NODE_VERSION \
    && nvm use firebase
