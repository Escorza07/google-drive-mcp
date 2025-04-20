#!/bin/bash

# Colores para la salida
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${GREEN}=== Configuración del Servidor MCP de Google Drive ===${NC}"
echo ""

# Verificar si npx está instalado
if ! command -v npx &> /dev/null; then
    echo -e "${RED}Error: npx no está instalado. Por favor, instala Node.js y npm.${NC}"
    exit 1
fi

echo -e "${GREEN}Paso 1: Verificando dependencias...${NC}"
# Verificar si el paquete está disponible
if npx -y @modelcontextprotocol/server-gdrive --version &> /dev/null; then
    echo -e "${GREEN}✓ El paquete @modelcontextprotocol/server-gdrive está disponible.${NC}"
else
    echo -e "${YELLOW}! No se pudo verificar el paquete. Continuando de todos modos...${NC}"
fi

echo ""
echo -e "${GREEN}Paso 2: Integración con Claude Desktop${NC}"
echo -e "Para integrar el servidor MCP de Google Drive con Claude Desktop:"
echo ""
echo -e "1. Copia el contenido del archivo ${YELLOW}claude_desktop_config_updated.json${NC}"
echo -e "2. Pégalo en tu archivo de configuración de Claude Desktop:"
echo -e "   ${YELLOW}~/Library/Application Support/Claude/claude_desktop_config.json${NC}"
echo -e "   (o añade solo la sección 'gdrive' si ya tienes otros servidores configurados)"
echo -e "3. Reinicia Claude Desktop para que los cambios surtan efecto"
echo ""

echo -e "${GREEN}Paso 3: Integración con Cline (VSCode)${NC}"
echo -e "Para integrar el servidor MCP de Google Drive con Cline:"
echo ""
echo -e "1. Copia el contenido del archivo ${YELLOW}cline_mcp_settings_updated.json${NC}"
echo -e "2. Pégalo en tu archivo de configuración de Cline:"
echo -e "   ${YELLOW}~/Library/Application Support/Code/User/globalStorage/saoudrizwan.claude-dev/settings/cline_mcp_settings.json${NC}"
echo -e "   (o añade solo la sección 'gdrive' si ya tienes otros servidores configurados)"
echo -e "3. Reinicia VSCode para que los cambios surtan efecto"
echo ""

echo -e "${GREEN}Paso 4: Prueba de funcionamiento${NC}"
echo -e "Para probar que el servidor funciona correctamente:"
echo ""
echo -e "1. En Claude Desktop o Cline, pregunta algo como:"
echo -e "   ${YELLOW}\"Busca en mi Google Drive documentos sobre marketing\"${NC}"
echo -e "   o ${YELLOW}\"Muéstrame el contenido del documento X en mi Google Drive\"${NC}"
echo -e "2. Claude debería poder acceder a tus archivos de Google Drive y mostrar los resultados"
echo ""

echo -e "${GREEN}¡Configuración completada!${NC}"
echo -e "Para iniciar el servidor manualmente (opcional), ejecuta: ${YELLOW}npm run start${NC}"
