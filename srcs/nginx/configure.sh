adduser -D  square
echo "square:aitfaska98" | chpasswd
mkdir /www
chown -R u+wrx /var/lib/nginx
chown -R u+wrx /www
mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig
mv /nginx.conf /etc/nginx/nginx.conf
mv index.html /www/index.html
mkdir /run/openrc/
touch /run/openrc/softlevel
rc-status
rc-service nginx start
rc-service sshd start
tail -F /dev/null