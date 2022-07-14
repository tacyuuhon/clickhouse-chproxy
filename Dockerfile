FROM debian:stable-slim

MAINTAINER tacyuuhon "tacyuuhon@gmail.com"

ARG SRC_DIR=/opt
ARG CHPROXY_NAME=chproxy
ARG CHPROXY_VERSION=1.15.1
ENV CHPROXY_CONFIG=${SRC_DIR}/config.yml
ENV CHPROXY_APP_NAME=${CHPROXY_NAME}
ENV CHPROXY_BUILD_VERSION=${CHPROXY_VERSION}

RUN apt-get update -y && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR ${SRC_DIR}

ADD https://raw.githubusercontent.com/Vertamedia/chproxy/${CHPROXY_BUILD_VERSION}/config/testdata/full.yml config.yml
ADD https://github.com/Vertamedia/chproxy/releases/download/${CHPROXY_BUILD_VERSION}/chproxy-linux-amd64-${CHPROXY_BUILD_VERSION}.tar.gz chproxy-linux-amd64.tar.gz

RUN tar -zxf chproxy-linux-amd64.tar.gz && \
    rm -rf chproxy-linux-amd64.tar.gz

ENTRYPOINT exec ./${CHPROXY_APP_NAME} -config ${CHPROXY_CONFIG}
