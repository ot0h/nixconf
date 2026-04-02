# Módulos específicos para laptop-dell
{ pkgs, ... }: {
  imports = [
    # Desktop
    ../../modules/desktop/default.nix

    # Editors
    ../../modules/editors/default.nix

    # CLI tools
    ../../modules/cli-tools/default.nix

    # Multimedia
    ../../modules/multimedia/default.nix
    ../../modules/entretenimiento/default.nix

    # Oficina
    ../../modules/oficina/default.nix

    # File management
    ../../modules/file-management/default.nix

    # Themes
    ../../modules/themes/default.nix

    # Dev tools
    ../../modules/dev-tools/default.nix

    # Shell
    ../../modules/shell/default.nix

    # Programación
    ../../modules/programacion/default.nix

    # Utilidades
    ../../modules/utilidades/default.nix

    # Hardware
    ../../modules/hardware/default.nix

    # Configs
    ../../modules/configs/fonts.nix

    # Paquetes específicos de laptop-dell (localsend, nwg-look)
    ./extra-packages.nix
  ];
}