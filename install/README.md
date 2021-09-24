# Install all VMs

I've used "debian-10.9.0-amd64-netinst.iso"

- Your machine with VirtualBox
    
    - VM Debian with VirtualBox (Install GUI)
        - VM Debian AP: 'WifiLabAPs'
        - VM Debian clients: 'WifiLabClients'
- Allow nest VT-x/AMD-v in the HOST VM
    
- Set the nested VM in Bridge mode to share IP range. 
    
- You can create one Debian VM and clone it.

# Install dependencies.

## Host

```bash
cd /root/
git clone https://github.com/RaulCalvoLaorden/WifiLab
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

## APs VM

```bash
wget 10.0.2.15/APs/installAPs.sh
bash installAP.sh
```

## Clients VM

```bash
wget 10.0.2.15/Clients/installClients.sh
bash installClients.sh
```

## Before export OVA

- Dele history and instalation data from VM Host. 
- Umount any disk from the VM
- Check the name of the VM are the correct
- Remove the USB 3.0 support


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