#!/bin/bash
date >> /root/date.log
echo 'nameserver 8.8.8.8' > /etc/resolv.conf

sleep 5

usermod -aG sudo user

systemctl stop lighttpd
service apache2 stop

ifconfig  enp0s3 192.168.190.15  netmask 255.255.255.0 

sudo modprobe vhost_vsock
sudo chmod a+rw /dev/vhost-vsock
sudo modprobe mac80211_hwsim radios=6
vwifi-server > /var/www/html/vwifi-server.log &
ln -s /var/www/html/vwifi-server.log /root/vwifi-server.log
service apache2 restart
sleep 5
#nohup vwifi-spy &
nohup vwifi-client 192.168.190.15 &

rm  /root/vwifi-ctrl.log

while :
do
    LS=`vwifi-ctrl ls`
    CID=`echo "$LS" | awk '{print $1}'`
    CID1=`echo $CID | cut -d " " -f1`
    CID2=`echo $CID | cut -d " " -f2`
    CID3=`echo $CID | cut -d " " -f3`
    vwifi-ctrl set $CID1 5  0 0 >> /root/vwifi-ctrl.log
    vwifi-ctrl set $CID2 -5  0 0 >> /root/vwifi-ctrl.log
    vwifi-ctrl set $CID3 0  5 0 >> /root/vwifi-ctrl.log

    sleep 10 
done 
