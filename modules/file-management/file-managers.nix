{ pkgs, ... }: {
  # Gestores de archivos
  home.packages = with pkgs; [
    # File managers
    thunar
    tumbler
    eza
    imv
    gdu

    # Archivos y transferencia
    sshfs
    ripdrag
    jmtpfs

    # Compresión
    unrar
    ouch

    # Utilidades de archivos
    websocat
    imagemagick
    poppler-utils
  ];
}