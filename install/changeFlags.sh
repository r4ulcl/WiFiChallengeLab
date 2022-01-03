#!/bin/bash
# Script to change the flags of the GitHub project to new ones, to avoid copy-paste

# TODO New challenges order and TEST

F1='10:F9:6F:8A:18:33'
F2='5220'
F3='wifi-office'
F4='administracion'
F5='MAC filtering'
F61='Jyl1iq8UajZ1fAK'
F62='5LqwwccmTg6C38y'
F71='1a2b3c4d5a'
F72='1a:2b:3c:4d:5a'

F8='starwars'
F9='192.168.2.0\/24'
F10='OKRlcefknkCAI0yc557'
F111='z39kTesr7hzghaY'
F112='uTJTGWAbpnxb6aO'
F12='password1'
F13='UltraSecret-P@ssword!_@#'
F14='CONTOSOLABLAB'
F15='ca@WiFiChallenge.ca.es'
#F16=''
F17='Secret!'
F18='babygirl'
F19='oracle' #change other word
F20='F4G6$%2f2g4ss'
F21='secretsCA'
F22='SuperSecure-@!@'
F23='WnIlomDsedsOj5I5AQzG0ZoMIhmJIJeejksyma14'
#F24=''

find . -type f -exec sed -i "s/10:F9:6F:BA:18:22/$F1/g" {} \;
find . -type f -exec sed -i "s/5220/$F2/g" {} \;
find . -type f -exec sed -i "s/wifi-oficina/$F3/g" {} \;
find . -type f -exec sed -i "s/administracion/$F4/g" {} \;
find . -type f -exec sed -i "s/MAC filtering/$F5/g" {} \;
find . -type f -exec sed -i "s/Jyl1iq8UajZ1fEK/$F61/g" {} \;
find . -type f -exec sed -i "s/5LqwwccmTg6C39y/$F62/g" {} \;
#Client isolation
#ap_isolate=1
#if [[ $F7 == "YES" ]]; then
#   echo 'ap_isolate=1' >> .APs/open/hostapd_open.conf
#fi
find . -type f -exec sed -i "s/1a2b3c4d5e/$F71/g" {} \;
find . -type f -exec sed -i "s/1a:2b:3c:4d:5e/$F72/g" {} \;
find . -type f -exec sed -i "s/starwars/$F8/g" {} \;
find . -type f -exec sed -i "s/192.168.2.0\/24/$F9/g" {} \;
find . -type f -exec sed -i "s/OKRlcefknkCAI0yc547/$F10/g" {} \;
find . -type f -exec sed -i "s/z39kTesr7hzgh9Y/$F111/g" {} \;
find . -type f -exec sed -i "s/uTJTGWAbpnxb6uO/$F112/g" {} \;
find . -type f -exec sed -i "s/password1/$F12/g" {} \;
find . -type f -exec sed -i "s/UltraSecretP@ssword!_@#/$F13/g" {} \;
find . -type f -exec sed -i "s/CONTOSO/$F14/g" {} \;
find . -type f -exec sed -i "s/ca@WiFi.ca.es/$F15/g" {} \;
#find . -type f -exec sed -i "s//$F16/g" {} \;
find . -type f -exec sed -i "s/Secret!/$F17/g" {} \;
find . -type f -exec sed -i "s/babygirl/$F18/g" {} \;
find . -type f -exec sed -i "s/oracle/$F19/g" {} \;
find . -type f -exec sed -i "s/F4G6$%2f2g4hs/$F20/g" {} \;
find . -type f -exec sed -i "s/secretCA/$F21/g" {} \;
find . -type f -exec sed -i "s/SuperSecure@!@/$F22/g" {} \;
find . -type f -exec sed -i "s/WnIlomDsedsOj5I5AQzG0ZoMIhmJIJeejksyma64/$F23/g" {} \;
#find . -type f -exec sed -i "s//$F24/g" {} \;

# Change APs ESSID 
OPN='wifi-guest'

WEP=$F4

WPA='wifi-mobile'
WPS='wifi-admin'
OTHER0='MOVISTAR_JYG2'
OTHER1='WIFI-JUAN'
OTHER2='vodafone7123'
OTHER3='MiFibra-5-D6G3'

MGT='wifi-corp'
RELAY='wifi-regional'
TLS='wifi-global'


sed -i "s/wifi-guest/$OPN/g" ./APs/open/hostapd_open.conf

sed -i "s/administracion/$WEP/g" ./APs/wep/hostapd_wep_hidden.conf

sed -i "s/wifi-mobile/$WPA/g" ./APs/psk/hostapd_wpa.conf
sed -i "s/wifi-admin/$WPS/g" ./APs/psk/hostapd_wps.conf
sed -i "s/MOVISTAR_JYG2/$OTHER0/g" ./APs/psk/hostapd_other0.conf
sed -i "s/WIFI-JUAN/$OTHER1/g" ./APs/psk/hostapd_other1.conf
sed -i "s/vodafone7123/$OTHER2/g" ./APs/psk/hostapd_other2.conf
sed -i "s/MiFibra-5-D6G3/$OTHER3/g" ./APs/psk/hostapd_other3.conf

sed -i "s/wifi-corp/$MGT/g" ./APs/mgt/hostapd-wpe.conf
sed -i "s/wifi-regional/$RELAY/g" ./APs/mgt/hostapd-wpe-relay.conf
sed -i "s/wifi-global/$TLS/g" ./APs/mgt/hostapd-wpe-tls.conf

cd certs
bash createCert.sh
cd ..