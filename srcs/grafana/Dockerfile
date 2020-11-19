FROM alpine:latest

RUN apk update
RUN apk add libc6-compat
RUN wget https://dl.grafana.com/oss/release/grafana-6.7.1.linux-amd64.tar.gz
ADD configure.sh /
ADD grafana.db /
ADD dog.sh /
EXPOSE 3000
ENTRYPOINT [ "sh", "configure.sh" ]