#!/bin/bash

# Read values from /proc/meminfo
while read -r key value _; do
  case "$key" in
  MemTotal:) total=$value ;;
  MemFree:) free=$value ;;
  Buffers:) buffers=$value ;;
  "Active(file):") active_file=$value ;;
  "Inactive(file):") inactive_file=$value ;;
  SReclaimable:) sreclaimable=$value ;;
  esac
done </proc/meminfo

# htop-style used memory (kB)
used=$((total - (free + buffers + active_file + inactive_file + sreclaimable)))

# Calculate percentage
percentage=$(awk -v used=$used -v total=$total 'BEGIN {printf "%.0f%%", (used/total)*100}')

# Set memory string to percentage
mem_str="$percentage"

# Output JSON for Waybar
echo "{\"text\": \"$mem_str\"}"
