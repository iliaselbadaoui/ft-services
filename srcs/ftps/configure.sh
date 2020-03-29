mkdir -p /ftps/$USER

openssl req -x509 -nodes -days 7300 -newkey rsa:2048 -subj "/C=MO/ST=Marrakech Safi/L=Marrakech/O=1337/CN=ilias" -keyout /etc/ssl/private/pure-ftpd.pem -out /etc/ssl/private/pure-ftpd.pem
chmod 600 /etc/ssl/private/pure-ftpd.pem

adduser -h /ftps/$USER -D $USER
echo "$USER:$PASSWORD" | chpasswd

/usr/sbin/pure-ftpd -j -Y 2 -p 21000:21000 -P "92.168.99.103"
# -j create home directory if not existe
# -Y behavior : 2 meanes accept only connections using tls
# -p passiveport range