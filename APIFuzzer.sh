#!/bin/bash

#Colours
greenCol="\e[0;32m\033[1m"
endCol="\033[0m\e[0m"
redCol="\e[0;31m\033[1m"
blueCol="\e[0;34m\033[1m"
yellowCol="\e[0;33m\033[1m"
cyanCol="\e[0;36m\033[1m"

#Methods
#Methods=("GET" "POST" "HEAD" "OPTIONS" "PUT" "DELETE" "PATCH" "TRACE" "CONNECT")

for url in $(cat $1); do
	echo -e "${greenCol}[+]${endCol} $url"
	for method in GET POST OPTIONS PUT PATCH TRACE;do
		#echo -e "$method \t ${url}"
		echo -e "${cyanCol}${method}${endCol}\t $(curl -s ${url} -I -X $method --connect-timeout 10 | grep -i -P 'HTTP[\/\. 0-9]+')";
	done
done
