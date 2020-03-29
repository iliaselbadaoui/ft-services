FROM alpine:latest

RUN apk update
RUN apk add nginx
RUN apk add openrc
ADD nginx.conf /
ADD index.html /
ADD configure.sh /
ADD nginx.crt /
ADD nginx.key /
EXPOSE 80 443
ENTRYPOINT [ "sh", "configure.sh" ]