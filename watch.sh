#!/bin/bash
TARGET="/home/asus-admin/blog_carmiña/content/"

echo "Vigilando la carpeta: $TARGET"

# La clave es el -m (monitor) para que se quede escuchando siempre
inotifywait -m -r -e modify,create,delete "$TARGET" | while read path action file; do
    echo "DETECTADO CAMBIO EN: $file. REDESPLEGANDO..."
    cd ~/blog_carmiña
    ./deploy.sh
    echo "Hecho. Esperando más cambios..."
done
