#!/bin/zsh

# Verifica si los comandos necesarios están disponibles
for cmd in checkupdates yay notify-send; do
  if ! command -v $cmd &>/dev/null; then
    notify-send "❌ El comando '$cmd' no está instalado."
    exit 1
  fi
done

# Recolecta actualizaciones
pacman_updates=$(checkupdates)
aur_updates=$(yay -Qua)

# Verifica si hay actualizaciones
if [[ -z "$pacman_updates" && -z "$aur_updates" ]]; then
  notify-send " Sistema actualizado" "No hay actualizaciones disponibles."
  exit 0
fi

# Hay actualizaciones, se abre kitty para mostrarlas y confirmar instalación
kitty -e zsh -c "
  echo '󰮯 Updates de Pacman:'
  echo '${pacman_updates:-Ninguna}'
  echo ''
  echo ' Updates de AUR:'
  echo '${aur_updates:-Ninguna}'
  echo ''
  read 'respuesta?¿Deseas actualizar ahora? (s/N): '
  if [[ \$respuesta == [sS] ]]; then
    echo ''
    echo '󰚰 Iniciando actualización del sistema...'
    sudo pacman -Syu && yay -Syu
  else
    echo '󰜺 Actualización cancelada por el usuario.'
    exit 0
  fi
  echo ''
  read -k \"Presiona cualquier tecla para salir...\"
"
