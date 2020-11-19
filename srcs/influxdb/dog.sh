if [[ $(ps | grep -v "grep" | grep -c "telegraf") == 0 ]]
then
	cat dog_bark
else
	echo hello
fi
if [[ $(ps | grep -v "grep" | grep -c "influxd") == 0 ]]
then
	cat dog_bark
else
	echo hello
fi