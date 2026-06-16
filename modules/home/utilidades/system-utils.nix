{pkgs, ...}: {
  # Utilidades varias
  home.packages = with pkgs; [
    # Sistema
    localsend
    wiremix

    # Archivos y compresión
    unrar
    websocat
    jmtpfs
    ouch
    imagemagick
    poppler-utils

    # Redes y transferencia
    sshfs
    ripdrag
  ];
}
