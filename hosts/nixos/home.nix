{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ../../modules/ags.nix
    ../../modules/neovim.nix
    ../../modules/yazi.nix
    ../../modules/tmux.nix
  ];

  home.username = "rimv";
  home.homeDirectory = "/home/rimv";
  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    deno
    thunar
    tumbler
    gdu
    discord
    awww
    sshfs
    rustc
    imv
    sioyek
    nix-init
    typst
    zed-editor
    nwg-displays
    spotatui
    glib
    simple-scan
    pnpm
    yarn
    ripdrag
    bluetui
    obs-studio
    wf-recorder
    unrar
    eza
    bibata-cursors
    libreoffice-fresh
    cmake
    websocat
    jmtpfs
    obsidian
    gh-dash
    gh
    inputs.zen-browser.packages.${system}.default
    inputs.gazelle.packages.${pkgs.system}.default
    meson
    onefetch
    fastfetch
    python314
    go
    jq
    procps
    clipse
    google-drive-ocamlfuse
    ouch
    aseprite
    imagemagick
    vala
    samba
    polkit_gnome
    gnome-tweaks
    poppler-utils
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
    nwg-look
    sane-backends
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
