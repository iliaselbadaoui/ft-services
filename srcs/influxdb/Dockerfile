FROM alpine:latest

RUN apk update
RUN apk add influxdb
RUN apk add libc6-compat
RUN mkdir /etc/telegraf \
&& wget https://dl.influxdata.com/telegraf/releases/telegraf-1.13.3-static_linux_amd64.tar.gz \
&& tar -C . -xzf telegraf-1.13.3-static_linux_amd64.tar.gz \
&& chmod +x telegraf/* \
&& cp telegraf/telegraf /usr/bin/ \
&& rm -rf *.tar.gz* telegraf/ \
&& rm -rf /var/cache/apk/*
ADD configure.sh /
ADD telegraf.conf /etc/telegraf/telegraf.conf
ADD influxdb.conf /
EXPOSE 8086
ENTRYPOINT [ "sh", "configure.sh" ]