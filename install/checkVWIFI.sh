#!/bin/bash

NUMLAST=0

while :
do

	#GET ID vwifi
	VID=`cat /root/vwifi-client.log | grep ID: | awk {'print $2'}`

	#if last ID id is disconnected
	#curl and grep ID 
	DISC=`curl -s http://10.0.2.15/vwifi-server.log | grep $VID`

	if [[ $DISC == *"disconnected"* ]]; then
		PID=`pgrep vwifi-client`
		kill -9 $PID
		vwifi-client 10.0.2.15  > /root/vwifi-client.log &
	fi

	# loop each 10 secs
	sleep 10
done