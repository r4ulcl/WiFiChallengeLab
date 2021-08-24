#!/bin/bash

USER=`whoami`
if [[ $USER == 'user' ]]; then
        echo "Shutting down the VM"
        VBoxManage controlvm "WifiLabAPs" poweroff
        VBoxManage controlvm "WifiLabClients" poweroff

        echo "Restoring to snapshot"
        if cat /proc/cpuinfo | grep vendor_id | grep AMD ; then
                echo "No snapshot"
        else
                vboxmanage snapshot  "WifiLabAPs" restore "Working"
                vboxmanage snapshot  "WifiLabClients" restore "Working"
        fi

        echo "Starting VM"
        vboxmanage startvm "WifiLabAPs" --type headless
        vboxmanage startvm "WifiLabClients" --type headless

        echo "Cheking"
        STATE=`vboxmanage showvminfo "WifiLabClients" |  grep State: ;  vboxmanage showvminfo "WifiLabAPs" |  grep State:`
        if echo "$STATE" | grep 'powered off' ; then
                echo "VM powered off"
                bash /root/restartVM.sh
        fi

else
        echo "Shutting down the VM"
        su -c 'VBoxManage controlvm "WifiLabAPs" poweroff' user
        su -c 'VBoxManage controlvm "WifiLabClients" poweroff' user

        echo "Restoring to snapshot"
        if cat /proc/cpuinfo | grep vendor_id | grep AMD ; then
                echo "No snapshot"
        else
                su -c 'vboxmanage snapshot "WifiLabAPs" restore "Working"' user
                su -c 'vboxmanage snapshot "WifiLabClients" restore "Working"' user
        fi

        echo "Starting VM"
        su -c 'vboxmanage startvm "WifiLabAPs" --type headless' user
        su -c 'vboxmanage startvm "WifiLabClients" --type headless' user

        echo "Cheking"
        STATE=`su -c 'vboxmanage showvminfo "WifiLabClients"' user |  grep State: ;  su -c 'vboxmanage showvminfo "WifiLabAPs"' user |  grep State:`
        if echo "$STATE" | grep 'powered off' ; then
                echo "VM powered off"
                bash /root/restartVM.sh
        fi
fi
