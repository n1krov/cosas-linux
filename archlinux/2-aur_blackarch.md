#  **Activar los repositorios de BlackArch en Arch Linux**

BlackArch es un repositorio de herramientas de seguridad que puedes añadir a tu sistema Arch Linux. Sigue estos pasos para activar los repositorios de BlackArch:

#### Paso 1: Descargar e instalar el script de configuración de BlackArch

- Crea una carpeta `blackarch`:
     ```bash
     mkdir blackarch
     cd blackarch
     ```

- Descarga e instala el script de BlackArch que configura el repositorio:
     ```bash
     curl -O https://blackarch.org/strap.sh
     ```

#### Paso 2: Verificar la integridad del script
   - Verifica que el script descargado no esté corrupto o manipulado:
     ```bash
     echo "$(sha1sum strap.sh)"
     ```

     El resultado debe coincidir con el checksum oficial del sitio de BlackArch:
     ```
     86d708b0e8bdf8f1fb7d9153f2479f7e9b11117d  strap.sh
     ```

#### Paso 3: Dar permisos de ejecución al script
   - Concede permisos de ejecución al script:
     ```bash
     chmod +x strap.sh
     ```

#### Paso 4: Ejecutar el script para añadir el repositorio
   - Ejecuta el script para añadir los repositorios y claves de BlackArch:
     ```bash
     sudo ./strap.sh
     ```

#### Paso 5: Actualizar los paquetes e instalar herramientas
   - Actualiza la lista de paquetes:
     ```bash
     sudo pacman -Syu
     ```

   - Ahora puedes instalar herramientas específicas de BlackArch. Por ejemplo, para instalar todas las herramientas:
     ```bash
     sudo pacman -S blackarch
     ```

   - O si prefieres instalar solo una categoría de herramientas (por ejemplo, herramientas de "networking"):
     ```bash
     sudo pacman -S blackarch-networking
     ```

---

### **Activar AUR con `yay`**

El AUR (Arch User Repository) es un repositorio de la comunidad que contiene paquetes no oficiales mantenidos por los usuarios de Arch. Para usarlo, es recomendable instalar un ayudante de AUR como `yay`.

#### Paso 1: Instalar `yay` (si aún no lo tienes)

1. Si `yay` no está instalado, puedes instalarlo manualmente clonándolo desde el AUR:
   ```bash
   git clone https://aur.archlinux.org/yay.git
   cd yay
   makepkg -si
   ```

2. Una vez que `yay` está instalado, puedes utilizarlo para instalar paquetes desde AUR y mantenerlos actualizados.

#### Paso 2: Instalar paquetes desde AUR usando `yay`

1. Busca paquetes en el AUR:
   ```bash
   yay -Ss nombre_del_paquete
   ```

2. Instala paquetes desde AUR:
   ```bash
   yay -S nombre_del_paquete
   ```

3. Actualiza los paquetes del sistema, incluyendo los del AUR:
   ```bash
   yay -Syu
   ```

