{ pkgs, ... }: {
  home.packages = with pkgs; [
    thunar
    tumbler
    eza
    imv
    gdu
  ];
}