FROM debian:stable-slim

LABEL org.opencontainers.image.authors="tacyuuhon@gmail.com"

ARG BUILDARCH
ARG SRC_DIR=/opt
ARG CHPROXY_NAME=chproxy
ARG CHPROXY_VERSION=1.23.0
ENV CHPROXY_CONFIG=${SRC_DIR}/config.yml
ENV CHPROXY_APP_NAME=${CHPROXY_NAME}
ENV CHPROXY_BUILD_VERSION=${CHPROXY_VERSION}

RUN apt-get update -y && \
    apt-get install curl -y && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR ${SRC_DIR}

ADD https://raw.githubusercontent.com/ContentSquare/chproxy/v${CHPROXY_BUILD_VERSION}/config/testdata/full.yml config.yml
ADD https://github.com/ContentSquare/chproxy/releases/download/v${CHPROXY_BUILD_VERSION}/chproxy_${CHPROXY_BUILD_VERSION}_linux_$BUILDARCH.tar.gz chproxy-linux-$BUILDARCH.tar.gz

RUN tar -zxf chproxy-linux-$BUILDARCH.tar.gz && \
    rm -rf chproxy-linux-$BUILDARCH.tar.gz

ENTRYPOINT exec ./${CHPROXY_APP_NAME} -config ${CHPROXY_CONFIG}
