#!/bin/sh

printf "Account: "
read ACCOUNT

stty -echo
printf "Password: "
read PASSWD
stty echo
echo

if [ -n "$(curl -d "username=$ACCOUNT&userpwd=$PASSWD" -v 'https://dorm.nctu.edu.tw/cgi-bin/ace_web_auth.cgi?web_jumpto=&orig_referer=http://detectportal.firefox.com/success.txt' 2>&1 | grep -F '/login_online_detail.php?show_portal=1')" ];then
	echo 'Success'
else
	echo 'Failed'
fi
