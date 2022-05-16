# WiFiChallenge Lab

```

 __          ___ ______ _    _____ _           _ _                           _           _     
 \ \        / (_)  ____(_)  / ____| |         | | |                         | |         | |    
  \ \  /\  / / _| |__   _  | |    | |__   __ _| | | ___ _ __   __ _  ___    | |     __ _| |__  
   \ \/  \/ / | |  __| | | | |    | '_ \ / _` | | |/ _ \ '_ \ / _` |/ _ \   | |    / _` | '_ \ 
    \  /\  /  | | |    | | | |____| | | | (_| | | |  __/ | | | (_| |  __/   | |___| (_| | |_) |
     \/  \/   |_|_|    |_|  \_____|_| |_|\__,_|_|_|\___|_| |_|\__, |\___|   |______\__,_|_.__/ 
                                                               __/ |                           
                                                              |___/                            

```

Virtualized WiFi pentesting laboratory without the need for physical WiFi cards, using mac80211_hwsim and [vwifi](https://github.com/Raizo62/vwifi) proyect.

The competitive CTF began on March 11 and ends on May 15, 2022. Then the laboratory will continue to be active but giving less points.

## VM System Requirements
- 4 gb de RAM (6gb recommended)
- 4 CPUs
- Virtualize Intel VT-x/EPT or AMD-V/RVI enabled

## Download VMDK for VMWare only

- [Google](https://drive.google.com/drive/folders/1LNRPPmOg-BfyoCeSdtudNjLXyvPraUdR?usp=sharing)

* * *

## Telegram channel

- [WiFiChallenge Lab Telegram Channel ](https://t.me/+xn6oahuS9hJlODU0)

* * *

## VMDK Usage

- Download VMDK from mega
- Import VMDK in VMWare
- Read the IMPORTANT INTRUCCTIONS
- Check that the Wi-Fi networks to be audited can be seen from the VM
- If there is any problem exec restartVM.sh script
- Go to Challenges list

* * *

## Challenges 
 
 
 
- https://wifichallengelab.com/challenges

* * *

## IMPORTANT INTRUCCTIONS

- You can't see you own traffic with airodump-ng (if you have airodump and mount an AP you won't see it)
- User/pass:
    - ***user/toor*** (use this to login)
- The VMs starts automatically to the snapshot. In case of error use the home script:
    - ***restartVM.sh*** to restart and restore
- All tools are in ***/root/tools*** folder
- All bruteforce can be done using ***rockyou***
- The maximum ***waiting*** time between automations, connections, etc. is ***5 min*** approx.
- The numbering of the challenges is indicative, if a ***challenge is unlocked it can be done*** regardless of the order.
- All necessary tools for the lab are installed, but others can be installed.
- ***If you fail a challenge until you run out of attempts, you can block the following challenges. Don't answer the flag randomly.***
- Enable nested VT-x / AMD-V on VMWare host if not enabled
- Scope
    - "wifi-guest"
    - "wifi-mobile"
    - "wifi-corp"
    - "wifi-regional"
    - "wifi-global"
    - "wifi-admin"
    - "wifi-office"
    - Hidden network: &lt;length: 14&gt;

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

## For Beginners

### READ:

- https://github.com/koutto/pi-pwnbox-rogueap/wiki
- https://book.hacktricks.xyz/pentesting/pentesting-network/wifi-attacks

### Recommended tools
- [wifi_db](https://github.com/raulcalvolaorden/wifi_db)
- [aircrack-ng](https://www.aircrack-ng.org/)
- [airgeddon](https://github.com/v1s1t0r1sh3r3/airgeddon)
- [eaphammer](https://github.com/s0lst1c3/eaphammer)
- [hashcat](https://hashcat.net/hashcat/)

### Pentester Academy videos

- [Wi-Fi Attack-Defense: Wi-Fi Network Reconnaissance](https://www.youtube.com/watch?v=G9cmm5RF6k8)
- [Wi-Fi Attack-Defense Wi-Fi Network Reconnaissance II](https://www.youtube.com/watch?v=38ENuafvPxY)
- [Wi-Fi Security: AP-less WPA2-PSK Cracking](https://www.youtube.com/watch?v=8FUqSFrsq7E)
- [WiFi Security: Mana: Attacking TTLS-MSCHAPv2](https://www.youtube.com/watch?v=FJqHFMW4aj8)
- [Pivoting over WiFi: PEAP Relay Attack](https://www.youtube.com/watch?v=74EB3N6yShI)
- [Wi-Fi Security: Pivoting over WiFi: PEAP Relay](https://www.youtube.com/watch?v=3FSLM1VY0SQ)
- [Wi-Fi Security: Mana: Attacking PEAP-MSCHAPv2](https://www.youtube.com/watch?v=pUJZq4DJM8c)
- [Wi-Fi Security: Evil Twin - WPA Enterprise (Mana)](https://www.youtube.com/watch?v=O1gOYoyTHU0)


### Change keyboard layaout

- Spanish
``` bash
setxkbmap es 
```
- American English
``` bash
setxkbmap us 
```

* * *

## References

- https://github.com/koutto/pi-pwnbox-rogueap/wiki
- https://github.com/s0lst1c3/eaphammer/wiki
- https://www.aircrack-ng.org/doku.php
- https://www.cellstream.com/reference-reading/tipsandtricks/410-3-ways-to-put-your-wi-fi-interface-in-monitor-mode-in-linux
- https://wiki.netbsd.org/tutorials/how_to_use_wpa_supplicant/
- https://w1.fi/cgit/hostap/plain/hostapd/hostapd.conf
- https://wiki.innovaphone.com/index.php?title=Howto:802.1X_EAP-TLS_With_FreeRadius

* * *

## Walkthrough

The Walkthrough is available here: https://wifichallengelab.com/walkthrough

* * *

## Author

- [Raúl Calvo Laorden](https://github.com/raulcalvolaorden/)

## Donations

- https://paypal.me/RaulCalvoLaorden
