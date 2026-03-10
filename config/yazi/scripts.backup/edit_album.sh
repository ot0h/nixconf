#!/bin/bash

folder="$1"

if [ ! -d "$folder" ]; then
  echo "❌ Esto no es una carpeta."
  read -n 1 -s -r -p "Presiona cualquier tecla para salir..."
  exit 1
fi

clear
echo "🎵 Editar metadatos de canciones en: $folder"
echo

read -p "🎤 Artista (común): " artist
read -p "💿 Álbum (común): " album
read -p "🎼 Género (común): " genre
read -p "📅 Año (común): " year

echo -e "\n🔁 Editando cada canción...\n"

shopt -s nullglob
for file in "$folder"/*.mp3; do
  base=$(basename "$file")
  echo "🎧 Archivo: $base"

  read -p "   🎵 Título: " title
  read -p "   🔢 Número de pista: " track

  eyeD3 \
    --title "$title" \
    --artist "$artist" \
    --album "$album" \
    --genre "$genre" \
    --release-year "$year" \
    --track "$track" \
    "$file"

  echo "✅ Editado: $base"
  echo
done

echo "🚀 ¡Todos los archivos han sido procesados!"
read -n 1 -s -r -p "Presiona cualquier tecla para volver..."
