#!/usr/bin/env bash

KITTY_CONFIG="$HOME/.config/kitty/kitty.conf"

# Detectar clase activa
ACTIVE_CLASS=$(hyprctl activewindow -j | jq -r '.class')

# Solo si la ventana activa es Kitty
if [[ "$ACTIVE_CLASS" == "kitty" ]]; then

    CURRENT_OPACITY=$(grep "^background_opacity " "$KITTY_CONFIG" | awk '{print $2}')

    if [[ "$CURRENT_OPACITY" == "1" || "$CURRENT_OPACITY" == "1.0" ]]; then
        NEW_OPACITY="0.7"
    else
        NEW_OPACITY="1.0"
    fi

    sed -i "s/^background_opacity .*/background_opacity $NEW_OPACITY/" "$KITTY_CONFIG"

    # Recargar configuración
    pkill -SIGUSR1 kitty
fi

