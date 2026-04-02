{ pkgs, ... }: {
  # Editores y visualizadores
  home.packages = with pkgs; [
    typst
    sioyek
    obsidian
  ];
}