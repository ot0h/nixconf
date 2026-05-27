#!/usr/bin/env fish

if pgrep -x hyprsunset >/dev/null
    pkill -9 hyprsunset
    notify-send "󰹏 Modo Nocturno Off" -u low -a Hyprsunset
else
    hyprsunset -t 2500 &
    notify-send " Modo Nocturno On" -u low -a Hyprsunset
end
