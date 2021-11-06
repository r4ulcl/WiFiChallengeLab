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
    - [References](#references)
    - [Walkthrough](#walkthrough)
    - [Manual create VM](#manual-create-vm)
    - [TODO](#todo)

## Download OVA

#### OVA VirtualBox

- [https://mega.nz/folder/rRAHiCbB#sYX\_JeqH5IOhZ\_WRPJnGmg/](https://mega.nz/folder/rRAHiCbB#sYX_JeqH5IOhZ_WRPJnGmg/)

#### OVA VMWare TODO

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

## Challenges 


* * *

## IMPORTANT INTRUCCTIONS

- You can't see you own traffic with airodump-ng (if you have airodump and mount an AP you won't see it)
- User/pass:
    - ***user/toor*** (use this to login)
    - root/toor
- The VMs starts automatically to the snapshot. In case of error use the home script:
    - ***restartVM.sh*** to restart and restore
- All tools are in ***/root/tools*** folder
- All bruteforce can be done using ***rockyou***
- The maximum ***waiting*** time between automations, connections, etc. is ***5 min*** approx.
- The numbering of the challenges is indicative, if a ***challenge is unlocked it can be done*** regardless of the order.
- All necessary tools for the lab are installed, but others can be installed.
- If you fail a challenge until you run out of attempts, you can block the following challenges. Don't answer the flag randomly.
- Enable nested VT-x / AMD-V on Virtualbox host if not enabled
- Scope
    - "wifi-guest"
    - "wifi-mobile"
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

Run restartVM.sh in $HOME folder, if the problem persists, ask in the telegram group.

* * *

## References

- https://github.com/koutto/pi-pwnbox-rogueap/wiki
- https://github.com/s0lst1c3/eaphammer/wiki
- https://www.aircrack-ng.org/doku.php
- https://www.cellstream.com/reference-reading/tipsandtricks/410-3-ways-to-put-your-wi-fi-interface-in-monitor-mode-in-linux
- https://wiki.netbsd.org/tutorials/how_to_use_wpa_supplicant/
- https://w1.fi/cgit/hostap/plain/hostapd/hostapd.conf
- https://github.com/s0lst1c3/eaphammer/wiki
- https://wiki.innovaphone.com/index.php?title=Howto:802.1X_EAP-TLS_With_FreeRadius

* * *

## Walkthrough

The Walkthrough will be available from January 1, 2022, along with the code to create the VM.
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
- [ ] Fix CPU AMD (new snapshot)