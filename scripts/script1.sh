#!/bin/bash

tput civis    # oculta el cursor

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
    tput cnorm    # muestra el cursor
    exit 1
}

trap ctrl_c INT


# -----------------------------------------------
# Autor: Z0SO
# Descripción: Script de prueba para mostrar el uso de getopts y funciones en bash.
# -----------------------------------------------


# variables -------------------------------------
declare -i var1=0
url_file="https://htbmachines.github.io/bundle.js"



# Funciones -------------------------------------

# Funcion de muestra del panel de ayuda
function panel_help(){
    echo -e "${green}[*]-------${end} ${gray}Panel de ayuda${end} ${green}-------[*]${end}"

    echo -e "\t${green}[-m]${end} ${gray}Buscar una máquina con el nombre que se pasa como argumento.${end}"
    echo -e "\t${green}[-u]${end} ${gray}Actualizar archivos.${end}"
    echo -e "\t${green}[-h]${end} ${gray}Mostrar panel de ayuda.${end}"
}




function update_files(){
    # esta funcion se encarga de descargar el archivo bundle.js y formatearlo.
    
    clear
    echo -e "${green}[*]${end} ${gray}Actualizando archivos...${end}\n"
    sleep 2

    # el ! en bash es para negar, en este caso se comprueba si el archivo bundle.js no existe.
    if [ ! -f bundle.js ]; then
        
        echo -e "${red}[*]${end} ${gray}El archivo bundle.js no existe.${end}\n"
        sleep 1
        echo -e "${green}[*]${end} ${gray}Descargando el archivo bundle.js...${end}\n"

        curl -s -X GET $url_file > bundle.js    # Se le podria qutar el -X GET, ya que por defecto es GET.

        # js-beautify es una herramienta que permite formatear el código javascript.
        # sponge es una herramienta que permite redirigir la salida de un comando a un archivo.
        js-beautify bundle.js | sponge bundle.js

    else
        # la idea de este else es que si el archivo ya existe, se deba verificar una actulaziación del archivo.
        # ultilizando md5sum o sha256sum para verificar si el archivo ha sido modificado.
        echo -e "${green}[*] El archivo bundle.js ya existe.${end}\n"
        sleep 1
        echo -e "${green}[*]${end} ${gray}Comprobando actualizaciones...${end}\n"

        sleep 1 # DEBUG

        curl -s -X GET $url_file > bundle_temp.js
        js-beautify bundle_temp.js | sponge bundle_temp.js

        # se comprueba si el archivo ha sido modificado.
        original_value=$(md5sum bundle.js | awk '{print $1}')
        temp_value=$(md5sum bundle_temp.js | awk '{print $1}')

        echo -e "${green}[*]${end} ${gray}Valor original: ${end}${ylw}$original_value${end}"
        echo -e "${green}[*]${end} ${gray}Valor temporal: ${end}${green}$temp_value${end}\n"

        # la diferencia entre comparar las variables con "" y sin "" es que si se comparan con "", se comparan como cadenas de texto.
        # de lo contrario se comparan como números.
        if [ "$original_value" == "$temp_value" ] ; then
            echo -e "${green}[*]${end} ${gray}No hay actualizaciones.${end}\n"
            rm bundle_temp.js
        else
            echo -e "${green}[*]${end} ${gray}Actualizando archivo...${end}\n"
            sleep 1
            rm bundle.js && mv bundle_temp.js bundle.js
        fi
    fi

    # este if comprueba si el comando anterior se ha ejecutado correctamente.
    if [ $? -eq 0 ]; then
        echo -e "${green}[*]${end} ${gray}Archivo formateado correctamente.${end}\n"
        
        # tiramos un bat con sintaxis javascript para buscar la máquina en el archivo formateado.
        
        # cateamos el archivo bundle.js y buscamos la máquina en concreto.
        # bat bundle.js --language=js
    else
        echo -e "${red}[*]${end} ${gray}Error al formatear el archivo.${end}\n"
    fi
}


function buscar_maquina(){
    # esta funcion se encarga de buscar una máquina en el archivo bundle.js.

    clear
    
    mensaje="$*"
    echo -e "${green}[*]${end} ${gray}Buscando la máquina con el nombre -> ${end}${ylw}$mensaje${end}\n"


}





#--------------------------- Nucleo del script -----------------------------

# getopts es una función que permite pasar argumentos a un script, en este caso se pasan los argumentos -h y -m
# m: indica que se espera un argumento después de la m, en este caso el argumento es el mensaje.
# h: indica que no se espera un argumento después de la h, en este caso se muestra el panel de ayuda.
# arg: es la variable que se utiliza para almacenar los argumentos que se pasan al script.

while getopts "m:uh" arg; do
    case $arg in
        m)
            var1=1
            echo -e "${ylw}[~]${end}DEBUG: ${gray}Se ha pasado el argumento -m${end}"
            # $OPTARG es la variable que almacena el argumento que se pasa al script. es una variable.
            mensaje=$OPTARG     
            ;;
        u)
            echo -e "${ylw}[~]${end}DEBUG: ${gray}Se ha pasado el argumento -u${end}"
            var1=2
            ;;

        h)
            ;;
    esac
done
# si no se pasa ningún argumento al script, se muestra el panel de ayuda.
# si se pasa el argumento -m, se muestra el mensaje que se pasa después del argumento -m.
if [ $var1 -eq 0 ]; then
    clear
    echo -e "${red}[*]${end} ${gray}No se ha pasado ningún argumento.${end}\n"
    panel_help
elif [ $var1 -eq 2 ]; then 
    # funcion update_files
    update_files
else
    buscar_maquina $mensaje
fi

#--------------------------------- DEBUG ---------------------------------


echo -e "${ylw}[~] DEBUG: ${end}${gray}Sleep 5 segundos...${end}"
sleep 5
tput cnorm    # muestra el cursor
