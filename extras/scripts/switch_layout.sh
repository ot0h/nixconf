#!/bin/bash

# Check if hyprctl is available
if ! command -v hyprctl &>/dev/null; then
  notify-send "Error: hyprctl not found"
  exit 1
fi

CHOICE=$(printf "Dwindle\nMaster\nScrolling\nhy3" | rofi -dmenu -p "Layout")

case "$CHOICE" in
"Dwindle")
  ln -sf ~/.config/hypr/conf/keybinds_layouts/Dwindle_Master/keybinds.conf ~/.config/hypr/conf/keybinds.conf
  sed -i '/general {/,/}/ s/layout = .*/layout = dwindle/' ~/.config/hypr/hyprland.conf
  hyprctl reload
  output=$(hyprctl dispatch layoutmsg layout dwindle 2>&1)
  if [ "$output" = "ok" ]; then
    notify-send "Layout switched to: dwindle"
  else
    notify-send "Error switching layout: $output"
  fi
  ;;
"Master")
  ln -sf ~/.config/hypr/conf/keybinds_layouts/Dwindle_Master/keybinds.conf ~/.config/hypr/conf/keybinds.conf
  sed -i '/general {/,/}/ s/layout = .*/layout = master/' ~/.config/hypr/hyprland.conf
  hyprctl reload
  output=$(hyprctl dispatch layoutmsg layout master 2>&1)
  if [ "$output" = "ok" ]; then
    notify-send "Layout switched to: master"
  else
    notify-send "Error switching layout: $output"
  fi
  ;;
"Scrolling")
  ln -sf ~/.config/hypr/conf/keybinds_layouts/hyprscrolling/keybinds.conf ~/.config/hypr/conf/keybinds.conf
  sed -i '/general {/,/}/ s/layout = .*/layout = scrolling/' ~/.config/hypr/hyprland.conf
  hyprctl reload
  output=$(hyprctl dispatch layoutmsg layout scrolling 2>&1)
  if [ "$output" = "ok" ]; then
    notify-send "Layout switched to: scrolling"
  else
    notify-send "Error switching layout: $output"
  fi
  ;;
"hy3")
  ln -sf ~/.config/hypr/conf/keybinds_layouts/hy3/keybinds.conf ~/.config/hypr/conf/keybinds.conf
  sed -i '/general {/,/}/ s/layout = .*/layout = hy3/' ~/.config/hypr/hyprland.conf
  hyprctl reload
  output=$(hyprctl dispatch layoutmsg layout hy3 2>&1)
  if [ "$output" = "ok" ]; then
    notify-send "Layout switched to: hy3"
  else
    notify-send "Error switching layout: $output"
  fi
  ;;
*)
  exit 0
  ;;
esac
