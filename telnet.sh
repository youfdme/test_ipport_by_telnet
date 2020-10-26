#!/bin/bash
for host in `cat $1`
do
 ip=`echo $host | awk 'BEGIN{FS=":"} {print $1}'`
 port=`echo $host | awk 'BEGIN{FS=":"} {print $2}'`
 sleep 0.1
 check=`echo quit | timeout --signal=9 1 telnet $ip $port 2>/dev/null | grep Escape | wc -l`
 if [ $check -eq 1 ];then
	echo -e "\033[32m$ip $port is OK\033[0m"
 else
	echo -e "\033[31m$ip $port is FAILE ....\033[0m"
 fi

done
