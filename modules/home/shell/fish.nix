# Fish shell via Home Manager
{pkgs, ...}: {
  # Solo paquetes - la config viene del symlink en home.nix
  home.packages = with pkgs; [
    nushell
    fish
    starship
    atuin
    typstyle
  ];
}

