FROM ubuntu:16.04
MAINTAINER "sine.wang" <sinecelia.wang@gmail.com>

ENV COSVERSION=0.4.7.7
ENV COSPKGNAME="cosbench-"
ENV COSNAME="cosbench-"
ENV SUFFIXNAME="-ehualu"
ENV COSFILENAMEEXT=".tar.gz"

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y \
         dpkg apt-transport-https curl apt-utils netcat net-tools openjdk-8-jre

COPY ${COSPKGNAME}${COSVERSION}${SUFFIXNAME}${COSFILENAMEEXT} /

RUN tar xf /${COSPKGNAME}${COSVERSION}${SUFFIXNAME}${COSFILENAMEEXT} -C / \
    && mv /${COSNAME}${COSVERSION}${SUFFIXNAME} /cosbench \
    && rm -f /${COSPKGNAME}${COSVERSION}${SUFFIXNAME}${COSFILENAMEEXT} \
    && rm -rf /${COSNAME}${COSVERSION}${SUFFIXNAME} \
    && rm -f /bin/sh && ln -s /bin/bash /bin/sh

ADD start-cosbench.sh /cosbench/

CMD ["sh /cosbench/start-cosbench.sh"]