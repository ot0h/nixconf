{ pkgs, ... }: {
  # Herramientas de sistema Linux
  home.packages = with pkgs; [
    # UI tools
    nwg-displays
    spotatui
    nwg-look
    nix-init
    glib
    simple-scan
    vala
    awww
    bluetui
    aseprite

    # Transferencia
    localsend
  ];
}