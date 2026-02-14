#!/bin/bash

if [ "$1" == "toggle" ]; then
  if pgrep -x "hypridle" >/dev/null; then
    killall hypridle
    notify-send "Idle" "Idle disabled"
  else
    hypridle &
    notify-send "Idle" "Idle enabled"
  fi
else
  if pgrep -x "hypridle" >/dev/null; then
    echo '{"text": "󰒲", "tooltip": "Idle active"}'
  else
    echo '{"text": "󰒳", "tooltip": "Idle inactive"}'
  fi
fi
