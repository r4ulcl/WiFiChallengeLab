#!/bin/bash
date >> /root/date.log

sleep 5

usermod -aG sudo user

systemctl stop lighttpd
service apache2 stop

sudo modprobe vhost_vsock
sudo chmod a+rw /dev/vhost-vsock
sudo modprobe mac80211_hwsim radios=4
vwifi-server >> /root/vwifi-server.log &
sleep 5
nohup vwifi-spy &
