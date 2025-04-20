const { authenticate } = require('@google-cloud/local-auth');
const path = require('path');
const fs = require('fs');
const os = require('os');

async function main() {
  try {
    // Detectar el sistema operativo
    const isWindows = os.platform() === 'win32';
    console.log(`Running on ${isWindows ? 'Windows' : 'Mac/Linux'}`);

    // Ruta absoluta al archivo de credenciales
    const credentialsPath = path.resolve(process.cwd(), 'gcp-oauth.keys.json');
    console.log('Using credentials from:', credentialsPath);
    
    // Autenticar
    const auth = await authenticate({
      keyfilePath: credentialsPath,
      scopes: ['https://www.googleapis.com/auth/drive.readonly']
    });
    
    console.log('Authentication successful!');
    
    // Leer el archivo de credenciales original
    const originalCredentials = JSON.parse(fs.readFileSync(credentialsPath, 'utf8'));
    
    // Crear las credenciales en el formato que espera el servidor
    const serverCredentials = {
      installed: {
        client_id: originalCredentials.installed.client_id,
        client_secret: originalCredentials.installed.client_secret,
        redirect_uris: originalCredentials.installed.redirect_uris,
        auth_uri: originalCredentials.installed.auth_uri,
        token_uri: originalCredentials.installed.token_uri
      }
    };
    
    // Guardar las credenciales en la ubicación esperada por el servidor
    const serverCredentialsPath = path.resolve(process.cwd(), '.gdrive-server-credentials.json');
    fs.writeFileSync(serverCredentialsPath, JSON.stringify(serverCredentials, null, 2));
    console.log('Credentials saved to:', serverCredentialsPath);

    // Configurar la variable de entorno según el sistema operativo
    if (isWindows) {
      console.log('Run the following command to set the credentials path:');
      console.log(`set GDRIVE_CREDENTIALS_PATH=${serverCredentialsPath}`);
    } else {
      console.log('Run the following command to set the credentials path:');
      console.log(`export GDRIVE_CREDENTIALS_PATH=${serverCredentialsPath}`);
    }
    
    console.log('\nNow you can start the server with:');
    console.log('npm start');
  } catch (error) {
    console.error('Authentication failed:', error);
  }
}

main(); 