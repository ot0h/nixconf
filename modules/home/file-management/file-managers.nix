{pkgs, ...}: {
  # Gestores de archivos
  home.packages = with pkgs; [
    # File managers
    tumbler
    eza
    imv
    gdu

    # Archivos y transferencia
    sshfs
    ripdrag

    # Compresión
    unrar
    ouch

    # Utilidades de archivos
    websocat
    imagemagick
    poppler-utils
  ];
}
