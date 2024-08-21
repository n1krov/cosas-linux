
## Tema de Registrar Habitos

> **Nota:** Necesitas tener `DataView`y `Heatmap Calendar`. Complementos comunitarios que puedes descargar en Obsidian.

### 1. **Metadatos en las Páginas (Frontmatter YAML):**
   - **Frontmatter**: Puedes agregar metadatos en la parte superior de tus notas usando el formato YAML. Por ejemplo:

   ```markdown
   ---
   studiedLinux: 3
   ---
   ```

   Este formato es ideal para definir metadatos que aplican a toda la nota y es automáticamente indexado por Dataview.

### 2. **Campos en Línea (Inline Fields):**
   - Puedes usar campos en línea en cualquier parte de tu nota usando la sintaxis `Clave:: Valor`. Esto es útil si quieres que los datos estén más integrados en el contenido de tu nota. Ejemplo:

   ```markdown
   Hoy estudié Linux por 2 horas [studiedLinux:: 2]
   ```

   - Para tareas o elementos de lista, puedes agregar metadatos directamente con la misma sintaxis:
