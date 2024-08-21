
# Lista de cosas por hacer

## Tareas

- [ ] Estudiar Linux
- [ ] Hacer la tarea de seminario integrador (segundo sprint)
- [ ] Trabajar en el proyecto Yaren

### Habito Linux
```dataviewjs
// dv.span("** 📘 Estudiar Linux 📖**")

const calendarData = {
    year: 2024,  // Puedes ajustar el año si es necesario, por defecto toma el año actual
    colors: {    // Definición de colores para las intensidades
        blue:        ["#8cb9ff", "#69a3ff", "#428bff", "#1872ff", "#0058e2"],
        green:       ["#c6e48b", "#7bc96f", "#49af5d", "#2e8840", "#196127"],
        red:         ["#ff9e82", "#ff7b55", "#ff4d1a", "#e73400", "#bd2a00"],
        orange:      ["#ffa244", "#fd7f00", "#dd6f00", "#bf6000", "#9b4e00"],
        pink:        ["#ff96cb", "#ff70b8", "#ff3a9d", "#ee0077", "#c30062"],
        orangeToRed: ["#ffdf04", "#ffbe04", "#ff9a03", "#ff6d02", "#ff2c01"]
    },
    showCurrentDayBorder: true, // Muestra el borde alrededor del día actual
    defaultEntryIntensity: 4,   // Intensidad por defecto, puede ser de 1 a 5
    intensityScaleStart: 10,    // Escala mínima de intensidad
    intensityScaleEnd: 100,     // Escala máxima de intensidad
    entries: [],                // Aquí se almacenan las entradas del calendario
}

// Loop de DataviewJS para recopilar las entradas
for (let page of dv.pages('').where(p => p.studiedLinux)) {
    calendarData.entries.push({
        date: page.file.name,           // Fecha en formato YYYY-MM-DD
        intensity: page.studiedLinux,   // Intensidad del hábito de estudiar Linux
        content: "",                  // Icono para representar el hábito en la celda
        color: "orangeToRed",                  // Color de la celda, basado en la definición de colores
    })
}

renderHeatmapCalendar(this.container, calendarData)

```



### Registro por Lista

```dataviewjs

// Buscar todas las notas en la raíz que tienen el campo studiedLinux
let notes = dv.pages('""').where(p => p.studiedLinux !== undefined);

dv.table(["Fecha", "Intensidad", "Descripción"], 
    notes
    .sort(n => n.file.name)
    .map(n => [n.file.name, n.studiedLinux, "🐧 Estudio de Linux"])
);

```

