wget https://dl.grafana.com/oss/release/grafana-6.7.1.linux-amd64.tar.gz
tar -zxvf grafana-6.7.1.linux-amd64.tar.gz
mkdir grafana-6.7.1/data
rm -rf grafana-6.7.1/data/grafana.db
mv grafana.db grafana-6.7.1/data/grafana.db
cd grafana-6.7.1/bin/
./grafana-server web
tail -F /dev/null