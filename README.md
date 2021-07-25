# WifiLab

```
 __      __.__  _____.__.____          ___.    
/  \    /  \__|/ ____\__|    |   _____ \_ |__  
\   \/\/   /  \   __\|  |    |   \__  \ | __ \ 
 \        /|  ||  |  |  |    |___ / __ \| \_\ \
  \__/\  / |__||__|  |__|_______ (____  /___  /
       \/                       \/    \/    \/ 
```

Virtualized WiFi pentesting laboratory without the need for physical WiFi cards, using mac80211_hwsim using https://github.com/Raizo62/vwifi proyect.

- [WifiLab](#wifilab)
    - [Download OVA](#download-ova)
        - [OVA VirtualBox](#ova-virtualbox)
        - [OVA VMWare TODO](#ova-vmware-todo)
    - [OVA Usage](#ova-usage)
    - [Tasks](#tasks)
    - [Solutions TODO](#solutions-todo)
    - [Manual create VM](#manual-create-vm)
- [FAQ](#faq)
    - [From where are the attacks carried out?](#from-where-are-the-attacks-carried-out)
    - [Where are the tools?](#where-are-the-tools)
    - [What to do if there are problems with some AP or clients?](#what-to-do-if-there-are-problems-with-some-ap-or-clients)
- [TODO](#todo)

## Download OVA

### OVA VirtualBox

- https://mega.nz/folder/rRAHiCbB#sYX_JeqH5IOhZ_WRPJnGmg/

### OVA VMWare TODO

- URL TODO

## OVA Usage

- Import OVA in VMWare or VirtualBox
- Go to Task list
- Read the IMPORTANT INTRUCCTIONS
- If there is any problem exec restartVM.sh script

## Tasks

- [MarkDown](./WifiLab%20Tasks/WifiLab%20Tasks.md "WifiLab%20Tasks/WifiLab%20Tasks.md")
- [HTML](./WifiLab%20Tasks/WifiLab%20Tasks.html "WifiLab%20Tasks/WifiLab%20Tasks.html")

## Solutions TODO

- MarkDown
- HTML

## Manual create VM

If you want to create the VM manually click [here](./install/README.md "install/README.md")

# FAQ

## From where are the attacks carried out?

All attacks are made from the Debian VM

## Where are the tools?

They are in $HOME/tools

## Do I have to do something when I turn on the VM to start?

No, everything runs automatically.

## What to do if there are problems with some AP or clients?

Run restartVM.sh in $HOME folder

# TODO

- [ ] Walkthrough
- [ ] Upload VM
- [x] MGT TLS AP
- [x] Client other WPA
- [x] WPS
- [x] HTTP Server with simple login
- [x] AutoStart Vm in headless
- [ ] Tools in /root/tools and ln -s to /home/user
- [x] WEP Web server with flag username ESSID, password WEP password
- [x] Brute force MGT
- [x] Web server different each AP (check IP)
- [ ] WPA3
- [ ] krackattacks < 2.6-r1
- [ ] Decrypt WPA-EAP
- [ ] Phishing RogueAP
- [ ] Real captive portal in OPN
- [ ] Fix CPU AMD