#!/bin/sh

printf 'Date\t\tAll\tTx\tRx (Byte)'
printf '\nToday\t'

curl 'https://dorm.nycu.edu.tw/login_online_detail.php?login_page=/auth_entry.php?authmeth=7' 2>&1 | while read -r line;do
	if [ -n "$(echo \"$line\" | grep 本次)" ];then
		continue
	elif [ -n "$(echo \"$line\" | grep alignCenter)" ];then
		printf "\n$(echo \"$line\" | cut -d '>' -f 2 | cut -d '<' -f 1)"
	elif [ -n "$(echo \"$line\" | grep alignRight)" ];then
		printf "\t$(echo \"$line\" | cut -d '>' -f 2 | cut -d '<' -f 1)"
	elif [ -n "$(echo \"$line\" | grep 'color-blue1 bold midDis')" ];then
		printf "\t$(echo \"$line\" | cut -d '>' -f 2 | cut -d '<' -f 1 | tr -d 'B')"
	fi
done

echo
