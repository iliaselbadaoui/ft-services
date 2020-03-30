FROM alpine:latest

RUN apk update
RUN apk add libc6-compat
ADD grafana.tar.gz /
ADD configure.sh /
ADD grafana.db /
EXPOSE 3000
ENTRYPOINT [ "sh", "configure.sh" ]