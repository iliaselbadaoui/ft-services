if [[ $(ps | grep -v "grep" | grep -c "grafana") == 0 ]]
then
	cat dog_bark
else
	echo hello
fi