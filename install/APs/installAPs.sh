#!/bin/bash
apt update
apt install macchanger -y
apt install sudo  iw aircrack-ng libcurl4-openssl-dev curl libz-dev module-assistant libssl-dev libnl-genl-3-dev libnl-3-dev pkg-config libsqlite3-dev git hostapd dnsmasq -y
apt install make g++ libnl-3-dev libnl-genl-3-dev -y
apt install apache2 php  -y
apt-get install wpasupplicant -y

# Git vwifi
git clone https://github.com/Raizo62/vwifi
cd vwifi
make
make tools # To change the file mode bits of tools
sudo make install


cd /root

# Hostapd
# https://github.com/aircrack-ng/aircrack-ng/tree/master/patches/wpe/hostapd-wpe
wget https://raw.githubusercontent.com/aircrack-ng/aircrack-ng/master/patches/wpe/hostapd-wpe/hostapd-wpe.patch
wget https://w1.fi/releases/hostapd-2.9.tar.gz
tar -zxf hostapd-2.9.tar.gz
cd hostapd-2.9
patch -p1 < ../hostapd-wpe.patch 
cd hostapd

make
make install
make wpe

cd /etc/hostapd-wpe/certs
./bootstrap
make install



# Hostapd config PSK!!
cd /root
wget -nH -r --no-parent http://10.0.2.15/APs/psk/

# Open
cd /root
wget -nH -r --no-parent http://10.0.2.15/APs/open/

# WEP
cd /root
wget -nH -r --no-parent http://10.0.2.15/APs/wep/

# MGT
cd /root
wget -nH -r --no-parent http://10.0.2.15/APs/mgt/

mkdir /root/mgt/
cd /root/mgt/
wget -nH -r --no-parent http://10.0.2.15/certs
cd certs
make install

cd
cp APs/* . -r

# DNSMASQ
echo '
server=8.8.8.8
server=8.8.4.4

dhcp-option=3 #Disable default router gateway
#dhcp-option=6 # Disables DNS

dhcp-host=wlan0,F0:9F:C2:71:22:00,192.168.0.1
dhcp-range=192.168.0.2,192.168.0.100,24h

dhcp-host=wlan1,F0:9F:C2:71:22:11,192.168.1.1
dhcp-range=192.168.1.2,192.168.1.100,24h

dhcp-host=wlan2,F0:9F:C2:71:22:22,192.168.2.1
dhcp-range=192.168.2.2,192.168.2.100,24h

dhcp-host=wlan7,F0:9F:C2:71:22:77,192.168.7.1
dhcp-range=192.168.7.2,192.168.7.100,24h
' >> /etc/dnsmasq.conf

# Config autoStart
echo '#!/bin/sh -e

nohup /root/startAPs.sh &

exit 0
' >>  /etc/rc.local
chmod 755 /etc/rc.local

cd /root
wget 10.0.2.15/APs/startAPs.sh
chmod +x /root/startAPs.sh

cd /root
wget 10.0.2.15/checkVWIFI.sh
chmod +x /root/checkVWIFI.sh

export PATH=$PATH:/sbin

cd 
rm -r /var/www/html
wget -nH -r --no-parent http://10.0.2.15/APs/html/
cp -r APs/html/ /var/www/

# CA To web
mkdir -p  /var/www/html/secretCA/
cp /root/mgt/certs/ca.crt /var/www/html/secretCA/ca.crt.txt
split -l 15  /root/mgt/certs/ca.key /var/www/html/secretCA/ca.key.txt. -a1
cp /root/mgt/certs/ca.serial /var/www/html/secretCA/ca.serial.txt
cp /root/mgt/certs/server.crt /var/www/html/secretCA/server.crt.txt
split -l 15 /root/mgt/certs/server.key /var/www/html/secretCA/server.key.txt. -a1
cp /etc/hostapd-wpe/dh /var/www/html/secretCA/dh.txt

chown -R www-data:www-data /var/www/html/
rm /var/www/html/index.html

#WPS
touch /var/run/hostapd_wps_pin_requests

service apache2 start