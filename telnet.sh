#!/bin/bash
for host in `cat ./host.txt`
do
 ip=`echo $host | awk 'BEGIN{FS=":"} {print $1}'`
 port=`echo $host | awk 'BEGIN{FS=":"} {print $2}'`
 sleep 0.5
 check=`echo quit | timeout --signal=9 2 telnet $ip $port 2>/dev/null | grep Escape | wc -l`
 if [ $check -eq 1 ];then
	echo "$ip $port is OK."
 else
	echo "$ip $port is faile ...."
 fi

done
