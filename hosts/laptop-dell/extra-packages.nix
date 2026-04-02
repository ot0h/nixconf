{ pkgs, ... }: {
  # Paquetes adicionales específicos de este host
  home.packages = with pkgs; [
    # Utilidades varias
    opencode
    pywal16
    localsend
    wiremix

    # Runtime y lenguajes
    deno
    typst
    sioyek

    # Entretenimiento
    discord
    obs-studio
    wf-recorder

    # Utilidades varias
    awww
    sshfs
    ripdrag
    bluetui
    unrar
    websocat
    jmtpfs
    ouch
    aseprite
    imagemagick
    poppler-utils

    # Herramientas adicionales de desarrollo
    nix-init
    nwg-displays
    spotatui
    glib
    simple-scan
    vala

    # Apps varias
    obsidian

    # Python y herramientas
    python314
    jq
    procps
    clipse
    google-drive-ocamlfuse
    onefetch
    fastfetch
  ];
}