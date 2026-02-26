{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./modules/ags.nix
    ./modules/neovim.nix
  ];

  home.username = "rimv";
  home.homeDirectory = "/home/rimv";
  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    gdu
    typst
    zed-editor
    bluetui
    bibata-cursors
    libreoffice-fresh
    cmake
    websocat
    jmtpfs
    obsidian
    inputs.zen-browser.packages.${system}.default
    meson
    onefetch
    fastfetch
    python313
    jq
    procps
    clipse
    google-drive-ocamlfuse
    ouch
    imagemagick
    vala
    bluetui
    samba
    polkit_gnome
    gnome-tweaks
    poppler-utils
    gruvbox-gtk-theme
    gruvbox-plus-icons
    sane-backends
    sambaFull
    hyprlandPlugins.hyprscrolling
  ];

  home.file = {
    # Config
    ".config/hypr".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixconf/config/hypr";
    ".config/fastfetch".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixconf/config/fastfetch";
    ".config/fish".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixconf/config/fish";
    ".config/yazi".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixconf/config/yazi";
    ".config/tmux".source = ./config/tmux;
    ".config/kitty".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixconf/config/kitty";
    ".config/rofi".source = ./config/rofi;
    ".config/wal".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixconf/config/wal";
    ".config/opencode".source = ./config/opencode;
    ".config/waybar".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixconf/config/waybar";
    ".config/zed".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixconf/config/zed";

    ".config/nvim".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixconf/config/nvim";

    ".config/ags".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixconf/config/ags";
    # Wrapper para TermfileChooser para HYprland
    ".config/xdg-desktop-portal-termfilechooser/yazi-wrapper.sh".source = ./extras/termfilechooser;

    #Extras
    "Pictures/Wallpapers".source = ./extras/Wallpapers;
    "scripts".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixconf/extras/scripts";
    "Documents/TYPST/templates".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixconf/extras/templates";
  };
  programs.home-manager.enable = true;
}
