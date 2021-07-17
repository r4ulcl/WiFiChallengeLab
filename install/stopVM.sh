#!/bin/bash

USER=`whoami`
if [[ $USER == 'user' ]]; then
        echo "Shutting down the VM"
        VBoxManage controlvm "wifiLabAPs" poweroff
        VBoxManage controlvm "wifiLabClients" poweroff

        echo "Restoring to snapshot"
        vboxmanage snapshot  "wifiLabAPs" restorecurrent
        vboxmanage snapshot  "wifiLabClients" restorecurrent
else
        echo "Shutting down the VM"
        su -c 'VBoxManage controlvm "wifiLabAPs" poweroff' user
        su -c 'VBoxManage controlvm "wifiLabClients" poweroff' user

        echo "Restoring to snapshot"
        su -c 'vboxmanage snapshot "wifiLabAPs" restorecurrent' user
        su -c 'vboxmanage snapshot "wifiLabClients" restorecurrent' user

fi
