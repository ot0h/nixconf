#!/bin/bash

STATE=$(hyprctl -j getoption decoration:active_opacity | jq ".float")

if awk "BEGIN {exit !(${STATE} >= 0.9)}"; then
  hyprctl keyword decoration:active_opacity 0.7
  hyprctl keyword decoration:inactive_opacity 0.6
else
  hyprctl keyword decoration:active_opacity 1.0
  hyprctl keyword decoration:inactive_opacity 0.9
fi
