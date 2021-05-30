#!/bin/bash
# Autor: Vladimir J. Leaño Cueto

# Colours
greenColour="\e[0;32m\033[1m"
resetColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"
pwdLocate="null"

# Deshabilitar modo interactivo en la instalacion
export DEBIAN_FRONTEND=noninteractive


# Ctrl + C
trap Ctrl_c INT

function Ctrl_c(){
	echo -e "\n${yellowColour}[*]${resetColour} Saliendo"
	#aparece cursor
    setterm -cursor on
    exit 0
    

}

# Panel de ayuda 
function HelpPanel(){
cat << "EOF"          
         _   _ __  __  _____  _____                 
        | \ | |  \/  |/ ____|/ ____|                
        |  \| | \  / | |  __| (___   ___ __ _ _ __  
        | . ` | |\/| | | |_ |\___ \ / __/ _` | '_ \ 
        | |\  | |  | | |__| |____) | (_| (_| | | | |
        |_| \_|_|  |_|\_____|_____/ \___\__,_|_| |_|
                                                    
                                            
                        Puertos de administración
                                                v.1.0

    [*] Parametros de entrada: 

            -l : lista de direcciones IPv4
            -h : Mostrar panel de ayuda
            
        Ejecutar:

            NETScope.sh -l NETDevices.ip4
EOF
    #exit 0

}

# Creacion de Direcctorio
function Directory(){

    # variables global
    echo -e "${yellowColour}[*]${resetColour} Creando directorio...\n"
    declare -r rdate="$(date +%d-%m-%Y)"
    echo -e "\t ${blueColour} ${rdate} \n"
    mkdir "${rdate}" 2>/dev/null
    cd ${rdate}
    pwdLocate=$(pwd)
    list="$(grep '\[' ../${ipList} | tr -d '[]')"

    sleep 2

}

# informacion de Red
function IPInformation(){
	
    echo -e "${yellowColour}[*]${resetColour} Obteniendo datos de red...\n"
    ip add | tee IPconfig
    ip neigh | tee IPGateway   
    traceroute 8.8.8.8 | tee IPTrace 1>/dev/null &
}

# Funcion escaneo de puertos MNG
function MNGPorts(){
	
    echo -e "\n ${yellowColour}[*]${resetColour} Iniciando escaneo...\n"

    cat ../${ipList} | while read x; do  
       
       if [[ $x =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
			echo -e "${yellowColour}[*] ${blueColour}Device: ${x} ${resetColour} \n"
			nmap -p22,23,443,80 -sS -Pn -n --open --min-rate 5000 -vvv ${x} -oG MNGports-${x}
	   else
			echo "otro"
       fi;
       
    done
    
}


# ***************************************************************
# Main Function
# Solicitud de parametros desde la terminal
#

function main(){
	directory

    
    declare -i paramiterCounter=0; while getopts ":l:h:" arg; do

        case $arg in
            l) ipList=$OPTARG; let paramiterCounter+=1;;
            h) HelpPanel;;
        esac

    done


    if [ ${paramiterCounter} -ne 1 ]; then 
        HelpPanel
    else
    cat << "EOF"          
     _        _______ _________ 
    ( (    /|(  ____ \\__   __/
    |  \  ( || (    \/   ) ( ______               _                
    |   \ | || (__       | | | ___ \             | |                
    | (\ \) ||  __)      | | | |_/ /  __ _   ___ | | __ _   _  _ __  
    | | \   || (         | | | ___ \ / _` | / __|| |/ /| | | || '_ \     
    | )  \  || (____/\   | | | |_/ /| (_| || (__ |   < | |_| || |_) |   
    |/    )_)(_______/   )_( \____/  \__,_| \___||_|\_\ \__,_|| .__/    
                                                              | |   
                                                              |_| 

                        Backup de dispositivos de red
                                                v.1.0

EOF

        Directory
        IPInformation
        MNGPorts
    fi
}

main "$@"
