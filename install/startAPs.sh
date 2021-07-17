#!/bin/bash
date >> /root/date.log

sleep 5

sudo modprobe mac80211_hwsim radios=10

service apache2 start &

#F0:9F:C2:71 ubiquiti
macchanger -m F0:9F:C2:71:22:00 wlan0
macchanger -m F0:9F:C2:71:22:11 wlan1
macchanger -m F0:9F:C2:71:22:22 wlan2
macchanger -m 30:FB:B8:33:22:33 wlan3
macchanger -m 30:FB:B8:33:22:44 wlan4
macchanger -m 30:FB:B8:33:22:55 wlan5
macchanger -m 30:FB:B8:33:22:66 wlan6
macchanger -m F0:9F:C2:71:22:77 wlan7 #TLS
macchanger -m F0:9F:C2:71:22:88 wlan8 #Hdden
macchanger -m F0:9F:C2:71:22:99 wlan9 #WPS

vwifi-client 10.0.2.2  > /root/vwifi-client.log &

sleep 10

dnsmasq


# MGT
ip addr add 192.168.0.1/24 dev wlan0
hostapd /root/mgt/hostapd-wpe.conf > /root/hostapd-wpe.log &

# Open
ip addr add 192.168.1.1/24 dev wlan1
hostapd /root/open/hostapd_open.conf > /root/hostapd_open.log &

# PSK
ip addr add 192.168.2.1/24 dev wlan2
hostapd /root/psk/hostapd_wpa.conf > /root/hostapd_wpa.log &

# PSK Other
ip addr add 192.168.3.1/24 dev wlan3
hostapd /root/psk/hostapd_other0.conf > /root/hostapd_other0.log & 

ip addr add 192.168.4.1/24 dev wlan4
hostapd /root/psk/hostapd_other1.conf > /root/hostapd_other1.log & 

ip addr add 192.168.5.1/24 dev wlan5
hostapd /root/psk/hostapd_other2.conf > /root/hostapd_other2.log & 

ip addr add 192.168.6.1/24 dev wlan6
hostapd /root/psk/hostapd_other3.conf > /root/hostapd_other3.log & 

# MGT TLS
ip addr add 192.168.7.1/24 dev wlan7
hostapd /root/mgt/hostapd-wpe-tls.conf > /root/hostapd-wpe-tls.log &

# PSK hidden
ip addr add 192.168.8.1/24 dev wlan8
hostapd /root/wep/hostapd_wep_hidden.conf > /root/hostapd_wep_hidden.log &
# PSK WPS
ip addr add 192.168.9.1/24 dev wlan9
hostapd /root/psk/hostapd_wps.conf > /root/hostapd_wps.log &

echo "ALL SET"