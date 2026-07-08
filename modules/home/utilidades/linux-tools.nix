{pkgs, ...}: {
  # Herramientas de sistema Linux
  home.packages = with pkgs; [
    # UI tools
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
    bibata-cursors
  ];
}
