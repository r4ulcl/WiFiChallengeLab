# Install all VMs

I've used "debian-11.3.0-amd64-netinst.iso"

- Your machine with VMWare
    
    - VM Debian with VirtualBox (Install GUI)
        - VM Debian AP: 'WiFiChallengeAPs'
        - VM Debian clients: 'WiFiChallengeClients'
- Allow nest VT-x/AMD-v in the HOST VM
    
- Set the nested VM in Bridge mode to share IP range. 
    
- You can create one Debian VM and clone it.

# Install dependencies.

## Host

The host network must be 192.168.190.15/24, using NAT or a custom NAT Network and the internal VM use bridge. 

```bash
cd /root/
git clone https://github.com/RaulCalvoLaorden/WiFiChallengeLab
cd WifiLab/install
bash installHost.sh
cd /root
bash WifiLab/installTools.sh
```

## Web server on VM Host

To get the scripts the best way is to mount an HTTP server in the VM Host with:

```bash
cd /root/WifiLab/install
sudo service apache2 stop
python3 -m http.server 80
```

## APs VM (used 1.6G)

Name: WiFiChallengeAPs

```bash
#ip addr add 192.168.190.14/24 dev enp0s3 
wget 192.168.190.15/APs/installAPs.sh
bash installAP.sh
```

## Clients VM (used 1.4G)

Name: WiFiChallengeClients

```bash
#ip addr add 192.168.190.16/24 dev enp0s3 
wget 192.168.190.15/Clients/installClients.sh
bash installClients.sh
```

## Before export OVA

- Delete history and instalation data from VM Host. 
- Umount any disk from the VM
- rm /home/user/.cache/vmware/drag_and_drop/
- Check the name of the VM are the correct
- Remove the USB 3.0 support
- Exec ```zerofree /dev/sda1``` in the VM and ``` VBoxManage modifyhd my.vdi –compact``` in the host 
    - https://www.decodednode.com/2020/11/using-zerofree-to-reduce-ubuntudebian.html
    - sudo e4defrag /
    - dd if=/dev/zero of=wipefile bs=1M; sync; rm wipefile
    - sudo vmware-toolbox-cmd disk shrinkonly
# Installation code explanation

##  Generic

- All VM has:
    - a install<NAME>.sh to install all ependenies and tools needed. 
    - a start<NAME>.sh script to exec on start. 

## Host

- The instalHost.sh script installs:
    - 

## APs

- The instalAPs.sh script installs:
    - 

- In the are the hostapd config files for each AP organized by type. 
- The HTML folder contains all the Apache files for the APs (Router login) with different passwords and answers for each network and user/password

## Clients

- The instalClients.sh script installs:
    - 
