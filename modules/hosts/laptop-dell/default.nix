# Módulos específicos para laptop-dell
# Agregar aquí módulos que solo aplican a este host
{ pkgs, ... }: {
  imports = [
    # Desktop
    ../../desktop/default.nix

    # Editors
    ../../editors/default.nix

    # CLI tools
    ../../cli-tools/default.nix

    # Multimedia
    ../../multimedia/default.nix
    ../../entretenimiento/default.nix

    # Oficina
    ../../oficina/default.nix

    # File management
    ../../file-management/default.nix

    # Themes
    ../../themes/default.nix

    # Dev tools
    ../../dev-tools/default.nix

    # Shell
    ../../shell/default.nix

    # Programación
    ../../programacion/default.nix

    # Utilidades
    ../../utilidades/default.nix

    # Hardware
    ../../hardware/default.nix

    # Configs
    ../../configs/fonts.nix
  ];
}