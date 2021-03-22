#!/bin/bash

function print_ascii_art {
cat << "EOF"
                 _                                     _         
                ( )                                  _( )_       
 _   _   _   __ | |_      ___ _   _   ___ _   _ _ __(_)  _)_   _ 
( ) ( ) ( )/ __ \  _ \  /  __) ) ( )/ ___) ) ( )  __) | | ( ) ( )
| \_/ \_/ |  ___/ |_) ) \__  \ (_) | (___| (_) | |  | | |_| (_) |
 \__/\___/ \____)_ __/  (____/\___/ \____)\___/(_)  (_)\__)\__  |
                                                          ( )_| |
                                                           \___/ 

EOF
}


print_ascii_art

RED="\033[01;31m"      # Issues/Errors
GREEN="\033[01;32m"    # Success
YELLOW="\033[01;33m"   # Warnings/Information
BLUE="\033[01;34m"     # Heading
BOLD="\033[01;01m"     # Highlight
RESET="\033[00m"       # Normal

echo -e "${GREEN} [+] Instalando herramientas disponibles en repositorio ${RESET}" 
sudo apt-get update
sudo apt-get install -y geany python3-pip synaptic golang-go libreoffice-calc dotdotpwn


echo -e "${GREEN} [+] Instalando WEBHACKS ${RESET}" 
git clone https://github.com/DanielTorres1/Webhacks
cd Webhacks
sudo bash instalar.sh
cd ..

echo -e "${GREEN} [+] Instalando webintruder ${RESET}" 
git clone https://github.com/DanielTorres1/webintruder
cd webintruder
sudo bash instalar.sh
cd ..

echo -e "${GREEN} [+] Instalando Dalfox ${RESET}" 
git clone https://github.com/hahwul/dalfox
cd dalfox
sudo go install
sudo go build
sudo mv dalfox /usr/bin
cd ..


#git clone https://github.com/szski/shapeshifter
#cd shapeshifter

git clone https://github.com/securing/DumpsterDiver
cd DumpsterDiver
pip3 install -r requirements.txt
cd ..

sudo mv DumpsterDiver /opt 
sudo cp DumpsterDiver.sh /usr/bin/DumpsterDiver.sh  
sudo chmod a+x /usr/bin/DumpsterDiver.sh


sudo wget https://raw.githubusercontent.com/dolevf/nmap-graphql-introspection-nse/6594cce7b590a7194641494ed33c018d9ecd6b89/graphql-introspection.nse -O /usr/share/nmap/scripts/graphql-introspection.nse
sudo wget https://repo1.maven.org/maven2/org/python/jython-standalone/2.7.2/jython-standalone-2.7.2.jar -O /opt/jython-standalone-2.7.2.jar

#sudo apt-get -y install bc nbtscan nfs-common snmp finger sqlite3 sqlitebrowser python-pip nmap masscan onesixtyone whatweb libssl-dev ike-scan postgresql-client elinks smbclient bc libcurl4-openssl-dev xterm ipmitool lbd exiftool libpq-dev libpcap-dev tshark p7zip-full default-mysql-client python3-pip libssl-dev swig python3-dev gcc libcrypt-ssleay-perl metasploit-framework patator hydra enum4linux wpscan dnsutils python3-setuptools libreoffice-calc
