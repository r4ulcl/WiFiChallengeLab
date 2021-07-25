#!/bin/bash

USER=`whoami`
if [[ $USER == 'user' ]]; then
        echo "Shutting down the VM"
        VBoxManage controlvm "wifiLabAPs" poweroff
        VBoxManage controlvm "wifiLabClients" poweroff

        echo "Restoring to snapshot"
        if cat /proc/cpuinfo | grep vendor_id | grep AMD ; then
                echo "No snapshot"
        else
                vboxmanage snapshot  "wifiLabAPs" restore "Working"
                vboxmanage snapshot  "wifiLabClients" restore "Working"
        fi

        echo "Starting VM"
        vboxmanage startvm "wifiLabAPs" --type headless
        vboxmanage startvm "wifiLabClients" --type headless

        echo "Cheking"
        STATE=`vboxmanage showvminfo "wifiLabClients" |  grep State: ;  vboxmanage showvminfo "wifiLabAPs" |  grep State:`
        if echo "$STATE" | grep powered off ; then
                echo "VM powered off"
                bash /root/restartVM.sh
        fi

else
        echo "Shutting down the VM"
        su -c 'VBoxManage controlvm "wifiLabAPs" poweroff' user
        su -c 'VBoxManage controlvm "wifiLabClients" poweroff' user

        echo "Restoring to snapshot"
        if cat /proc/cpuinfo | grep vendor_id | grep AMD ; then
                echo "No snapshot"
        else
                su -c 'vboxmanage snapshot "wifiLabAPs" restore "Working"' user
                su -c 'vboxmanage snapshot "wifiLabClients" restore "Working"' user
        fi

        echo "Starting VM"
        su -c 'vboxmanage startvm "wifiLabAPs" --type headless' user
        su -c 'vboxmanage startvm "wifiLabClients" --type headless' user

        echo "Cheking"
        STATE=`su -c 'vboxmanage showvminfo "wifiLabClients"' user |  grep State: ;  su -c 'vboxmanage showvminfo "wifiLabAPs"' user |  grep State:`
        if echo "$STATE" | grep powered off ; then
                echo "VM powered off"
                bash /root/restartVM.sh
        fi
fi
