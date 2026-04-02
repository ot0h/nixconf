{ pkgs, ... }: {
  # Herramientas de sistema Linux
  home.packages = with pkgs; [
    nwg-displays
    spotatui
    glib
    simple-scan
    vala
    awww
    bluetui
    aseprite
  ];
}