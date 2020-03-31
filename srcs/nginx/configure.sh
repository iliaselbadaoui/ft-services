adduser -D -g 'www' www
mkdir /www
chown -R www:www /var/lib/nginx
chown -R www:www /www
mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig
mv /nginx.conf /etc/nginx/nginx.conf
mv index.html /www/index.html
mkdir /run/openrc/
touch /run/openrc/softlevel
adduser -D square
echo square:aitfaska98 | chpasswd
chmod -R go-r /etc/ssh/ssh_host_rsa_key
rc-status
rc-service nginx start
rc-service sshd start
tail -F /dev/null