FROM debian:stable-slim

LABEL org.opencontainers.image.authors="tacyuuhon@gmail.com"

ARG SRC_DIR=/opt
ARG CHPROXY_NAME=chproxy
ARG CHPROXY_VERSION=1.16.2
ENV CHPROXY_CONFIG=${SRC_DIR}/config.yml
ENV CHPROXY_APP_NAME=${CHPROXY_NAME}
ENV CHPROXY_BUILD_VERSION=${CHPROXY_VERSION}

RUN apt-get update -y && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR ${SRC_DIR}

ADD https://raw.githubusercontent.com/ContentSquare/chproxy/v${CHPROXY_BUILD_VERSION}/config/testdata/full.yml config.yml
ADD https://github.com/ContentSquare/chproxy/releases/download/v${CHPROXY_BUILD_VERSION}/chproxy_${CHPROXY_BUILD_VERSION}_linux_amd64.tar.gz chproxy-linux-amd64.tar.gz

RUN tar -zxf chproxy-linux-amd64.tar.gz && \
    rm -rf chproxy-linux-amd64.tar.gz

ENTRYPOINT exec ./${CHPROXY_APP_NAME} -config ${CHPROXY_CONFIG}
