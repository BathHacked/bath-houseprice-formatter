# This is a comment
FROM ubuntu:14.04
MAINTAINER Tom Fletcher <fletcher.tom@gmail.com>

ADD . /bath-houseprice-formatter/
WORKDIR /bath-houseprice-formatter
RUN chmod +x ./*.sh
RUN ./bootstrap.sh

ENTRYPOINT ./doeverything.sh