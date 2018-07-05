FROM debian:latest

EXPOSE 5000

ENV NVM_DIR /usr/local/nvm
ENV FIREBASE_HOSTING_NODE_VERSION 10.5.0
ENV FIREBASE_FUNCTIONS_NODE_VERSION 6.14.3
ENV NODE_PATH $NVM_DIR/v$FIREBASE_HOSTING_NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$FIREBASE_HOSTING_NODE_VERSION/bin:$PATH

RUN rm /bin/sh \
    && ln -s /bin/bash /bin/sh

RUN apt-get update \
    && apt-get install -y \
        curl \
        gconf-service \
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
        ca-certificates \
        fonts-liberation \
        libappindicator1 \
        libnss3 \
        lsb-release \
        xdg-utils \
        wget \
    && apt-get -y autoclean \
    && curl --silent -o- \
        https://raw.githubusercontent.com/creationix/nvm/v0.31.2/install.sh | bash \
    && source $NVM_DIR/nvm.sh \
    && nvm install $FIREBASE_FUNCTIONS_NODE_VERSION \
    && nvm install $FIREBASE_HOSTING_NODE_VERSION \
    && nvm alias functions $FIREBASE_FUNCTIONS_NODE_VERSION \
    && nvm alias hosting $FIREBASE_HOSTING_NODE_VERSION \
    && nvm use hosting \
    && npm install -g firebase-tools
