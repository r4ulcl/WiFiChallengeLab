#!/bin/bash
date >> /root/date.log

echo 'nameserver 8.8.8.8' > /etc/resolv.conf

sleep 5

sudo modprobe mac80211_hwsim radios=14

service apache2 start &

#F0:9F:C2:71 ubiquiti
macchanger -m F0:9F:C2:71:22:00 wlan0 # OPN
macchanger -m F0:9F:C2:71:22:11 wlan1 # WEP
macchanger -m F0:9F:C2:71:22:22 wlan2 # PSK
macchanger -m F0:9F:C2:71:22:33 wlan3 # PSK WPS
macchanger -m F0:9F:C2:71:22:44 wlan4 # PSK VULN KRACKS TODO
macchanger -m F0:9F:C2:71:22:55 wlan5 # MGT 
macchanger -m F0:9F:C2:71:22:66 wlan6 # MGT Relay
macchanger -m F0:9F:C2:71:22:77 wlan7 # MGT TLS
macchanger -m F0:9F:C2:71:22:88 wlan8 # TODO

macchanger -r wlan9     # Other 0
macchanger -r wlan10    # Other 1
macchanger -r wlan11    # Other 2
macchanger -r wlan12    # Other 3
macchanger -r wlan13    # Other 4
#macchanger -m 8d:4c:02:22:c9:33 wlan9 # Other 1
#macchanger -m 4f:c2:15:67:f1:87 wlan10 # Other 2
#macchanger -m f8:b5:cd:67:50:d5 wlan11 # Other 3
#macchanger -m 98:ab:c9:01:8d:e1 wlan12 # Other 4
#macchanger -m 76:c4:de:29:5f:b9 wlan13 # Other 5

vwifi-client 192.168.190.15  > /root/vwifi-client.log &

sleep 10

dnsmasq

#TODO RE ORDER ALL WLAN and IP -> 0 OPN, 1 WEP, 2 PSK, 3 PSK WPS, 4 MGT, 5 MGTRelay, 6 MGT TLS, 7 8 , 9,10,11,12,13 others

# Open
ip addr add 192.168.0.1/24 dev wlan0
hostapd /root/open/hostapd_open.conf > /root/hostapd_open.log &

# WEP hidden
ip addr add 192.168.1.1/24 dev wlan1
hostapd /root/wep/hostapd_wep_hidden.conf > /root/hostapd_wep_hidden.log &

# PSK
ip addr add 192.168.2.1/24 dev wlan2
hostapd /root/psk/hostapd_wpa.conf > /root/hostapd_wpa.log &

# PSK WPS
ip addr add 192.168.3.1/24 dev wlan3
hostapd /root/psk/hostapd_wps.conf > /root/hostapd_wps.log &

# PSK krack
#ip addr add 192.168.4.1/24 dev wlan4
#/root/krack/hostapd-2.6/hostapd/hostapd /root/psk/hostapd_krack.conf > /root/hostapd_krack.log &

# MGT
ip addr add 192.168.5.1/24 dev wlan5
hostapd /root/mgt/hostapd-wpe.conf > /root/hostapd-wpe.log &

# MGT Relay
ip addr add 192.168.6.1/24 dev wlan6
hostapd /root/mgt/hostapd-wpe-relay.conf > /root/hostapd-wpe-relay.log &

# MGT TLS
ip addr add 192.168.7.1/24 dev wlan7
hostapd /root/mgt/hostapd-wpe-tls.conf > /root/hostapd-wpe-tls.log &

#TODO
#ip addr add 192.168.8.1/24 dev wlan8


# PSK Other
ip addr add 192.168.9.1/24 dev wlan9
hostapd /root/psk/hostapd_other0.conf > /root/hostapd_other0.log & 

ip addr add 192.168.10.1/24 dev wlan10
hostapd /root/psk/hostapd_other1.conf > /root/hostapd_other1.log & 

ip addr add 192.168.11.1/24 dev wlan11
hostapd /root/psk/hostapd_other2.conf > /root/hostapd_other2.log & 

ip addr add 192.168.12.1/24 dev wlan12
hostapd /root/psk/hostapd_other3.conf > /root/hostapd_other3.log & 


ip addr del 192.168.190.15/24 dev enp0s3

bash /root/checkVWIFI.sh > /root/checkVWIFI.log &


#systemctl stop networking
echo "ALL SET"

#Generate WEP traffic
ping 192.168.1.2 > /dev/null 2>&1