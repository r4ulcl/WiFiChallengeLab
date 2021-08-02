#!/bin/bash
# Script to change the flags of the GitHub project to new ones, to avoid copy-paste

F1='10:F9:6F:BA:18:22'
#F2=''
F3='wifi-oficina'
F4='administrator'
F5='MAC filtering'
F6='Jyl1iq8UajZ1fEK'
#F7=''
F81='123456789a'
F82='12:34:56:78:9a'

F9='12345678'
F10='192.168.2.0\/24'
F111='z39kTesr7hzgh9Y'
F112='uTJTGWAbpnxb6uO'
F12='password1'
F13='UltraSecretP@ssword!_@#'
F14='CONTOSO'
F15='ca@WiFi.ca.es'
#F16=''
F17='Secret!'
#F18=''
F19='SuperSecure@!@'
F20='F4G6$%2f2g4hs'
F21='babygirl'
F22='guest'
F23='WnIlomDsedsOj5I5AQzG0ZoMIhmJIJeejksyma64'
#F24=''

find ./install/-type f -exec sed -i "s/10:F9:6F:BA:18:22/$F1/g" {} \;
#find ./install/-type f -exec sed -i "s//$F2/g" {} \;
find ./install/-type f -exec sed -i "s/wifi-oficina/$F3/g" {} \;
find ./install/-type f -exec sed -i "s/administrator/$F4/g" {} \;
find ./install/-type f -exec sed -i "s/MAC filtering/$F5/g" {} \;
find ./install/-type f -exec sed -i "s/Jyl1iq8UajZ1fEK/$F6/g" {} \;
#find ./install/-type f -exec sed -i "s//$F7/g" {} \;
find ./install/-type f -exec sed -i "s/123456789a/$F81/g" {} \;
find ./install/-type f -exec sed -i "s/12:34:56:78:9a/$F82/g" {} \;
find ./install/-type f -exec sed -i "s/12345678/$F9/g" {} \;
find ./install/-type f -exec sed -i "s/192.168.2.0\/24/$F10/g" {} \;
find ./install/-type f -exec sed -i "s/z39kTesr7hzgh9Y/$F111/g" {} \;
find ./install/-type f -exec sed -i "s/uTJTGWAbpnxb6uO/$F112/g" {} \;
find ./install/-type f -exec sed -i "s/password1/$F12/g" {} \;
find ./install/-type f -exec sed -i "s/UltraSecretP@ssword!_@#/$F13/g" {} \;
find ./install/-type f -exec sed -i "s/CONTOSO/$F14/g" {} \;
find ./install/-type f -exec sed -i "s/ca@WiFi.ca.es/$F15/g" {} \;
#find ./install/-type f -exec sed -i "s//$F16/g" {} \;
find ./install/-type f -exec sed -i "s/Secret!/$F17/g" {} \;
#find ./install/-type f -exec sed -i "s//$F18/g" {} \;
find ./install/-type f -exec sed -i "s/SuperSecure@!@/$F19/g" {} \;
find ./install/-type f -exec sed -i "s/F4G6$%2f2g4hs/$F20/g" {} \;
find ./install/-type f -exec sed -i "s/babygirl/$F21/g" {} \;
find ./install/-type f -exec sed -i "s/guest/$F22/g" {} \;
find ./install/-type f -exec sed -i "s/WnIlomDsedsOj5I5AQzG0ZoMIhmJIJeejksyma64/$F23/g" {} \;
#find ./install/-type f -exec sed -i "s//$F24/g" {} \;

cd certs
bash createCert.sh