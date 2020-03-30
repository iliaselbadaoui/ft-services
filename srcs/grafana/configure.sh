mkdir grafana/data
mv grafana.db grafana/data/
cd grafana/bin/
./grafana-server web
tail -F /dev/null