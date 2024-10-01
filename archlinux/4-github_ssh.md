
Para conectar tu terminal con GitHub usando **SSH**, de manera que puedas realizar `git clone`, `pull`, `push` y demás operaciones sin ingresar tus credenciales repetidamente, sigue estos pasos:

### 1. **Generar una clave SSH:**

Si no tienes una clave SSH en tu sistema, primero debes generar una. Usa el siguiente comando:

```bash
ssh-keygen -t ed25519 -C "tu-email@example.com"
```

- **`-t ed25519`** especifica el tipo de clave SSH (es más seguro que `rsa`).
- **`-C`** añade un comentario (en este caso, tu correo electrónico) para identificar la clave.

Cuando se te pregunte dónde guardar la clave, puedes presionar `Enter` para aceptar la ubicación predeterminada (`~/.ssh/id_ed25519`).

Durante la creación de la clave, también te preguntará si deseas configurar una contraseña para la clave privada. Puedes dejarla vacía si no deseas ingresar una contraseña al usarla.

### 2. **Agregar la clave SSH al agente SSH:**

Inicia el agente SSH y añade tu nueva clave:

```bash
eval "$(ssh-agent -s)"
```

Luego añade la clave generada al agente:

```bash
ssh-add ~/.ssh/id_ed25519
```

### 3. **Copiar la clave pública:**

Ahora necesitas copiar la clave pública para añadirla a GitHub. Usa este comando para ver tu clave pública:

```bash
cat ~/.ssh/id_ed25519.pub
```

Esto mostrará la clave en la terminal. **Cópiala** al portapapeles.

### 4. **Agregar la clave SSH a GitHub:**

1. Ve a [GitHub SSH Keys Settings](https://github.com/settings/keys).
2. Haz clic en **"New SSH key"**.
3. Dale un nombre descriptivo en el campo **Title** (como "Mi laptop" o "Arch Linux").
4. Pega la clave pública que copiaste de tu terminal en el campo **Key**.
5. Haz clic en **Add SSH key**.

### 5. **Probar la conexión con GitHub:**

Una vez que la clave está en GitHub, puedes probar la conexión ejecutando:

```bash
ssh -T git@github.com
```

Deberías ver un mensaje como este:

```
Hi username! You've successfully authenticated, but GitHub does not provide shell access.
```

Esto indica que la conexión SSH está funcionando correctamente.

### 6. **Configurar Git para usar SSH:**

Para asegurarte de que Git siempre use SSH al interactuar con GitHub, puedes clonar repositorios utilizando el enlace SSH en lugar de HTTPS. Por ejemplo:

```bash
git clone git@github.com:usuario/nombre-del-repositorio.git
```

Si ya tienes un repositorio clonado con HTTPS, puedes cambiar la URL remota para usar SSH con el siguiente comando dentro de la carpeta del repositorio:

```bash
git remote set-url origin git@github.com:usuario/nombre-del-repositorio.git
```

### 7. **Configurar tu nombre de usuario y correo en Git:**

Si aún no lo has hecho, configura tu nombre de usuario y correo en Git:

```bash
git config --global user.name "Tu Nombre"
git config --global user.email "tu-email@example.com"
```

