# Embudo general - importa todos los módulos automáticamente
{ pkgs, ... }: {
  imports = [
    # Desktop
    ./desktop/ags.nix
    ./desktop/hyprland.nix

    # Editors
    ./editors/neovim.nix
    ./editors/default.nix

    # CLI tools
    ./cli-tools/default.nix
    ./cli-tools/tmux.nix
    ./cli-tools/yazi.nix

    # Multimedia
    ./multimedia/default.nix
    ./entretenimiento/recording.nix

    # Oficina
    ./oficina/default.nix

    # File management
    ./file-management/default.nix

    # Themes
    ./themes/default.nix

    # Dev tools
    ./dev-tools/default.nix
    ./dev-tools/nix-tools.nix

    # Shell
    ./shell/default.nix

    # Programación
    ./programacion/default.nix

    # Utilidades
    ./utilidades/default.nix
    ./utilidades/linux-tools.nix
    ./utilidades/system-utils.nix

    # Hardware
    ./hardware/hardware.nix

    # Configs
    ./configs/fonts.nix
  ];
}