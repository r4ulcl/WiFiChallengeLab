#!/bin/bash

#NOP vwifi-client 10.0.2.2 & # ADD to CRON

while :
do
	date
	sleep 300

	dhclient wlan0
	dhclient wlan1
	dhclient wlan2
	dhclient wlan3
	dhclient wlan4
	dhclient wlan5
	dhclient wlan6
	dhclient wlan7
	dhclient wlan8
	dhclient wlan9

	# MGT
	curl 'http://192.168.0.1/login.php' --interface wlan0 --compressed -H 'Content-Type: application/x-www-form-urlencoded' -H 'Connection: keep-alive' -H 'Upgrade-Insecure-Requests: 1' --data-raw 'Username=CONTOSO%5Cjuan.tr&Password=Secret%21&Submit=Login' --cookie-jar /tmp/userjuan
	curl 'http://192.168.0.1/login.php' --interface wlan1 --compressed -H 'Content-Type: application/x-www-form-urlencoded' -H 'Connection: keep-alive' -H 'Upgrade-Insecure-Requests: 1' --data-raw 'Username=CONTOSO%5CAdministrator&Password=SuperSecure%40%21%40&Submit=Login' --cookie-jar /tmp/userAdmin
	
	# MGT TLS
	curl 'http://192.168.7.1/login.php' --interface wlan2 --compressed -H 'Content-Type: application/x-www-form-urlencoded' -H 'Connection: keep-alive' -H 'Upgrade-Insecure-Requests: 1' --data-raw 'Username=GLOBAL%5CGlobalAdmin&Password=SuperSuperSecure%40%21%40&Submit=Login' --cookie-jar /tmp/userGlobal

	# PSK
	curl 'http://192.168.2.1/login.php' --interface wlan3 --compressed -H 'Content-Type: application/x-www-form-urlencoded' -H 'Connection: keep-alive' -H 'Upgrade-Insecure-Requests: 1' --data-raw 'Username=test1&Password=OYfDcUNQu9PCojb&Submit=Login' --cookie-jar /tmp/userTest1
	curl 'http://192.168.2.1/login.php' --interface wlan4 --compressed -H 'Content-Type: application/x-www-form-urlencoded' -H 'Connection: keep-alive' -H 'Upgrade-Insecure-Requests: 1' --data-raw 'Username=test2&Password=2q60joygCBJQuFo&Submit=Login' --cookie-jar /tmp/userTest2

	# PSK NOAPP
	curl 'http://10.10.1.1/login.php' --interface wlan5 --compressed -H 'Content-Type: application/x-www-form-urlencoded' -H 'Connection: keep-alive' -H 'Upgrade-Insecure-Requests: 1' --data-raw 'Username=anon1&Password=CRgwj5fZTo1cO6Y&Submit=Login' --cookie-jar /tmp/userAnon1
	curl 'http://10.10.1.1/login.php' --interface wlan6 --compressed -H 'Content-Type: application/x-www-form-urlencoded' -H 'Connection: keep-alive' -H 'Upgrade-Insecure-Requests: 1' --data-raw 'Username=anon1&Password=CRgwj5fZTo1cO6Y&Submit=Login' --cookie-jar /tmp/userAnon11

	# OPEN
	curl 'http://192.168.1.1/login.php' --interface wlan7 --compressed -H 'Content-Type: application/x-www-form-urlencoded' -H 'Connection: keep-alive' -H 'Upgrade-Insecure-Requests: 1' --data-raw 'Username=free1&Password=Jyl1iq8UajZ1fEK&Submit=Login' --cookie-jar /tmp/userFree1
	curl 'http://192.168.1.1/login.php' --interface wlan8 --compressed -H 'Content-Type: application/x-www-form-urlencoded' -H 'Connection: keep-alive' -H 'Upgrade-Insecure-Requests: 1' --data-raw 'Username=free2&Password=5LqwwccmTg6C39y&Submit=Login' --cookie-jar /tmp/userFree2
	curl 'http://192.168.1.1/login.php' --interface wlan9 --compressed -H 'Content-Type: application/x-www-form-urlencoded' -H 'Connection: keep-alive' -H 'Upgrade-Insecure-Requests: 1' --data-raw 'Username=free1&Password=Jyl1iq8UajZ1fEK&Submit=Login' --cookie-jar /tmp/userFree11

done