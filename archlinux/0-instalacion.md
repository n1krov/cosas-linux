# Instalación de Arch Linux



## Configuración Inicial

1. Cargamos el layout del teclado en español:
   ```bash
   loadkeys es
   ```

Para conectarte a internet por Wi-Fi en Arch Linux, puedes usar `iwctl`, la herramienta de administración de redes inalámbricas de `iwd` (iNet wireless daemon). Aquí te dejo los pasos básicos para conectarte a una red Wi-Fi:
- **Iniciar `iwctl` para gestionar la conexión:**
   ```bash
   iwctl
   ```

- **Dentro de `iwctl`, ver las interfaces Wi-Fi disponibles:**
   ```bash
   device list
   ```

- **Escanear las redes disponibles con tu interfaz Wi-Fi (por ejemplo, `wlan0`):**
   ```bash
   station wlan0 scan
   station wlan0 get-networks
   ```

- **Conectarte a la red Wi-Fi deseada:**
   ```bash
   station wlan0 connect NOMBRE_DE_LA_RED
   ```

   Te pedirá la contraseña si la red está protegida, solo tienes que ingresarla.

- **Salir de `iwctl`:**
   ```bash
   exit
   ```
> Puedes tirar un `ping` para verificar que tienes conexión a internet:
   ```bash
   ping -c 3 google.com
   ```

2. Definimos las particiones utilizando `cfdisk`:
   ```bash
   cfdisk
   ```

### Particiones Necesarias

Para una PC con **educational purposes**, vamos a necesitar las siguientes particiones:

- **boot/efi**: `FAT32`, 512M
- **boot**: `EXT4`, 1024M
- **linuxswap**: la mitad de tu memoria RAM
- **/**: el resto de tu disco

Antes de escribir los cambios y salir de `cfdisk`, asegúrate de modificar el tipo de la partición de **swap** a `linuxswap`.

> **Nota:** Si tienes varios discos, puedes ejecutar:
   ```bash
   lsblk
   ```
   Esto te mostrará la lista de discos disponibles en tu máquina. Luego selecciona el volumen correcto:
   ```bash
   cfdisk /dev/<nombre_del_volumen>
   ```

## Formateo de Particiones

Juega con `lsblk` para ver el volumen que particionaste. Si no es un disco **NVMe**, probablemente sea de tipo `/dev/sda`. Así que tomas ese volumen y formateas cada partición como lo definimos anteriormente.

---

### Montar las Particiones

1. Creamos el directorio para montar la partición `boot`:
   ```bash
   mkdir -p /mnt/boot/efi
   ```

2. Montamos cada partición en su directorio correspondiente:

   - La raíz (`/`) en `/mnt`
   - La partición de `boot` en `/mnt/boot`
   - La partición `efi` en `/mnt/boot/efi`

ejemplo suponiendo que:
- `/dev/sda1` es la partición de **boot/efi**
- `/dev/sda2` es la partición de **boot**
- `/dev/sda3` es la partición de **swap** 
- `/dev/sda4` es la partición de **/**.

```bash
mount /dev/sda4 /mnt
mount /dev/sda2 /mnt/boot
mount /dev/sda1 /mnt/boot/efi

swapon
```

## Instalación de Paquetes Básicos

Ahora instalamos los paquetes necesarios con `pacstrap`:

```bash
pacstrap /mnt linux linux-firmware networkmanager grub wpa_supplicant base base-devel
```

## Configurar `fstab`

El archivo `fstab` tiene toda la información relacionada con las particiones del sistema. Generamos este archivo con:
```bash
genfstab -U /mnt > /mnt/etc/fstab
```

## Acceso como Root al Sistema

Para entrar como **root** en el nuevo sistema, ejecutamos:
```bash
arch-chroot /mnt
```

Una vez dentro, configuramos la contraseña de **root**:
```bash
passwd
```

> **Nota:** Cambia `zoso` por tu nombre de usuario en los siguientes comandos.

## Crear Usuario

1. Agregamos un nuevo usuario:
   ```bash
   useradd -m zoso
   ```
   La opción `-m` crea el directorio home del usuario.

2. Definimos la contraseña para el usuario:
   ```bash
   passwd zoso
   ```

3. Añadimos al usuario al grupo **wheel** para otorgarle permisos de sudo:
   ```bash
   usermod -aG wheel zoso
   ```

4. Verifica que el usuario esté en el grupo correcto:
   ```bash
   groups zoso
   ```

## Instalación de Paquetes Esenciales

Todavía como **root**, podemos empezar a instalar algunos paquetes esenciales:
```bash
pacman -S sudo git vim neovim nano npm openssh efibootmgr flameshot htop wget
```

## Configuración de Sudo

1. Editamos el archivo `/etc/sudoers`:
   ```bash
   nano /etc/sudoers
   ```

2. Descomenta la línea que permite a los usuarios del grupo **wheel** usar sudo:
   ```
   %wheel ALL=(ALL:ALL) ALL
   ```

> **Ojo:** No comentes la línea que dice `NOPASSWD`, ya que esta línea no requiere contraseña para usar sudo.

## Configuración de Idioma y Teclado

1. Abrimos el archivo `locale.gen`:
   ```bash
   nano /etc/locale.gen
   ```

2. Descomentamos las siguientes líneas:
   ```
   es_AR.UTF-8 UTF-8
   en_US.UTF-8 UTF-8
   ```

3. Aplicamos los cambios generando las locales:
   ```bash
   locale-gen
   ```

4. Para evitar problemas con el teclado en inglés, configuramos el teclado en español:
   ```bash
   nano /etc/vconsole.conf
   ```
   Y agregamos:
   ```
   KEYMAP=es
   ```

## Instalación de GRUB

1. Instalamos **GRUB** en la partición correspondiente (por ejemplo, `/dev/sda`):
   ```bash
   grub-install /dev/sda
   ```

2. Generamos el archivo de configuración de **GRUB**:
   ```bash
   grub-mkconfig -o /boot/grub/grub.cfg
   ```

## Configuración del Hostname

Definimos el nombre del equipo. En este caso, llamaremos al equipo **archlinux**:
```bash
echo archlinux > /etc/hostname
```

Luego configuramos el archivo `hosts`:
```bash
nano /etc/hosts
```
Añadimos lo siguiente:
```
127.0.0.1   localhost
::1         localhost
127.0.0.1   archlinux.localhost archlinux
```

## Instalación de Extras

Para cerrar, instalamos algunos extras para tener una presentación más divertida:
```bash
pacman -S neofetch fastfetch
```

Después de instalarlo, ejecuta:
```bash
neofetch
```

Al darle enter, debes decir:
> "I use Arch, btw."

¡Con esto, sentirás que tienes el poder máximo por saber instalar Arch Linux!
