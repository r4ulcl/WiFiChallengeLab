#!/bin/bash

# Script to verify if the vwifi-client is connected to the HOST (using apache in HOST with logs)

NUMLAST=0

while :
do

	#GET ID vwifi
	VID=`cat /root/vwifi-client.log | grep ID: | awk {'print $2'} | tail -n 1`

	#if last ID id is disconnected
	#curl and grep ID 
	DISC=`curl -s http://192.168.190.15/vwifi-server.log | grep $VID | tail -n 1`

	if [[ $DISC == *"disconnected"* ]]; then
		PID=`pgrep vwifi-client`
		kill -9 $PID
		vwifi-client 192.168.190.15  > /root/vwifi-client.log &
	fi

	# loop each 10 secs
	sleep 10
done