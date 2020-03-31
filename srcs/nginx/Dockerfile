FROM alpine:latest

RUN apk update
RUN apk add nginx
RUN apk add openrc
RUN apk add openssl
RUN apk add openssh
ADD nginx.conf /
ADD index.html /
ADD configure.sh /
ADD nginx.crt /
ADD nginx.key /
ADD id_rsa /etc/ssh/ssh_host_rsa_key
ADD sshd_config /etc/ssh/
EXPOSE 80 443 1234
ENTRYPOINT [ "sh", "configure.sh" ]