#!/bin/bash
date >> /root/date.log

sleep 5

sudo modprobe mac80211_hwsim radios=12


macchanger -m 10:F9:6F:07:6C:00 wlan0
macchanger -m 10:F9:6F:BA:6C:11 wlan1
macchanger -m 10:F9:6F:BA:18:22 wlan2

macchanger -m 28:6C:07:6F:F9:33 wlan3
macchanger -m 28:6C:07:6F:F9:44 wlan4

macchanger -m B4:99:BA:6F:F9:55 wlan5
macchanger -m 78:C1:A7:BF:72:66 wlan6

macchanger -m 80:18:44:BF:72:77 wlan7
macchanger -m B0:72:BF:B0:78:88 wlan8
macchanger -m B0:72:BF:44:B0:99 wlan9

macchanger -m 10:F9:6F:AC:53:10 wlan10

sleep 5

vwifi-client 10.0.2.15 > /root/vwifi-client.log &

sleep 15

# WPA SUPPLICANT OUPUT TO FILE

# MGT .0
sudo wpa_supplicant -Dnl80211 -iwlan0 -c /root/mgtClient/wpa_mschapv2.conf > /root/wpa_supplicantMSCHAP.log & 
sudo wpa_supplicant -Dnl80211 -iwlan1 -c /root/mgtClient/wpa_gtc.conf  > /root/wpa_supplicantGTC.log &

sudo wpa_supplicant -Dnl80211 -iwlan10 -c /root/mgtClient/wpa_mschapv2_relay.conf > /root/wpa_supplicantMSCHAP_relay.log & 

# MGT client TLS .7
sudo wpa_supplicant -Dnl80211 -iwlan2 -c /root/mgtClient/wpa_TLS.conf > /root/wpa_supplicantTLS.log &


# PSK .2
sudo wpa_supplicant -Dnl80211 -iwlan3 -c /root/pskClient/wpa_psk.conf > /root/wpa_supplicantPSK3.log &
sudo wpa_supplicant -Dnl80211 -iwlan4 -c /root/pskClient/wpa_psk.conf > /root/wpa_supplicantPSK4.log &

sudo wpa_supplicant -Dnl80211 -iwlan5 -c /root/pskClient/wpa_psk_noAP.conf > /root/wpa_supplicantNoAP5.log &
sudo wpa_supplicant -Dnl80211 -iwlan6 -c /root/pskClient/wpa_psk_noAP.conf > /root/wpa_supplicantNoAP6.log &

# OPEN .1
sudo wpa_supplicant -Dnl80211 -iwlan7 -c /root/openClient/open_supplicant.conf > /root/wpa_supplicantOpen7.log &
sudo wpa_supplicant -Dnl80211 -iwlan8 -c /root/openClient/open_supplicant.conf > /root/wpa_supplicantOpen8.log &
sudo wpa_supplicant -Dnl80211 -iwlan9 -c /root/openClient/open_supplicant.conf > /root/wpa_supplicantOpen9.log &

sleep 30

ping 192.168.0.1 > /dev/nill &
ping 192.168.1.1 > /dev/nill &
ping 192.168.2.1 > /dev/nill &
ping 192.168.3.1 > /dev/nill &
ping 192.168.4.1 > /dev/nill &

bash /root/cronClients.sh > /root/cronClients.log &

bash /root/checkVWIFI.sh > /root/checkVWIFI.log &

echo "ALL SET"
