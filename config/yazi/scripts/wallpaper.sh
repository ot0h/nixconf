#!/bin/bash

WALL="$1"

if [ -z "$WALL" ]; then
  echo "Uso: set-wallpaper.sh <ruta_imagen>"
  exit 1
fi

# Guardar el wallpaper seleccionado en un archivo
echo "$WALL" >~/.wallpaper

# Cambiar wallpaper
if [ -n "$WAYLAND_DISPLAY" ]; then
  swww clear-cache
  sleep 0.5
  swww img --transition-type any --transition-duration 1 "$WALL"
else
  feh --bg-scale "$WALL"
fi

# Generar paleta de colores con pywal
wal -i "$WALL" -n -q

# Ruta de la paleta y config de cava
WAL_COLORS="$HOME/.cache/wal/colors"
CAVA_CONFIG="$HOME/.config/cava/config"

# Actualizar colores en Cava
if [ -f "$CAVA_CONFIG" ] && [ -f "$WAL_COLORS" ]; then
  # Añadir sección [color] si no existe
  if ! grep -q "^\[color\]" "$CAVA_CONFIG"; then
    echo -e "\n[color]" >>"$CAVA_CONFIG"
  fi

  # Activar gradiente (si existe la línea, la reemplaza)
  if grep -q "^gradient" "$CAVA_CONFIG"; then
    sed -i 's/^gradient = .*/gradient = 1/' "$CAVA_CONFIG"
  else
    echo "gradient = 1" >>"$CAVA_CONFIG"
  fi

  # Actualizar 8 colores del gradiente
  i=1
  for color in $(head -n 8 "$WAL_COLORS"); do
    if grep -q "^gradient_color_$i" "$CAVA_CONFIG"; then
      # Reemplazar valor existente
      sed -i "s/^gradient_color_$i = .*/gradient_color_$i = '$color'/" "$CAVA_CONFIG"
    else
      # Agregar si no existe
      echo "gradient_color_$i = '$color'" >>"$CAVA_CONFIG"
    fi
    ((i++))
  done
fi

# --- Actualizar tema de Spotify con Spicetify ---
THEME_PATH="$HOME/.config/spicetify/Themes/Pywal/color.ini"
# ~/.cache/wal/colors.json="~/.cache/wal/colors.json"

# Tomar los colores de Pywal y quitar #
BACKGROUND=$(jq -r '.special.background' ~/.cache/wal/colors.json | tr -d '#')
FOREGROUND=$(jq -r '.colors.color8' ~/.cache/wal/colors.json | tr -d '#')
TEXT=$(jq -r '.colors.color8' ~/.cache/wal/colors.json | tr -d '#')
SUBTEXT=$(jq -r '.colors.color1' ~/.cache/wal/colors.json | tr -d '#')
HIGHLIGHT=$(jq -r '.colors.color11' ~/.cache/wal/colors.json | tr -d '#')
SIDEBAR=$(jq -r '.colors.color9' ~/.cache/wal/colors.json | tr -d '#')
BUTTON=$(jq -r '.colors.color13' ~/.cache/wal/colors.json | tr -d '#')
MAIN=$(jq -r '.colors.color4' ~/.cache/wal/colors.json | tr -d '#')
PLAYER=$(jq -r '.colors.color9' ~/.cache/wal/colors.json | tr -d '#')
CARD=$(jq -r '.colors.color11' ~/.cache/wal/colors.json | tr -d '#')
SHADOW=$(jq -r '.colors.color15' ~/.cache/wal/colors.json | tr -d '#')
SELECTED=$(jq -r '.colors.color3' ~/.cache/wal/colors.json | tr -d '#')
TAB=$(jq -r '.colors.color11' ~/.cache/wal/colors.json | tr -d '#')
NOTIFICATION=$(jq -r '.colors.color9' ~/.cache/wal/colors.json | tr -d '#')
EQUALIZER=$(jq -r '.colors.color7' ~/.cache/wal/colors.json | tr -d '#')
MISC=$(jq -r '.colors.color13' ~/.cache/wal/colors.json | tr -d '#')
# Reemplazar colores en color.ini (sin comillas ni #)
sed -i "s/^background =.*/background = $BACKGROUND/" "$THEME_PATH"
sed -i "s/^foreground =.*/foreground = $FOREGROUND/" "$THEME_PATH"
sed -i "s/^text =.*/text = $TEXT/" "$THEME_PATH"
sed -i "s/^subtext =.*/subtext = $SUBTEXT/" "$THEME_PATH"
sed -i "s/^highlight =.*/highlight = $HIGHLIGHT/" "$THEME_PATH"
sed -i "s/^sidebar =.*/sidebar = $SIDEBAR/" "$THEME_PATH"
sed -i "s/^button =.*/button = $BUTTON/" "$THEME_PATH"
sed -i "s/^main =.*/main = $MAIN/" "$THEME_PATH"
sed -i "s/^player =.*/player = $PLAYER/" "$THEME_PATH"
sed -i "s/^card =.*/card = $CARD/" "$THEME_PATH"
sed -i "s/^shadow =.*/shadow = $SHADOW/" "$THEME_PATH"
sed -i "s/^selected =.*/selected = $SELECTED/" "$THEME_PATH"
sed -i "s/^tab =.*/tab = $TAB/" "$THEME_PATH"
sed -i "s/^notification =.*/notification = $NOTIFICATION/" "$THEME_PATH"
sed -i "s/^equalizer =.*/equalizer = $EQUALIZER/" "$THEME_PATH"
sed -i "s/^misc =.*/misc = $MISC/" "$THEME_PATH"

# Aplicar el tema
spicetify apply

# Recargar Waybar
killall waybar && waybar &

# Recargar wofi (simplemente lo matamos para que al abrir recargue)
killall wofi

killall rofi
# Recargar kitty (si tienes config_reload_on_change yes)
pkill -SIGUSR1 kitty

# Actualizar el Hyprlock
sed -i "s|^.*path *=.*|    path = $WALL|" ~/.config/hypr/hyprlock.conf
