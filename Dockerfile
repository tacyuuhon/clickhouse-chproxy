FROM debian:stable-slim

MAINTAINER tacyuuhon "tacyuuhon@gmail.com"

ARG SRC_DIR=/opt
ARG CHPROXY_VERSION=1.5.0
ENV CHPROXY_CONFIG=${SRC_DIR}/config.yml

RUN apt-get update -y && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR ${SRC_DIR}

ADD https://raw.githubusercontent.com/Vertamedia/chproxy/${CHPROXY_VERSION}/config/testdata/full.yml config.yml
ADD https://github.com/Vertamedia/chproxy/releases/download/${CHPROXY_VERSION}/chproxy-linux-amd64.tar.gz chproxy-linux-amd64.tar.gz

RUN tar -zxf chproxy-linux-amd64.tar.gz && \
    rm -rf chproxy-linux-amd64.tar.gz

ENTRYPOINT exec ./chproxy-linux-amd64 -config ${CHPROXY_CONFIG}
