FROM alpine:latest

RUN apk add openssl --no-cache
RUN apk add pure-ftpd --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache



ADD configure.sh /
EXPOSE 21 21000
ENTRYPOINT [ "sh", "configure.sh" ]