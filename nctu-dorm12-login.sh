#!/bin/sh

if [ ! -n "$2" ];then
	echo "Usage: $0 ACCOUNT PASSWORD"
	echo "Login to NCTU dorm network with ACCOUNT and PASSWORD."
	echo "Note: Password is sent in cleartext"
	exit 1
fi

if [ -n "$(curl -d "username=$1&userpwd=$2" -X POST -v 'http://140.113.0.38/cgi-bin/ace_web_auth.cgi?web_jumpto=&orig_referer=http://detectportal.firefox.com/success.txt'| grep -F '/login_online_detail.php?show_portal=1&orig_referer=http://detectportal.firefox.com/success.txt&login_page=')" ];then
	echo 'Success'
else
	echo 'Failed'
fi
