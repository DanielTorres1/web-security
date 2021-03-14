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
sudo apt-get install geany 
sudo wget https://repo1.maven.org/maven2/org/python/jython-standalone/2.7.2/jython-standalone-2.7.2.jar -o /opt/jython-standalone-2.7.2.jar
sudo cp -r payloads /opt

