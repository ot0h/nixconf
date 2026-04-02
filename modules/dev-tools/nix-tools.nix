{ pkgs, ... }: {
  # Nix tools y entorno
  home.packages = with pkgs; [
    nix-init
    home-manager
  ];
}