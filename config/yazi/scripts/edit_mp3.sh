#!/bin/bash

file="$1"

clear
echo "Editando: $file"
echo

read -p "Título: " title
read -p "Artista: " artist
read -p "Álbum: " album
read -p "Género: " genre
read -p "Año: " year

eyeD3 \
  --title "$title" \
  --artist "$artist" \
  --album "$album" \
  --genre "$genre" \
  --release-year "$year" \
  "$file"

echo
echo "✅ ¡Metadatos actualizados!"
read -n 1 -s -r -p "Presiona cualquier tecla para volver..."
