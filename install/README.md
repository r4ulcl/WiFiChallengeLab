# Install all VMs

I've used "debian-10.9.0-amd64-netinst.iso"

- Your machine with VirtualBox
    
    - VM Debian with VirtualBox (Install GUI)
        - VM Debian AP
        - VM Debian clients
- Allow nest VT-x/AMD-v in the HOST VM
    
- Set the nested VM in Bridge mode to share IP range. 
    
- You can create one Debian VM and clone it.

# Install dependencies.

## Host

```bash
cd /root/
git clone https://github.com/RaulCalvoLaorden/WifiLab
cd WifiLab/install
sh installHost.sh
```

## Web server

To get the scripts the best way is to mount an HTTP server in the VM Host with:

```bash
cd /root/WifiLab/install
sudo service apache2 stop
python3 -m http.server 80
```

## APs

```bash
wget 10.0.2.15/APs/installAPs.sh
bash installAP.sh
```

## Clients

```bash
wget 10.0.2.15/Clients/installClients.sh
bash installClients.sh

```