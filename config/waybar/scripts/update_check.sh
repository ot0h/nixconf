#!/bin/zsh

# Verifica si los comandos necesarios están disponibles
for cmd in checkupdates yay; do
  if ! command -v $cmd &>/dev/null; then
    echo "⚠️"
    exit 1
  fi
done

# Cuenta actualizaciones
pacman_count=$(checkupdates 2>/dev/null | wc -l | tr -d ' ')
aur_count=$(yay -Qua 2>/dev/null | wc -l | tr -d ' ')

# Total de actualizaciones
total=$((pacman_count + aur_count))

# Mostrar ícono + número si hay actualizaciones
if [[ $total -gt 0 ]]; then
  echo "$total 󰁡"
else
  echo ""
fi

