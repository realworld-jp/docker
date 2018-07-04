FROM debian:latest

ENV NVM_DIR /usr/local/nvm
ENV FIREBASE_HOSTING_NODE_VERSION 10.5.0
ENV FIREBASE_FUNCTIONS_NODE_VERSION 6.14.3
ENV NODE_PATH $NVM_DIR/v$FIREBASE_HOSTING_NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$FIREBASE_HOSTING_NODE_VERSION/bin:$PATH

RUN rm /bin/sh \
    && ln -s /bin/bash /bin/sh

RUN apt-get update \
    && apt-get install -y curl \
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
