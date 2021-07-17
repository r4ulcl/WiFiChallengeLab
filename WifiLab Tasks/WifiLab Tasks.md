# WifiLab Tasks

- [WifiLab Tasks](#wifilab-tasks)
    - [Introduction](#introduction)
        - [IMPORTANT INTRUCCTIONS](#important-intrucctions)
        - [Scope](#scope)
        - [References](#references)
    - [Recon](#recon)
        - [List all client MACs](#list-all-client-macs)
        - [Detect APs information](#detect-aps-information)
        - [Get probes from all users](#get-probes-from-all-users)
        - [Find hidden network ESSID](#find-hidden-network-essid)
    - [Open](#open)
        - [Access to wifi-guest network](#access-to-wifi-guest-network)
        - [Login to the server with users password](#login-to-the-server-with-users-password)
        - [Verify Client isolation](#verify-client-isolation)
    - [WEP](#wep)
        - [Get hidden wifi password](#get-hidden-wifi-password)
    - [PSK](#psk)
        - [Get wifi-moviles password](#get-wifi-moviles-password)
        - [Get users login traffic passively](#get-users-login-traffic-passively)
        - [Login with stolen creds](#login-with-stolen-creds)
        - [Get wifi-oficina AP Password](#get-wifi-oficina-ap-password)
        - [Get wifi-admin AP password](#get-wifi-admin-ap-password)
    - [MGT](#mgt)
        - [Get users login IDs (usernames)](#get-users-login-ids-usernames)
        - [Get cert information](#get-cert-information)
        - [Get EAP methods supported by AP](#get-eap-methods-supported-by-ap)
        - [Get first USER password of wifi-corp](#get-first-user-password-of-wifi-corp)
        - [Get CA from the Router using default creds](#get-ca-from-the-router-using-default-creds)
        - [Get second USER password using the CA](#get-second-user-password-using-the-ca)
        - [Creds Relay](#creds-relay)
        - [Access as GLOBAL\\Adminsitrator](#access-as-globaladminsitrator)
        - [Login to wifi-global Administrator web creds](#login-to-wifi-global-administrator-web-creds)

## Introduction

### IMPORTANT INTRUCCTIONS

- You can't see you own traffic with airodump-ng (if you have airodump and mount an AP you won't see it)
- If the traffic fails or something fails you cant reset the LabAPs or LabClients VM to the snapshot and restart. If you reboot, you have to wait until the "ALL SET" message.
- User/pass:
    - user/toor
    - root/toor
- To manage the VMs use the home scripts:
    - startVM.sh to start
    - stopVM.sh to stop and restore
    - restartVM.sh to restart and restore
- All tools are in /root folder
- All bruteforce can be done with rockyou
- All necessary tools for the lab are installed, but others can be installed.
- Enable nested VT-x / AMD-V on Virtualbox host if not enabled

![75003971b5d131f68cc1a2b21d2aafab.png](:/128cf79224ce452fad138b56734e93c6)

### Scope

- "wifi-guest"
- "wifi-moviles"
- "wifi-corp"
- "wifi-global"
- "wifi-admin"
- "wifi-oficina"
- Hidden network: &lt;length: 13&gt;

### References

- https://github.com/koutto/pi-pwnbox-rogueap/wiki
- https://github.com/s0lst1c3/eaphammer/wiki
- https://www.aircrack-ng.org/doku.php
- https://www.cellstream.com/reference-reading/tipsandtricks/410-3-ways-to-put-your-wi-fi-interface-in-monitor-mode-in-linux
- [https://wiki.netbsd.org/tutorials/how\_to\_use\_wpa\_supplicant/](https://wiki.netbsd.org/tutorials/how_to_use_wpa_supplicant/)
- https://w1.fi/cgit/hostap/plain/hostapd/hostapd.conf
- https://github.com/s0lst1c3/eaphammer/wiki
- [https://wiki.innovaphone.com/index.php?title=Howto:802.1X\_EAP-TLS\_With\_FreeRadius#Creation\_Of\_A\_Client_Certificate](https://wiki.innovaphone.com/index.php?title=Howto:802.1X_EAP-TLS_With_FreeRadius#Creation_Of_A_Client_Certificate)

## Recon

- ### List all client MACs
    
    <details><summary>Hint 1</summary>
    
    - Monitor mode
    
    </details><details><summary>Hint 2</summary>
    
    - airmon-ng / iw
    
    </details><details><summary>Hint 3</summary>
    
    - https://www.aircrack-ng.org/doku.php?id=airmon-ng
    - https://www.aircrack-ng.org/doku.php?id=airodump-ng
    - https://github.com/RaulCalvoLaorden/wifi_db
    
    </details>

* * *

- ### Detect APs information
    
    <details><summary>Hint 1</summary>
    
    - Monitor mode
    
    </details><details><summary>Hint 2</summary>
    
    - airmon-ng / iw
    
    </details><details><summary>Hint 3</summary>
    
    - https://www.aircrack-ng.org/doku.php?id=airmon-ng
    - https://www.aircrack-ng.org/doku.php?id=airodump-ng
    - https://github.com/RaulCalvoLaorden/wifi_db
    
    </details>

* * *

- ### Get probes from all users
    
    <details><summary>Hint 1</summary>
    
    - Monitor mode
    
    </details><details><summary>Hint 2</summary>
    
    - airmon-ng
    
    </details><details><summary>Hint 3</summary>
    
    - https://www.aircrack-ng.org/doku.php?id=airmon-ng
    - https://www.aircrack-ng.org/doku.php?id=airodump-ng
    - https://github.com/RaulCalvoLaorden/wifi_db
    
    </details>

* * *

- ### Find hidden network ESSID
    
    <details><summary>Hint 1</summary>
    
    - Wait to client or bruteforce
    
    </details><details><summary>Hint 2</summary>
    
    - Bruteforce rockyou.txt
    
    </details><details><summary>Hint 3</summary>
    
    - https://github.com/aircrack-ng/mdk4
    
    </details>

* * *

## Open

- ### Access to wifi-guest network
    
    <details><summary>Hint 1</summary>
    
    - Detect error connecting with CLI
    
    </details><details><summary>Hint 2</summary>
    
    - Get client MAC from enum and use it
    
    </details><details><summary>Hint 3</summary>
    
    - https://www.aircrack-ng.org/doku.php?id=airmon-ng
    - https://www.aircrack-ng.org/doku.php?id=airodump-ng
    - https://github.com/RaulCalvoLaorden/wifi_db
    - https://wiki.archlinux.org/title/wpa_supplicant
    - https://manpages.ubuntu.com/manpages/bionic/man1/macchanger.1.html
    
    </details>

* * *

- ### Login to the server with users password
    
    <details><summary>Hint 1</summary>
    
    - Find creds in clear traffic over WiFi
    
    </details><details><summary>Hint 2</summary>
    
    - Fing HTTP traffic on cap
    
    </details><details><summary>Hint 3</summary>
    
    - https://www.wireshark.org/
    
    </details>

* * *

- ### Verify Client isolation
    
    <details><summary>Hint 1</summary>
    
    - Find open ports in other clients
    
    </details><details><summary>Hint 2</summary>
    
    - Scan other clients in net
    
    </details><details><summary>Hint 3</summary>
    
    - https://linux.die.net/man/1/arp-scan
    - https://nmap.org/
    
    </details>

* * *

## WEP

- ### Get hidden wifi password
    
    <details><summary>Hint 1</summary>
    
    - Detect network type and if have any client
    
    </details><details><summary>Hint 2</summary>
    
    - WEP without any client
    - if: "wi_reader(): Network is down" error:
        - airmon-ng check kill
    
    </details><details><summary>Hint 3</summary>
    
    - https://github.com/aircrack-ng/mdk4
    - https://www.aircrack-ng.org/doku.php?id=besside-ng
    
    </details>

* * *

## PSK

- ### Get wifi-moviles password
    
    <details><summary>Hint 1</summary>
    
    - Get handshake
    
    </details><details><summary>Hint 2</summary>
    
    - Deauth user to get the handshake
    
    </details><details><summary>Hint 3</summary>
    
    - https://www.aircrack-ng.org/doku.php?id=aireplay-ng
    - https://www.aircrack-ng.org/doku.php?id=airmon-ng
    - https://www.aircrack-ng.org/doku.php?id=airodump-ng
    - https://www.aircrack-ng.org/doku.php?id=aircrack-ng
    
    </details>

* * *

- ### Get users login traffic passively
    
    <details><summary>Hint 1</summary>
    
    - Monitor and decrypt PSK traffic
    
    </details><details><summary>Hint 2</summary>
    
    - Get dump and use the password to decrypt the plan traffic.
    
    </details><details><summary>Hint 3</summary>
    
    - https://www.aircrack-ng.org/doku.php?id=airodump-ng
    - https://www.aircrack-ng.org/doku.php?id=airdecap-ng
    - https://www.wireshark.org/
    
    </details>

* * *

- ### Login with stolen creds
    
    <details><summary>Hint 1</summary>
    
    - Get cred from PSK plain text
    
    </details><details><summary>Hint 2</summary>
    
    - Fing HTTP traffic in wireshark and access Router IP.
    
    </details><details><summary>Hint 3</summary>
    
    - https://www.aircrack-ng.org/doku.php?id=airodump-ng
    - https://www.aircrack-ng.org/doku.php?id=airdecap-ng
    - https://www.wireshark.org/
    - https://wiki.archlinux.org/title/wpa_supplicant
    
    </details>

* * *

- ### Get wifi-oficina AP Password
    
    <details><summary>Hint 1</summary>
    
    - Find widiadm probe
    
    </details><details><summary>Hint 2</summary>
    
    - RogueAP with probe ESSID to get handshake.
    
    </details><details><summary>Hint 3</summary>
    
    - https://github.com/sensepost/hostapd-mana
    - https://hashcat.net/wiki/doku.php?id=hashcat
    
    </details>

* * *

- ### Get wifi-admin AP password
    
    <details><summary>Hint 1</summary>
    
    - Verify AP security
    
    </details><details><summary>Hint 2</summary>
    
    - Get password using WPS brute force PIN attack.
    
    </details><details><summary>Hint 3</summary>
    
    - https://github.com/gabrielrcouto/reaver-wps
    
    </details>

* * *

## MGT

- ### Get users login IDs (usernames)
    
    <details><summary>Hint 1</summary>
    
    - Monitor network on clients connect and find Identity packets
    
    </details><details><summary>Hint 2</summary>
    
    - DoS MGT users if necessary.
    
    </details><details><summary>Hint 3</summary>
    
    - Tools
        - https://gist.github.com/RaulCalvoLaorden/f3470f097d1cd21dbc5a238883e79fb2
        - https://github.com/rsmusllp/eapeak
        - Wireshark
    
    </details>

* * *

- ### Get cert information
    
    <details><summary>Hint 1</summary>
    
    - Monitor network on clients connect and get Certificate packets
    
    </details><details><summary>Hint 2</summary>
    
    - DoS MGT users if necessary.
    
    </details><details><summary>Hint 3</summary>
    
    - Tools
        - pcapFilter.sh - https://gist.github.com/RaulCalvoLaorden/f3470f097d1cd21dbc5a238883e79fb2
        - https://github.com/rsmusllp/eapeak
        - Wireshark
    
    </details>

* * *

- ### Get EAP methods supported by AP
    
    <details><summary>Hint 1</summary>
    
    - Connect using all methods or use a script
    
    </details><details><summary>Hint 2</summary>
    
    - EAP_buster
    
    </details><details><summary>Hint 3</summary>
    
    - Tools
        - https://github.com/blackarrowsec/EAP_buster
    
    </details>

* * *

- ### Get first USER password of wifi-corp
    
    <details><summary>Hint 1</summary>
    
    - First user mac 10:f9:6f:07:6c:00
    
    </details><details><summary>Hint 2</summary>
    
    - User mac 10:f9:6f:07:6c:00 RogueAP balanced and crack
    
    </details><details><summary>Hint 3</summary>
    
    - https://github.com/s0lst1c3/eaphammer
    - https://www.aircrack-ng.org/doku.php?id=deauthentication
    - https://hashcat.net/wiki/doku.php?id=hashcat
    
    </details>

* * *

- ### Get CA from the Router using default creds
    
    <details><summary>Hint 1</summary>
    
    - Login to wifi-corp router
    
    </details><details><summary>Hint 2</summary>
    
    - Use admin default creds
    - Download certificate and CA data
    
    </details><details><summary>Hint 3</summary>
    
    - https://wiki.archlinux.org/title/wpa_supplicant
    - https://www.mozilla.org/es-ES/firefox/new/
    
    </details>

* * *

- ### Get second USER password using the CA
    
    <details><summary>Hint 1</summary>
    
    - Second user mac 10:F9:6F:BA:6C:11
    
    </details><details><summary>Hint 2</summary>
    
    - Join the split certs files
    - User mac 10:F9:6F:BA:6C:11 downgrade GTC with CA certificate
    - --cert-wizard import
    
    </details><details><summary>Hint 3</summary>
    
    - https://github.com/s0lst1c3/eaphammer
    - https://www.aircrack-ng.org/doku.php?id=deauthentication
    - https://hashcat.net/wiki/doku.php?id=hashcat
    
    </details>

* * *

- ### Creds Relay
    
    <details><summary>Hint 1</summary>
    
    - MGT Relay with beate\_ap and wpa\_sycophant
    
    </details><details><summary>Hint 2</summary>
    
    - [https://github.com/koutto/pi-pwnbox-rogueap/wiki/13.-WPA-WPA2-Enterprise-(MGT)-Rogue-AP-Evil-Twin#wpawpa2-enterprise-ap-evil-twin--eap-mschapv2-relay](https://github.com/koutto/pi-pwnbox-rogueap/wiki/13.-WPA-WPA2-Enterprise-%28MGT%29-Rogue-AP-Evil-Twin#wpawpa2-enterprise-ap-evil-twin--eap-mschapv2-relay "https://github.com/koutto/pi-pwnbox-rogueap/wiki/13.-WPA-WPA2-Enterprise-(MGT)-Rogue-AP-Evil-Twin#wpawpa2-enterprise-ap-evil-twin--eap-mschapv2-relay")
    
    </details><details><summary>Hint 3</summary>
    
    - https://github.com/sensepost/berate_ap
    - https://github.com/sensepost/wpa_sycophant
    - https://www.aircrack-ng.org/doku.php?id=deauthentication
    
    </details>

* * *

- ### Access as GLOBAL\\Adminsitrator
    
    <details><summary>Hint 1</summary>
    
    - AP Only accepts TLS to login
    
    </details><details><summary>Hint 2</summary>
    
    - Generate Cert with CA
    
    </details><details><summary>Hint 3</summary>
    
    - [https://wiki.innovaphone.com/index.php?title=Howto:802.1X\_EAP-TLS\_With\_FreeRadius#Creation\_Of\_A\_Client_Certificate](https://wiki.innovaphone.com/index.php?title=Howto:802.1X_EAP-TLS_With_FreeRadius#Creation_Of_A_Client_Certificate)
    - https://wiki.archlinux.org/title/wpa_supplicant
    
    </details>

* * *

- ### Login to wifi-global Administrator web creds
    
    <details><summary>Hint 1</summary>
    
    - Login to wifi-global Router
    
    </details>

* * *