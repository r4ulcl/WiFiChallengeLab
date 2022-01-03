#!/bin/bash


restartSnapshot(){
        VM=$1

        echo "Shutting down the VM $VM"
        VBoxManage controlvm "$VM" poweroff

        echo "Restoring to snapshot $VM"
        if cat /proc/cpuinfo | grep vendor_id | grep AMD ; then
                echo "No snapshot to AMD"
        else
                vboxmanage snapshot "$VM" restore "Working"
        fi

        echo "Starting $VM"
        vboxmanage startvm "$VM" --type headless

        echo "Checking $VM"
        STATE=`vboxmanage showvminfo "$VM" |  grep State:`
        if echo "$STATE" | grep -E 'powered off|guru meditation' ; then
                echo "VM powered off"
                restartSnapshot "$VM"
        fi
} 

export -f restartSnapshot

sudo killall airodump-ng

USER=`whoami`
if [[ $USER == 'user' ]]; then
        restartSnapshot "WiFiChallengeAPs"
        restartSnapshot "WiFiChallengeClients"
else
        su user -c "bash -c 'restartSnapshot 'WiFiChallengeAPs''"
        su user -c "bash -c 'restartSnapshot 'WiFiChallengeClients''"
fi

sleep 60 && sudo killall airodump-ng &

echo 'Wait a minute while everything starts'
sleep 60
echo 'DONE'
