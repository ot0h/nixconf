# Embudo general - importa todos los módulos automáticamente
{ pkgs, ... }: {
  imports = [
    # Desktop
    ./desktop/ags/ags.nix
    ./desktop/hyprland/packages.nix

    # Editors
    ./editors/neovim.nix

    # CLI tools
    ./cli-tools/tmux.nix
    ./cli-tools/yazi.nix

    # Configs
    ./configs/fonts.nix

    # Hardware
    ./hardware/battery/tlp.nix

    # Paquetes (el otro embudo)
    ./paquetes/default.nix

    # Servicios
    ./servicios/audio/pipewire.nix
    ./servicios/printing/cups.nix
    ./servicios/red/avahi.nix
    ./servicios/red/samba.nix
  ];
}