#!/usr/bin/env fish

# Wallpaper setter with theme support
# Usage: wallpaper.fish <image_path>
# Works with yazi: passes full path, extracts filename for theme lookup

set -g WALL $argv[1]

if test -z "$WALL"
    echo "Uso: wallpaper.fish <ruta_imagen>"
    exit 1
end

# ---- Save selected wallpaper ----
echo $WALL >~/.wallpaper

# ---- Set wallpaper ----
if test -n "$WAYLAND_DISPLAY"
    awww clear-cache
    sleep 0.5
    awww img --transition-type any --transition-duration 1 $WALL
else
    feh --bg-scale $WALL
end

# ---- THEME MAPPING: wallpaper filename -> theme name ----
# Add your mappings here: "filename:theme_name"
# Themes are applied using: wal --theme <theme_name>
set -g THEME_MAP \
    "8.png:akahada" \
    "2.jpg:monochrome" \
    "9.png:inkwash" \
    "7.png:taoscuro" \
    "4.jpg:taoscuro" \
    "5.png:monochrome"
# ---- Extract filename from path (yazi passes full path) ----
set -g WALL_FILENAME (basename $WALL)

# ---- Check if wallpaper has a specific theme ----
set -g THEME_NAME ""
for mapping in $THEME_MAP
    set -l parts (string split ":" $mapping)
    set -l mapped_file $parts[1]
    set -l mapped_theme $parts[2]

    if test "$WALL_FILENAME" = "$mapped_file"
        set THEME_NAME $mapped_theme
        break
    end
end

# ---- Apply theme or generate from image ----
if test -n "$THEME_NAME"
    # ---- USE SPECIFIC THEME ----
    echo "🎨 Using theme: $THEME_NAME"
    wal --theme "$THEME_NAME" -n -q
else
    # ---- NO THEME: GENERATE FROM IMAGE ----
    echo "🎨 No specific theme, generating with pywal"
    wal -i "$WALL" -n -q
end

# ---- Update Cava colors ----
set -g WAL_COLORS "$HOME/.cache/wal/colors"
set -g CAVA_CONFIG "$HOME/.config/cava/config"

if test -f "$CAVA_CONFIG" -a -f "$WAL_COLORS"
    # Add [color] section if it doesn't exist
    if not grep -q "^\[color\]" "$CAVA_CONFIG"
        echo -e "\n[color]" >>"$CAVA_CONFIG"
    end

    # Enable gradient
    if grep -q "^gradient" "$CAVA_CONFIG"
        sed -i 's/^gradient = .*/gradient = 1/' "$CAVA_CONFIG"
    else
        echo "gradient = 1" >>"$CAVA_CONFIG"
    end

    # Update 8 gradient colors
    set -l i 1
    for color in (head -n 8 $WAL_COLORS)
        if grep -q "^gradient_color_$i" "$CAVA_CONFIG"
            sed -i "s|^gradient_color_$i = .*|gradient_color_$i = '$color'|" "$CAVA_CONFIG"
        else
            echo "gradient_color_$i = '$color'" >>"$CAVA_CONFIG"
        end
        set i (math $i + 1)
    end
end

# ---- Update Hyprlock wallpaper ----
set -l HYPRLOCK_CONF "$HOME/.config/hypr/hyprlock.conf"
if test -f "$HYPRLOCK_CONF"
    sed -i "s|^.*path *=.*|    path = $WALL|" "$HYPRLOCK_CONF"
end

# ---- Reload Kitty ----
pkill -SIGUSR1 kitty

hyprctl reload

echo "✅ Wallpaper applied: $WALL_FILENAME"
if test -n "$THEME_NAME"
    echo "   Theme: $THEME_NAME"
else
    echo "   Colors: pywal (generated from image)"
end
