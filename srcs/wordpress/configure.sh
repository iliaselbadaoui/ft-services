adduser -D -g 'www' www
mkdir /www
chown -R www:www /var/lib/nginx
chown -R www:www /www
mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig
mv /nginx.conf /etc/nginx/nginx.conf
mv wordpress /www/wordpress
mkdir /run/openrc/
touch /run/openrc/softlevel
rc-status
rc-service -v php-fpm7 start
rc-service nginx start
tail -F /dev/null