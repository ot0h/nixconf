#!/bin/bash

# Wallpaper setter with theme support
# Usage: wallpaper.sh <image_path>
# Works with yazi: passes full path, extracts filename for theme lookup

WALL="$1"

if [ -z "$WALL" ]; then
    echo "Uso: wallpaper.sh <ruta_imagen>"
    exit 1
fi

# ---- Save selected wallpaper ----
echo "$WALL" > ~/.wallpaper

# ---- Set wallpaper ----
if [ -n "$WAYLAND_DISPLAY" ]; then
    # Ensure awww daemon is running (timeout 5s para no colgarse)
    if ! pgrep -x awww > /dev/null 2>&1; then
        timeout 5 awww init 2>/dev/null || true
        sleep 0.5
    fi
    awww clear-cache
    sleep 0.5
    awww img --transition-type any --transition-duration 1 "$WALL"
else
    feh --bg-scale "$WALL"
fi

# ---- THEME MAPPING: wallpaper filename -> theme name ----
# Add your mappings here: "filename:theme_name"
# Themes are applied using: wal --theme <theme_name>
declare -A THEME_MAP=(
    ["8.png"]="akahada"
    ["2.jpg"]="monochrome"
    ["9.png"]="inkwash"
    ["7.png"]="shadow"
    ["4.jpg"]="monochrome"
    ["5.png"]="monochrome"
)

# ---- Extract filename from path (yazi passes full path) ----
WALL_FILENAME=$(basename "$WALL")

# ---- Check if wallpaper has a specific theme ----
THEME_NAME=""
if [ -n "${THEME_MAP[$WALL_FILENAME]}" ]; then
    THEME_NAME="${THEME_MAP[$WALL_FILENAME]}"
fi

# ---- Apply theme or generate from image ----
if [ -n "$THEME_NAME" ]; then
    # ---- USE SPECIFIC THEME ----
    echo "🎨 Using theme: $THEME_NAME"
    wal --theme "$THEME_NAME" -n -q
else
    # ---- NO THEME: GENERATE FROM IMAGE ----
    echo "🎨 No specific theme, generating with pywal"
    wal -i "$WALL" -n -q
fi

# ---- Update Cava colors ----
WAL_COLORS="$HOME/.cache/wal/colors"
CAVA_CONFIG="$HOME/.config/cava/config"

if [ -f "$CAVA_CONFIG" ] && [ -f "$WAL_COLORS" ]; then
    # Add [color] section if it doesn't exist
    if ! grep -q "^\[color\]" "$CAVA_CONFIG"; then
        echo -e "\n[color]" >> "$CAVA_CONFIG"
    fi

    # Enable gradient
    if grep -q "^gradient" "$CAVA_CONFIG"; then
        sed -i 's/^gradient = .*/gradient = 1/' "$CAVA_CONFIG"
    else
        echo "gradient = 1" >> "$CAVA_CONFIG"
    fi

    # Update 8 gradient colors
    i=1
    while IFS= read -r color && [ $i -le 8 ]; do
        if grep -q "^gradient_color_$i" "$CAVA_CONFIG"; then
            sed -i "s|^gradient_color_$i = .*|gradient_color_$i = '$color'|" "$CAVA_CONFIG"
        else
            echo "gradient_color_$i = '$color'" >> "$CAVA_CONFIG"
        fi
        ((i++))
    done < <(head -n 8 "$WAL_COLORS")
fi

# ---- Update Hyprlock wallpaper ----
HYPRLOCK_CONF="$HOME/.config/hypr/hyprlock.conf"
if [ -f "$HYPRLOCK_CONF" ]; then
    sed -i "s|^.*path *=.*|    path = $WALL|" "$HYPRLOCK_CONF"
fi

# ---- Reload Kitty ----
pkill -SIGUSR1 kitty

hyprctl reload

echo " Wallpaper applied: $WALL_FILENAME"
if [ -n "$THEME_NAME" ]; then
    echo "   Theme: $THEME_NAME"
else
    echo "   Colors: pywal (generated from image)"
fi
