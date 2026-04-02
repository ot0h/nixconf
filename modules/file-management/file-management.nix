{ pkgs, ... }: {
  # Gestores de archivos
  home.packages = with pkgs; [
    thunar
    tumbler
    eza
    imv
    gdu
  ];
}