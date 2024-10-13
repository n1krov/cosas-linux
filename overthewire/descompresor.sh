#!/bin/bash

# script de descompresión de archivos recursivo


function ctrl_c() {
    echo -e "\n\n[+] Saliendo del script..."
    exit 1
}



trap ctrl_c INT

first_file_name="test"



# yo uso zl que es un alias hacia 7z l, lo mismo para zx que es 7z x


descomprimido="$(7z l $first_file_name | tail -n 3 | head -n 1 | awk 'NF{print $NF}')"
echo ''
echo -e "[+] El primer archivo a descomprimir es: $first_file_name\n"
echo -e "[+] El archivo descomprimido es de $first_file_name es: $descomprimido\n\n"
