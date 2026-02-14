#!/bin/bash

if pgrep -x "hyprsunset" >/dev/null; then
  killall -9 hyprsunset
  notify-send "Modo Nocturno Off" -u "low"
else
  hyprsunset -t 2500 &
  notify-send "Modo Nocturno On" -u "low"
fi
