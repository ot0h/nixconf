#!/bin/bash

WAYBAR_DIR="/home/otoh/.config/waybar"

# Get list of layout directories
LAYOUTS=($(ls -1 "$WAYBAR_DIR/layouts/" | sort -V))

# Get current layout directory
CURRENT_DIR=$(readlink "$WAYBAR_DIR/config.jsonc" | sed 's|.*/layouts/\([^/]*\)/.*|\1|')

# Find current index
CURRENT_INDEX=-1
for i in "${!LAYOUTS[@]}"; do
  if [ "${LAYOUTS[$i]}" = "$CURRENT_DIR" ]; then
    CURRENT_INDEX=$i
    break
  fi
done

# If not found, start from 1 if available, else 0
if [ $CURRENT_INDEX -eq -1 ]; then
  if [ ${#LAYOUTS[@]} -gt 1 ]; then
    NEXT_INDEX=1
  else
    NEXT_INDEX=0
  fi
else
  NEXT_INDEX=$(( (CURRENT_INDEX + 1) % ${#LAYOUTS[@]} ))
fi

NEXT_LAYOUT=${LAYOUTS[$NEXT_INDEX]}

echo "Switching to layout $NEXT_LAYOUT"

# Switch to next layout
ln -sf "$WAYBAR_DIR/layouts/$NEXT_LAYOUT/config.jsonc" "$WAYBAR_DIR/config.jsonc"
ln -sf "$WAYBAR_DIR/layouts/$NEXT_LAYOUT/style.css" "$WAYBAR_DIR/style.css"

pkill -x waybar
while pgrep -x waybar > /dev/null; do
  sleep 0.1
done
waybar &
