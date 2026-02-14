#!/bin/bash

DEST="$HOME/Pictures/Screenshots"
mkdir -p "$DEST"

CHOICE=$(printf "Fullscreen\nRegion\nActive Window\nClipboard (Region)\nColor Picker" | rofi -dmenu -p "∂")

case "$CHOICE" in
"Fullscreen")
  hyprshot -m output -s -o "$DEST"
  notify-send "  Captura de pantalla" "Modo: Pantalla completa guardado en $DEST"
  ;;
"Region")
  hyprshot -m region -s -D 1 -o "$DEST"
  notify-send "  Captura de pantalla" "Modo: Región guardado en $DEST"
  ;;
"Active Window")
  hyprshot -m window -s -o "$DEST"
  notify-send "  Captura de pantalla" "Modo: Ventana activa guardado en $DEST"
  ;;
"Clipboard (Region)")
  hyprshot -m region --clipboard-only -s -o "$DEST"
  notify-send " Copiada al portapapeles"
  ;;
"Color Picker")
  COLOR=$(hyprpicker)
  echo "$COLOR" | wl-copy
  notify-send "  Color copiado" "<span background=\"$COLOR\" foreground=\"white\">$COLOR</span>"
  ;;
*)
  exit 0
  ;;
esac
