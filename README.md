# Servidor MCP de Google Drive

Este proyecto integra un servidor MCP con Google Drive para permitir listar, leer y buscar archivos. Funciona tanto en Windows como en Mac/Linux.

## Componentes

### Herramientas
- **search**: Buscar archivos en Google Drive
  - Entrada: query (string): Consulta de búsqueda
  - Devuelve nombres de archivos y tipos MIME de los archivos coincidentes

### Recursos
El servidor proporciona acceso a archivos de Google Drive:

- Archivos (gdrive:///<file_id>)
  - Soporta todos los tipos de archivos
  - Los archivos de Google Workspace se exportan automáticamente:
    - Docs → Markdown
    - Sheets → CSV
    - Presentations → Texto plano
    - Drawings → PNG
  - Otros archivos se proporcionan en su formato nativo

## Instalación y Configuración

### Requisitos Previos
1. Node.js instalado
2. Cuenta de Google con acceso a Google Drive
3. Proyecto en Google Cloud Platform con la API de Google Drive habilitada

### Configuración de Credenciales
1. Copia el archivo `gcp-oauth.keys.example.json` a `gcp-oauth.keys.json`
2. Reemplaza los valores de ejemplo con tus credenciales reales:
   - `TU_CLIENT_ID`: Tu Client ID de Google Cloud
   - `TU_CLIENT_SECRET`: Tu Client Secret de Google Cloud
   - `tu-project-id`: El ID de tu proyecto en Google Cloud

### Instalación
```bash
npm install
```

### Autenticación
```bash
npm run auth
```
Este comando:
- Abrirá una ventana del navegador para autenticarte con Google
- Generará el archivo `.gdrive-server-credentials.json`
- Funciona tanto en Windows como en Mac/Linux

### Iniciar el Servidor
```bash
npm start
```

## Uso en Diferentes Sistemas Operativos

### Windows
1. Instala las dependencias:
   ```bash
   npm install
   ```

2. Configura las credenciales:
   ```bash
   npm run auth
   ```

3. Inicia el servidor:
   ```bash
   npm start
   ```

### Mac/Linux
1. Instala las dependencias:
   ```bash
   npm install
   ```

2. Configura las credenciales:
   ```bash
   npm run auth
   ```

3. Inicia el servidor:
   ```bash
   npm start
   ```

## Archivos Importantes
- `gcp-oauth.keys.json`: Credenciales de Google Cloud (no subir a GitHub)
- `.gdrive-server-credentials.json`: Tokens de autenticación (generado automáticamente)
- `auth.js`: Script de autenticación personalizado

## Solución de Problemas

### Problemas Comunes
1. **Error de credenciales no encontradas**
   - Asegúrate de que `gcp-oauth.keys.json` existe en la raíz del proyecto
   - Verifica que las credenciales sean correctas

2. **Error de autenticación**
   - Verifica que la API de Google Drive esté habilitada en tu proyecto
   - Asegúrate de que las URIs de redirección sean correctas

3. **Problemas en Windows**
   - Si hay problemas con las rutas, verifica que no haya espacios en las rutas
   - Asegúrate de que Node.js esté instalado correctamente

## Licencia
Este servidor MCP está licenciado bajo la Licencia MIT. Esto significa que eres libre de usar, modificar y distribuir el software, sujeto a los términos y condiciones de la Licencia MIT.
