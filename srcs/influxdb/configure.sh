influxd run -config /influxdb.conf &
influx -execute "create database telegraf"
influx -execute "CREATE USER squar WITH PASSWORD 'aitfaska98' WITH ALL PRIVILEGES"
/usr/bin/telegraf
tail -F /dev/null