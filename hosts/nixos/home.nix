{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    # Embudo - importa todos los módulos
    ../../modules/default.nix
  ];

  home.username = "rimv";
  home.homeDirectory = "/home/rimv";
  home.stateVersion = "25.11";

  # Paquetes adicionales que no están en módulos
  home.packages = with pkgs; [
    # Utilidades varias
    opencode
    pywal16
    localsend
    wiremix

    # Runtime y lenguajes adicionales
    deno
    typst
    sioyek

    # Entretenimiento adicional
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
    typst
    sass

    # Python y herramientas
    python314
    jq
    procps
    clipse
    google-drive-ocamlfuse
    onefetch
    fastfetch
  ];

  home.file = {
    # Config
    ".config/hypr".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixconf/config/hypr";
    ".config/fastfetch".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixconf/config/fastfetch";
    ".config/fish".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixconf/config/fish";
    ".config/kitty".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixconf/config/kitty";
    ".config/rofi".source = ../../config/rofi;
    ".config/wal".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixconf/config/wal";
    ".config/opencode".source = ../../config/opencode;
    ".config/zed".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixconf/config/zed";

    ".config/nvim".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixconf/config/nvim";

    ".config/ags".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixconf/config/ags";
    # Wrapper para TermfileChooser para HYprland
    ".config/xdg-desktop-portal-termfilechooser/yazi-wrapper.sh".source = ../../extras/termfilechooser;

    #Extras
    "Pictures/Wallpapers".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixconf/extras/Wallpapers";
    "scripts".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixconf/extras/scripts";
    "Documents/TYPST/templates".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixconf/extras/templates";
  };
  programs.home-manager.enable = true;
}
