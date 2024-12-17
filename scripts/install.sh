#!/bin/bash
# script de instalacion de entonrno de desarrllo para el proyecto
# hecho por karin

tput civis # ocultar cursor

# colores
readonly RED='\033[0;31m'
readonly GREEN='\033[0;32m'
readonly END='\033[0m'
readonly YELLOW='\033[1;33m'
readonly CYAN='\033[0;36m'
readonly BLUE='\033[0;34m'
readonly PURPLE='\033[0;35m'
readonly WHITE='\033[1;37m'
readonly BLACK='\033[0;30m'
readonly GRAY='\033[1;30m'
readonly LIGHT_RED='\033[1;31m'
readonly LIGHT_GREEN='\033[1;32m'
readonly LIGHT_YELLOW='\033[1;33m'
readonly LIGHT_BLUE='\033[1;34m'
readonly LIGHT_PURPLE='\033[1;35m'
readonly LIGHT_CYAN='\033[1;36m'
readonly LIGHT_GRAY='\033[0;37m'


function ctrl_c() {
    echo -e "\n${RED}[*] Saliendo...${END}"
    tput cnorm # mostrar cursor
    exit 1
}

trap ctrl_c INT


function banner() {
    echo -e "${LIGHT_BLUE}\n"

    echo -e "~~~~~EJECUTANDO SCRIPT DE INSTALACION~~~~~~"

    echo -e "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
    echo -e "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⢮⡙⠰⣎⡳⣽⣿⣶⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
    echo -e "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡟⠦⢡⢛⡼⣝⣧⢿⣿⠁⣾⡷⡤⣄⣀⣀⡀⠤⠤⡶⠀⠀⠀⠀⠀⠀⠀"
    echo -e "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⠹⠌⡆⣏⠾⣝⡾⣿⡇⢸⣿⣝⠣⢆⠀⠀⢀⠠⢻⠃⠀⠀⠀⠀⠀⠀⠀"
    echo -e "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣏⠧⣱⣸⣜⣯⢿⣽⡿⢀⣿⡟⣬⠓⠌⢀⠈⠀⡜⡟⠀⠀⠀⠀⠀⠀⠀⠀"
    echo -e "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢘⣈⣩⠤⢤⢤⣄⡉⠛⠇⣸⣿⡹⢆⠍⠂⢀⠠⠑⣼⠃⠀⠀⠀⠀⠀⠀⠀⠀"
    echo -e "⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡟⢦⠣⠞⣥⣻⢾⣿⡷⢢⣉⠓⠯⢜⣈⣄⡠⠤⠟⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀"
    echo -e "⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⡙⢦⢋⡝⡶⣯⣿⣿⠃⣼⣏⢳⠒⡂⠤⠀⠒⠒⣹⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
    echo -e "⠀⠀⠀⠀⠀⠀⠀⠀⢰⣇⠹⡆⢏⡸⢷⣿⣿⡿⢀⣿⡈⡇⠎⡀⠀⠀⠀⢆⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
    echo -e "⠀⠀⠀⠀⠀⠀⠀⠀⣼⡹⣌⣕⣫⣝⣯⣷⣿⠃⣼⢷⡙⡌⠒⠀⠀⠀⠐⣸⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
    echo -e "⢀⡀⣀⡄⡀⢀⣀⢀⡋⣉⢠⣀⡀⠀⠉⠙⠟⢠⣿⢣⠓⡌⠡⠀⠀⢀⢡⡇⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
    echo -e "⠸⠱⠹⠟⡼⠏⠧⠫⣗⡽⠻⠰⠄⠀⠀⠀⠀⠈⠙⠣⠭⠤⢁⠤⠤⠖⠚⠀⠈⠁⠀⠀⠀⡀⠀⠀⠀⡀⠀"
    echo -e "⠈⣿⡄⢠⣿⡇⠀⣿⢙⡏⢠⣀⣀⡀⠀⣀⣄⣿⡇⢀⣀⣀⢀⣀⠀⣀⡀⢀⡀⣀⣄⡀⡀⢹⡞⢹⡏⢹⡆"
    echo -e "⠀⠸⣧⣼⠉⣿⢸⡏⢸⡇⢸⡏⠉⣿⢺⡏⠈⣿⣧⣿⠉⢹⣧⢿⣄⡿⣇⣼⠻⣯⣤⣍⠐⠋⠙⢺⡗⠛⠁"
    echo -e "⠀⠀⢿⡟⠀⢹⣿⠀⢸⡇⢸⡇⠀⣿⠘⢷⣤⢿⡇⠻⣦⡼⠏⠘⣿⠃⢻⡟⠰⣦⣬⡿⠁⠀⠀⠈⠁⠀⠀"

    echo -e "\n${END}"
    sleep 1
    echo -e "${LIGHT_PURPLE}"
    echo -e "\nHecho por Karin${END}\n"
    
    echo -e "${GREEN}[+]${END} ${LIGHT_CYAN}Este script instalará las dependencias necesarias para el proyecto${END}\n"
}

function check_root() {
    if [[ $EUID -ne 0 ]]; then
        echo -e "${RED}[!] Este script debe ser ejecutado como root${END}"
        tpur cnorm # mostrar cursor
        exit 1
    fi
}

function ejecucion() {
    clear
    echo -e "${GREEN}[+]${END} ${LIGHT_CYAN}Instalando yarn...${END}"
    npm install -g yarn
    
    clear
    echo -e "${GREEN}[+]${END} ${LIGHT_CYAN}Instalando lerna...${END}"
    npm install -g lerna

    clear
    echo -e "${GREEN}[+]${END} ${LIGHT_CYAN}Navegando al directorio del frontend...${END}"
    cd packages/frontend

    clear
    echo -e "${GREEN}[+]${END} ${LIGHT_CYAN}Instalando dependencias de React...${END}"
    npm install react@latest react-dom@latest
    yarn add react@latest react-dom@latest
    yarn add -D @types/react @types/react-dom
    yarn add axios

    clear
    echo -e "${GREEN}[+]${END} ${LIGHT_CYAN}Instalando Tailwind CSS y herramientas relacionadas...${END}"
    yarn add -D tailwindcss postcss autoprefixer
    npx tailwindcss init -p
    yarn add -D daisyui@latest

    clear
    echo -e "${GREEN}[+]${END} ${LIGHT_CYAN}Agregando FontAwesome...${END}"
    yarn add @fortawesome/fontawesome-free

    clear
    echo -e "${GREEN}[+]${END} ${LIGHT_CYAN}Instalando dependencias adicionales...${END}"
    yarn install

    clear
    echo -e "${GREEN}[+]${END} ${LIGHT_CYAN}Navegando al directorio del backend...${END}"
    cd ../backend

    clear
    echo -e "${GREEN}[+]${END} ${LIGHT_CYAN}Instalando dependencias de backend...${END}"
    yarn add nodemon --dev
    yarn add bcryptjs
    yarn add mongoose
    yarn add jsonwebtoken
    yarn install

    clear
    echo -e "${GREEN}[+]${END} ${LIGHT_CYAN}Instalacion completada${END}"
}

check_root
banner
ejecucion

tput cnorm # mostrar cursor
