#!/bin/bash
tput civis
trap ctrl_c INT
# Autor: Z0SO
# Este script es un script de fuerza bruta para el servicio XMLRPC de WordPress.

# Colores
red='\e[1;31m'
green='\e[0;32m'
blue='\e[1;34m'
yellow='\e[1;33m'
end='\e[0m'

ctrl_c() {
    echo -e "\n${red}[!] Saliendo...${end}"
    tput cnorm
    exit 1
}


main()
{

}
