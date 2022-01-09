# Hacking tools

FOLDER=`pwd`
mkdir tools
TOOLS=$FOLDER/tools

#kali repo
#echo 'deb http://http.kali.org/kali kali-rolling main contrib non-free
#deb http://old.kali.org/kali moto main non-free contrib
#' >> /etc/apt/sources.list.d/kali.list
gpg --keyserver hkp://keys.gnupg.net --recv-key ED444FF07D8D0BF6
gpg -a --export ED444FF07D8D0BF6 | sudo apt-key add -
sudo apt update


# EAP Buster -> List auth methods WPA-EAP
#sudo sh -c 'echo $USER' get user from sh
# if [ "$EUID" -ne 0 ]
#user@host:~$ bash test.sh 
#	${USER}: user
#	"$EUID": 1000
#user@host:~$ sudo bash test.sh 
#	${USER}: root
#	"$EUID": 0
#user@host:~$ su
#Password: 
#root@host:/home/user# bash test.sh 
#	${USER}: user
#	"$EUID": 0

# Python
cd $TOOLS
curl -O https://www.python.org/ftp/python/3.8.2/Python-3.8.2.tar.xz
tar -xf Python-3.8.2.tar.xz
cd Python-3.8.2
./configure --enable-optimizations
make -j 4
sudo make altinstall
python3.8 --version


# EAP_buster
cd $TOOLS
git clone https://github.com/blackarrowsec/EAP_buster

#hcxtools
git clone https://github.com/ZerBea/hcxtools.git
cd hcxtools
make 
sudo make install
cd ..

#wifi_db
cd $TOOLS
sudo apt install python3-pip -y
sudo apt install tshark -y
git clone https://github.com/RaulCalvoLaorden/wifi_db
cd wifi_db
pip3 install -r requirements.txt 

# pcapFilter.sh
cd $TOOLS
wget https://gist.githubusercontent.com/RaulCalvoLaorden/f3470f097d1cd21dbc5a238883e79fb2/raw/pcapFilter.sh
chmod +x pcapFilter.sh

#Eaphhammer
cd $TOOLS
git clone https://github.com/s0lst1c3/eaphammer.git
cd eaphammer
for L in `cat kali-dependencies.txt` ; do echo $L; apt install $L -y ;done
apt install dsniff apache2 -y
sudo apt-get install build-essential libssl-dev libffi-dev python-dev -y
sudo apt-get install python-openssl python3-openssl -y
./kali-setup
pip3 install flask flask_cors flask_socketio pywebcopy

#hostapd-wpe
cd $TOOLS
# https://github.com/aircrack-ng/aircrack-ng/tree/master/patches/wpe/hostapd-wpe
wget https://raw.githubusercontent.com/aircrack-ng/aircrack-ng/master/patches/wpe/hostapd-wpe/hostapd-2.9-wpe.patch
wget https://w1.fi/releases/hostapd-2.9.tar.gz
tar -zxf hostapd-2.9.tar.gz
cd hostapd-2.9
patch -p1 < ../hostapd-2.9-wpe.patch
cd hostapd

make
make install
make wpe

cd /etc/hostapd-wpe/certs
./bootstrap
make install

#aircrack
apt install aircrack-ng -y

# Creap
cd $TOOLS
git clone https://github.com/Snizz/crEAP
#Arp-scan
apt install arp-scan -y








#airgeddon
sudo apt install tshark john lighttpd pixiewps isc-dhcp-server reaver crunch -y
sudo apt install asleap bettercap ettercap-text-only hcxtools hcxdumptool bully mdk4 beef-xss -y
cd $TOOLS
git clone --depth 1 https://github.com/v1s1t0r1sh3r3/airgeddon.git
cd airgeddon
#sudo bash airgeddon.sh


#hostapd-mana
apt-get --yes install build-essential git libnl-genl-3-dev libssl-dev build-essential pkg-config git libnl-genl-3-dev libssl-dev 
apt-get install mana-toolkit -y

cd $TOOLS
git clone https://github.com/sensepost/hostapd-mana
cd hostapd-mana
make -C hostapd -j 4

sudo ln -s /root/tools/hostapd-mana/hostapd/hostapd /usr/bin/hostapd-mana

#eapeak
cd $TOOLS
sudo apt install python-dev libssl-dev swig python3-dev gcc python-m2crypto -y
sudo pip3 install pipenv

#pip2 install m2crypto
git clone https://github.com/securestate/eapeak
cd eapeak
pipenv --two install
#pipenv shell

# Reaver
cd $TOOLS
git clone https://github.com/t6x/reaver-wps-fork-t6x
cd reaver-wps-fork-t6x*
cd src
./configure
make
sudo make install

# wpa_sycophant
cd $TOOLS
git clone https://github.com/sensepost/wpa_sycophant
cd wpa_sycophant/
make -C wpa_supplicant -j 4


# berate_ap
cd $TOOLS
git clone https://github.com/sensepost/berate_ap

#MD4
apt-get install pkg-config libnl-3-dev libnl-genl-3-dev libpcap-dev 
cd $TOOLS
git clone https://github.com/aircrack-ng/mdk4
cd mdk4
make
sudo make install

#Air-hammer
cd $TOOLS
git clone https://github.com/Wh1t3Rh1n0/air-hammer
cd air-hammer
curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output get-pip.py
sudo python2 get-pip.py
pip2 install wpa_supplicant
pip2 install service_identity
 
#create_ap
#disable_hotspot.sh
#evilTrust
#pcap2csv
#pinecone
#start_hotspot.sh

#wifipumpkin3

chown -R user $TOOLS
ln -s $TOOLS /home/user/tools

