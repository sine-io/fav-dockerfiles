FROM centos:7
MAINTAINER "sine.wang" <sinecelia.wang@gmail.com>

ARG AWS_S3_HOST
ARG AWS_S3_PORT
ARG SSH_USER
ARG SSH_PORT
ARG SSH_PASSWD


RUN rm -rf /var/cache/yum
RUN yum -y clean all
RUN yum -y install deltarpm epel-release

RUN yum -y update

RUN yum -y install \
    git python-pip python-virtualenv sudo libffi-devel \
    libevent-devel libxml2-devel libxslt-devel zlib-devel

COPY s3tests_pytest /

COPY s3tests.conf /

CMD echo "${AWS_S3_HOST} s3host" >> /etc/hosts && \
    sed -i -e "s/port = 6007/port = ${AWS_S3_PORT}/" /s3tests.conf && \
    cd /s3tests_pytest && \
    git pull origin master && \
    ./bootstrap && \
    S3TEST_CONF=/s3tests.conf ./virtualenv/bin/nosetests -v