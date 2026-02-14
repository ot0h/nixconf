#!/usr/bin/env bash

TEMP=$(sensors | grep -m 1 'Package id 0' | awk '{print $4}' | tr -d '+°C')

# fallback
if [[ -z "$TEMP" ]]; then
  CLASS="unknown"
  FORMAT="<span>  </span> N/A°C"
  printf '{"text":"%s","class":"%s"}\n' "$FORMAT" "$CLASS"
  exit 0
fi

# Convert TEMP to an integer (remove decimal part)
TEMP_INT=$(printf "%.0f" "$TEMP")

if ((TEMP_INT >= 70)); then
  CLASS="critical"
  FORMAT="<span>  </span> ${TEMP_INT}°C"
else
  CLASS="normal"
  FORMAT="<span> 󰴈 </span> ${TEMP_INT}°C"
fi

# print JSON with both text and class
printf '{"text":"%s","class":"%s"}\n' "$FORMAT" "$CLASS"
