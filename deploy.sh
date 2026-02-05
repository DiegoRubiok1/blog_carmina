#!/bin/bash

# 1. Borrar la carpeta public antigua para evitar fantasmas
rm -rf public

# 2. Generar el sitio nuevo
echo "Generando sitio estático..."
hugo

# 3. Copiar a la carpeta de Nginx (Sincronización inteligente)
echo "Publicando en el servidor..."
# Usamos rsync porque es más listo que cp (solo copia lo que ha cambiado)
rsync -av public/ /var/www/blog_carmina/

echo "¡Blog actualizado con éxito!"
