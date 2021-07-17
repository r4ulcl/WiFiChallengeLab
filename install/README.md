# Install all VMs

I've used "debian-10.9.0-amd64-netinst.iso"

- Your machine with VirtualBox
    
    - VM Debian with VirtualBox (Install GUI)
        - VM Debian AP
        - VM Debian clients
- Allow nest VT-x/AMD-v in the HOST VM
    
- To avoid IP problems create new NAT on other range in HOST 10.1.2.0/24
    
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
python -m SimpleHTTPServer 80
```

## APs

```bash
wget 10.0.2.2/installAPs.sh
bash installAP.sh
```

## Clients

```bash
wget 10.0.2.2/installClients.sh
bash installClients.sh

```