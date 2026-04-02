# Embudo - Importa todos los módulos de paquetes automáticamente
{ pkgs, ... }: {
  imports = [
    # CLI utilities
    ./utilidades/cli.nix
    ./utilidades/system-utils.nix
    ./utilidades/linux-tools.nix

    # Shell
    ./shell/shell.nix

    # Editors
    ./editors/editors.nix
    ./editors/specialized.nix

    # Dev tools
    ./dev-tools/dev-tools.nix
    ./dev-tools/nix-tools.nix

    # Programación
    ./programacion/basics.nix

    # Entretenimiento
    ./entretenimiento/multimedia.nix
    ./entretenimiento/recording.nix

    # Oficina
    ./oficina/oficina.nix

    # File management
    ./file-management/file-management.nix

    # Hardware
    ./hardware/hardware.nix

    # Themes
    ./themes/themes.nix
  ];
}