FROM alpine:latest

RUN apk update
RUN apk add nginx
RUN apk add openrc
RUN apk add openssl
RUN apk add openssh
RUN apk add --no-cache su-exec
ADD configure.sh /
ADD nginx.conf /
ADD index.html /
ADD nginx.crt /
ADD nginx.key /
ADD dog.sh /
ADD id_rsa /etc/ssh/ssh_host_rsa_key
ADD sshd_config /etc/ssh/
EXPOSE 80 443 22
ENTRYPOINT [ "sh", "configure.sh" ]