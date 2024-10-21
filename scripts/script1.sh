#!/bin/bash

# colorines
green="\e[0;32m\033[1m"
end="\033[0m\e[0m"
red="\e[0;31m\033[1m"
blue="\e[0;34m\033[1m"
ylw="\e[0;33m\033[1m"
purple="\e[0;35m\033[1m"
turquesa="\e[0;36m\033[1m"
gray="\e[0;37m\033[1m"

echo -e "${green}[*]${end} ${gray}Script de prueba${end}"

function ctrl_c() {
    echo -e "\n${red}[*]${end} ${gray}SALIENDO...${end}"
    exit 1
}

trap ctrl_c INT


# Funciones -------------------------------------

# Funcion de muestra del panel de ayuda
function panel_help(){
    echo -e "${gray}##########################${end}"
    echo -e "${green}[*]${end} ${gray}Panel de ayuda${end}"
}

function buscar_maquina(){
    # mensaje guardado en la variable $1 que es el argumento que se pasa al script. si fuera el segundo argumento sería $2
    mensaje="$1"
    echo -e "${green}[*]${end} ${gray}Buscando la máquina con el nombre -> ${mensaje}${end}"
}

# variables -------------------------------------
declare -i var1=0

# Nucleo del script -----------------------------

# getopts es una función que permite pasar argumentos a un script, en este caso se pasan los argumentos -h y -m
# m: indica que se espera un argumento después de la m, en este caso el argumento es el mensaje.
# h: indica que no se espera un argumento después de la h, en este caso se muestra el panel de ayuda.
# arg: es la variable que se utiliza para almacenar los argumentos que se pasan al script.

while getopts "m:h" arg; do
    case $arg in
        m)
            var1=1
            # $OPTARG es la variable que almacena el argumento que se pasa al script. es una variable interna de getopts.
            mensaje=$OPTARG     
            ;;
        h)
            ;;
    esac
done

# si no se pasa ningún argumento al script, se muestra el panel de ayuda.
# si se pasa el argumento -m, se muestra el mensaje que se pasa después del argumento -m.
if [ $var1 -eq 0 ]; then
    echo -e "${green}[*]${end} ${gray}No se ha pasado el argumento -m${end}"
    panel_help
else
    buscar_maquina $mensaje
fi

sleep 10
