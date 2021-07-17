#!/bin/bash

USER=`whoami`
if [[ $USER == 'user' ]]; then
	echo "Restoring to snapshot"
	vboxmanage snapshot  "wifiLabAPs" restorecurrent
	vboxmanage snapshot  "wifiLabClients" restorecurrent

	echo "Starting VM"
	vboxmanage startvm "wifiLabAPs"
	vboxmanage startvm "wifiLabClients"
else
	echo "Restoring to snapshot"
	su -c 'vboxmanage snapshot "wifiLabAPs" restorecurrent' user
	su -c 'vboxmanage snapshot "wifiLabClients" restorecurrent' user

	echo "Starting VM"
	su -c 'vboxmanage startvm "wifiLabAPs"' user
	su -c 'vboxmanage startvm "wifiLabClients"' user
fi