if [[ $(ps | grep -v "grep" | grep -c "pure-ftpd") == 0 ]]
then
	cat dog_bark
else
	echo hello
fi