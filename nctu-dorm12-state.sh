#!/bin/sh

echo -ne 'Date\t\tAll\tTx\tRx (Byte)'
echo -ne '\nToday\t'

curl 'http://140.113.0.38/login_online_detail.php?login_page=/auth_entry.php?authmeth=7' 2>&1 | while read -r line;do
	if [ -n "$(echo \"$line\" | grep 本次)" ];then
		continue
	elif [ -n "$(echo \"$line\" | grep alignCenter)" ];then
		echo -ne "\n$(echo \"$line\" | cut -d '>' -f 2 | cut -d '<' -f 1)"
	elif [ -n "$(echo \"$line\" | grep alignRight)" ];then
		echo -ne "\t$(echo \"$line\" | cut -d '>' -f 2 | cut -d '<' -f 1)"
	elif [ -n "$(echo \"$line\" | grep 'color-blue1 bold midDis')" ];then
		echo -ne "\t$(echo \"$line\" | cut -d '>' -f 2 | cut -d '<' -f 1 | tr -d 'B')"
	fi
done

echo
