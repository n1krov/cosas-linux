Ya que tienes `NetworkManager` activado y `wpa_supplicant` para gestionar conexiones Wi-Fi, te dejo los pasos para conectarte a una red Wi-Fi utilizando `NetworkManager` de manera sencilla.

### Métodos para conectarte a Wi-Fi con `NetworkManager`

#### 1. **Conexión desde la terminal usando `nmtui`** (interfaz basada en texto):
   - Ejecuta el siguiente comando para abrir la interfaz de `nmtui`, que es una herramienta simple y fácil de usar para gestionar conexiones.
     ```bash
     nmtui
     ```

   - Dentro de `nmtui`:
     - Selecciona **Activate a connection** (Activar una conexión).
     - Verás una lista de redes disponibles. Selecciona la red Wi-Fi a la que deseas conectarte.
     - Introduce la contraseña si es necesario.
     - Luego, selecciona la opción para activar la red.

   - Una vez hecho esto, deberías estar conectado a la red Wi-Fi.

#### 2. **Conexión directa desde la terminal con `nmcli`** (comando de `NetworkManager`):

   - Para listar las redes Wi-Fi disponibles:
     ```bash
     nmcli device wifi list
     ```

   - Para conectarte a una red específica:
     ```bash
     nmcli device wifi connect "NOMBRE_DE_LA_RED" password "CONTRASEÑA"
     ```

   - Si la conexión es exitosa, verás un mensaje confirmando la conexión. Si no es necesario ingresar una contraseña, puedes omitir la parte de `password`.

   **Ejemplo**:
   ```bash
   nmcli device wifi connect "MiRedWiFi" password "miContraseña123"
   ```

   - Puedes verificar tu conexión con:
     ```bash
     nmcli connection show --active
     ```

#### 3. **Conexión gráfica** (si tienes un entorno de escritorio como KDE, GNOME, o XFCE):
   - Si tienes una interfaz gráfica instalada, `NetworkManager` puede gestionar las conexiones de forma más amigable con herramientas como `nm-applet` (para entornos como XFCE, MATE o i3) o el gestor de red que viene integrado con KDE Plasma o GNOME.
 
   - Simplemente busca el icono de red en la barra de tareas, haz clic en él y selecciona la red Wi-Fi que deseas conectar. Luego, ingresa la contraseña si es necesario.

### Verificar la conexión:
   - Para asegurarte de que todo esté bien configurado y conectado, puedes ejecutar el siguiente comando para ver tu estado de red:
     ```bash
     nmcli general status
     ```

   - También puedes verificar tu dirección IP para confirmar la conexión:
     ```bash
     ip a
     ```

Con estos pasos deberías poder conectarte a la red Wi-Fi correctamente.
