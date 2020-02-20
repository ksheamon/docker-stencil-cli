FROM ubuntu:18.04

USER root

## Update package list, then install node and npm
RUN apt-get update && apt-get install -y --no-install-recommends nodejs npm ca-certificates curl netbase wget git

RUN npm -g config set user root
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

ENV NVM_DIR=/usr/local/nvm
ENV NODE_VERSION=10.16

RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.2/install.sh | bash

RUN source ~/.bashrc

RUN source $NVM_DIR/nvm.sh && nvm install $NODE_VERSION && nvm use $NODE_VERSION && \
    npm -g config set user root && \
    npm install node-sass && \
    LIBSASS_EXT="no" npm install -g @bigcommerce/stencil-cli
