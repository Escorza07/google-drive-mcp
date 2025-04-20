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

### Configuración de Google Cloud Platform
1. Crea un proyecto en [Google Cloud Console](https://console.cloud.google.com/)
2. Habilita la API de Google Drive
3. Crea credenciales OAuth 2.0:
   - Tipo de aplicación: Aplicación de escritorio
   - Agrega las siguientes URLs de redirección:
     - `http://localhost:3000/oauth2callback`
     - `http://localhost:4100/code`
4. Reemplaza las credenciales en `gcp-oauth.keys.json` con tus propias credenciales

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
- `gcp-oauth.keys.json`: Credenciales de Google Cloud (debe estar en el repositorio)
- `.gdrive-server-credentials.json`: Tokens de autenticación (generado automáticamente)
- `auth.js`: Script de autenticación personalizado

## Solución de Problemas

### Problemas Comunes
1. **Error de credenciales no encontradas**
   - Asegúrate de que `gcp-oauth.keys.json` existe en la raíz del proyecto
   - Verifica que las credenciales en el archivo sean correctas

2. **Error de autenticación**
   - Verifica que las credenciales de Google Cloud sean correctas
   - Asegúrate de que las URLs de redirección estén configuradas correctamente en Google Cloud Console

3. **Error de permisos**
   - Verifica que tu cuenta de Google tenga los permisos necesarios
   - Asegúrate de que el proyecto en Google Cloud tenga las APIs necesarias habilitadas

## Licencia
Este servidor MCP está licenciado bajo la Licencia MIT. Esto significa que eres libre de usar, modificar y distribuir el software, sujeto a los términos y condiciones de la Licencia MIT.
