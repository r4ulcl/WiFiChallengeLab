#!/bin/bash
date >> /root/date.log

sleep 5

usermod -aG sudo user

systemctl stop lighttpd
service apache2 stop

ifconfig  enp0s3 10.0.2.15  netmask 255.255.255.0 

sudo modprobe vhost_vsock
sudo chmod a+rw /dev/vhost-vsock
sudo modprobe mac80211_hwsim radios=4
vwifi-server > /var/www/html/vwifi-server.log &
ln -s /var/www/html/vwifi-server.log /root/vwifi-server.log
service apache2 restart
sleep 5
nohup vwifi-spy &
