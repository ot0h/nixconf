{pkgs, ...}: {
  # Herramientas de sistema Linux
  home.packages = with pkgs; [
    # UI tools
    nwg-look
    nix-init
    glib
    simple-scan
    vala
    awww
    bluetui
    aseprite
    unzip
    feh
    unrar
    # Transferencia
    localsend
    libnotify
    jpegoptim
    optipng
    libwebp
    gifsicle
    ghostscript
  ];
}
