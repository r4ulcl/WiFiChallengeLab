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
    - [First steps (OVA Usage)](#first-steps-ova-usage)
    - [Tasks](#tasks)
    - [IMPORTANT INTRUCCTIONS](#important-intrucctions)
    - [FAQ](#faq)
        - [From where are the attacks carried out?](#from-where-are-the-attacks-carried-out)
        - [Where are the tools?](#where-are-the-tools)
        - [Do I have to do something when I turn on the VM to start?](#do-i-have-to-do-something-when-i-turn-on-the-vm-to-start)
        - [What to do if there are problems with some AP or clients?](#what-to-do-if-there-are-problems-with-some-ap-or-clients)
    - [Solutions TODO](#solutions-todo)
    - [Manual create VM](#manual-create-vm)
    - [TODO](#todo)

## Download OVA

### OVA VirtualBox

- [https://mega.nz/folder/rRAHiCbB#sYX\_JeqH5IOhZ\_WRPJnGmg/](https://mega.nz/folder/rRAHiCbB#sYX_JeqH5IOhZ_WRPJnGmg/)

### OVA VMWare TODO

- URL TODO

* * *

## First steps (OVA Usage)

- Download OVA from mega
- Import OVA in VMWare or VirtualBox
- Read the IMPORTANT INTRUCCTIONS
- Check that the Wi-Fi networks to be audited can be seen from the VM
- If there is any problem exec restartVM.sh script
- Go to Challenges list

* * *

## Tasks

- [MarkDown](/C:/Users/user/AppData/Local/Programs/Joplin/resources/app.asar/WifiLab%20Tasks/WifiLab%20Tasks.md "WifiLab%20Tasks/WifiLab%20Tasks.md")
- [HTML](/C:/Users/user/AppData/Local/Programs/Joplin/resources/app.asar/WifiLab%20Tasks/WifiLab%20Tasks.html "WifiLab%20Tasks/WifiLab%20Tasks.html")

* * *

## IMPORTANT INTRUCCTIONS

- You can't see you own traffic with airodump-ng (if you have airodump and mount an AP you won't see it)
- User/pass:
    - user/toor
    - root/toor
- The VMs starts automatically to the snapshot. In case of error use the home script:
    - restartVM.sh to restart and restore
- All tools are in /root/tools folder
- All bruteforce can be done using rockyou
- All necessary tools for the lab are installed, but others can be installed.
- Enable nested VT-x / AMD-V on Virtualbox host if not enabled
- Scope
    - "wifi-guest"
    - "wifi-moviles"
    - "wifi-corp"
    - "wifi-regional"
    - "wifi-global"
    - "wifi-admin"
    - "wifi-oficina"
    - Hidden network: &lt;length: 13&gt;

* * *

## FAQ

### From where are the attacks carried out?

All attacks are made from the Debian VM

### Where are the tools?

They are in $HOME/tools

### Do I have to do something when I turn on the VM to start?

No, everything runs automatically.

### What to do if there are problems with some AP or clients?

Run restartVM.sh in $HOME folder

* * *

## Walkthrough TODO

- The Walkthrough will be available from January 1, 2022. 

Please do not share or post any Walkthrough or challenge solutions until that date.

* * *

## Manual create VM

If you want to create the VM manually click [here](https://github.com/RaulCalvoLaorden/WifiLab/blob/main/install/README.md)

* * *

## TODO

- [ ] Walkthrough
- [x] Upload VM
- [x] MGT TLS AP
- [x] Client other WPA
- [x] WPS
- [x] HTTP Server with simple login
- [x] AutoStart Vm in headless
- [x] Tools in /root/tools and ln -s to /home/user
- [x] WEP Web server with flag username ESSID, password WEP password
- [x] Brute force MGT
- [x] Web server different each AP (check IP)
- [ ] WPA3
- [ ] krackattacks < 2.6-r1
- [ ] Decrypt WPA-EAP
- [ ] Phishing RogueAP
- [ ] Real captive portal in OPN
- [ ] Fix CPU AMD (new snapshot?)