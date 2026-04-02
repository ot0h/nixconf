{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    # Módulos de escritorio
    ../../modules/ags.nix
    ../../modules/neovim.nix
    ../../modules/yazi.nix
    ../../modules/tmux.nix
    ../../modules/desktop/hyprland/packages.nix

    # Paquetes modulares
    ../../modules/paquetes/utilidades/cli.nix
    ../../modules/paquetes/programacion/basics.nix
    ../../modules/paquetes/entretenimiento/multimedia.nix
  ];

  home.username = "rimv";
  home.homeDirectory = "/home/rimv";
  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    # CLI y utilidades
    vim
    btop
    opencode
    rofi
    wget
    fzf
    zoxide
    bat
    fd
    xclip
    wl-clipboard

    # Shell
    fish
    starship
    atuin
    typstyle

    # Hyprland utilities
    hypridle
    hyprlock
    hyprsunset
    hyprshot
    hyprpicker
    pywal16

    # Editores y tooling
    kitty
    tinymist
    localsend
    prettier
    vtsls
    watchexec

    # Lenguajes y runtimes
    deno
    bun
    nodejs
    yarn
    pnpm

    # Compiladores y build tools
    gcc
    clang-tools
    cargo
    rustc
    cmake
    meson
    go

    # Multimedia
    mpv
    spotify
    ncspot
    obs-studio
    wf-recorder
    ani-cli
    dart-sass

    # Utilidades de sistema
    brightnessctl
    acpi
    onlyoffice-desktopeditors
    git
    lazygit
    wiremix
    opencode
    typstyle
    gh
    gh-dash

    # Aplicaciones de oficina
    libreoffice-fresh

    # File managers y tools
    thunar
    tumbler
    gdu
    eza
    imv

    # Visores y editors
    zed-editor
    typst
    sioyek

    # Utilidades
    discord
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

    # Temas y look
    gruvbox-gtk-theme
    gruvbox-plus-icons
    (graphite-gtk-theme.override {
      themeVariants = ["default"];
      colorVariants = ["dark"];
      sizeVariants = ["compact"];
      tweaks = ["black"];
    })
    (tela-circle-icon-theme.override {
      colorVariants = ["black"];
    })
    bibata-cursors

    # Herramientas de desarrollo
    nix-init
    nwg-displays
    spotatui
    glib
    simple-scan
    vala

    # Apps varias
    obsidian
    nwg-look

    # Inputs externos
    inputs.zen-browser.packages.${system}.default
    inputs.gazelle.packages.${pkgs.system}.default

    # Python y herramientas
    python314
    go
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
