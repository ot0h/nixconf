#!/bin/bash

# --- CONFIGURACIÓN ---
GHOSTTY_CONFIG="/home/rimv/dotfiles/.config/ghostty/configs/background.conf"
KITTY_CONFIG="/home/rimv/dotfiles/.config/kitty/kitty.conf"

# 1. Detectar ventana activa
ACTIVE_INFO=$(hyprctl activewindow -j)
ACTIVE_CLASS=$(echo "$ACTIVE_INFO" | jq -r '.class')

# --- CASO 1: GHOSTTY ---
if [[ "$ACTIVE_CLASS" == "com.mitchellh.ghostty" ]]; then
  CURRENT_OPACITY=$(grep "^background-opacity =" "$GHOSTTY_CONFIG" | cut -d'=' -f2 | xargs)
  [[ "$CURRENT_OPACITY" == "1" || "$CURRENT_OPACITY" == "1.0" ]] && NEW_OPACITY="0.7" || NEW_OPACITY="1.0"

  sed -i "s/^background-opacity =.*/background-opacity = $NEW_OPACITY/" "$GHOSTTY_CONFIG"
  pkill -SIGUSR2 ghostty

# --- CASO 2: KITTY ---
elif [[ "$ACTIVE_CLASS" == "kitty" ]]; then
  CURRENT_OPACITY=$(grep "^background_opacity " "$KITTY_CONFIG" | awk '{print $2}' | xargs)
  [[ "$CURRENT_OPACITY" == "1" || "$CURRENT_OPACITY" == "1.0" ]] && NEW_OPACITY="0.7" || NEW_OPACITY="1.0"

  sed -i "s/^background_opacity .*/background_opacity $NEW_OPACITY/" "$KITTY_CONFIG"

  # En Kitty, la señal estándar para recargar configuración es SIGUSR1
  pkill -SIGUSR1 kitty
fi
