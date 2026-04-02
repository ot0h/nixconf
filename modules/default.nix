# Embudo general - importa todos los módulos de Home Manager automáticamente
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

    # Paquetes (el otro embudo)
    ./paquetes/default.nix
  ];
}