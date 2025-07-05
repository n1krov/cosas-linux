## ✅ Opción recomendada (con NetworkManager): configuración persistente y limpia

Esto se hace con `nmcli` (la herramienta oficial de NetworkManager).

### 🛠 Paso 1: Ver tu conexión actual

```bash
nmcli connection show
```

Vas a ver algo como:

```
NAME                UUID                                  TYPE      DEVICE
MiWiFi              a1b2c3d4-e5f6-7890-gh12-ijklmnopqrst  wifi      wlp2s0
```

Tomá nota del **`NAME`**, por ejemplo `MiWiFi` o `Robales`.

---

### 🛠 Paso 2: Configurar los nuevos DNS

Vamos a usar Cloudflare + Google (rápidos y confiables). Reemplazá `Robales` por el nombre de tu conexión:

```bash
nmcli connection modify "Robales" ipv4.ignore-auto-dns yes
nmcli connection modify "Robales" ipv4.dns "1.1.1.1 8.8.8.8"
```

Esto:

* Ignora los DNS que vienen del router (como el `192.168.0.1`).
* Usa `1.1.1.1` (Cloudflare) y `8.8.8.8` (Google).

---

### 🛠 Paso 3: Reiniciar la conexión para aplicar los cambios

```bash
nmcli connection down "Robales" && nmcli connection up "Robales"
```

---

### 🧪 Verificación

1. Verificá el archivo de DNS:

```bash
cat /etc/resolv.conf
```

Deberías ver:

```
nameserver 1.1.1.1
nameserver 8.8.8.8
```

2. Verificá resolución:

```bash
dig google.com
```

3. Y que no estás usando el router como DNS:

```bash
nmcli device show wlp2s0 | grep IP4.DNS
```

Debería mostrar solo `1.1.1.1` y `8.8.8.8`.

---

## ¿Qué pasa si `/etc/resolv.conf` sigue mostrando `192.168.0.1`?

Es posible que NetworkManager esté dejando otro gestor manejarlo (como `systemd-resolved`).

Te lo arreglo así:

```bash
sudo ln -sf /run/NetworkManager/resolv.conf /etc/resolv.conf
```

Y después reiniciás NetworkManager:

```bash
sudo systemctl restart NetworkManager
```


