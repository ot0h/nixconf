{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [

    ./nixs/nvf.nix
  ];

  home.username = "rimv";
  home.homeDirectory = "/home/rimv";
  home.stateVersion = "25.11";

  home.packages = with pkgs ;[
    inputs.astal.packages.${system}.battery
    inputs.astal.packages.${system}.network
    inputs.astal.packages.${system}.bluetooth
    inputs.astal.packages.${system}.wireplumber
    inputs.astal.packages.${system}.tray
    inputs.astal.packages.${system}.cava
    inputs.astal.packages.${system}.greet
    inputs.astal.packages.${system}.hyprland
    inputs.astal.packages.${system}.notifd
    inputs.astal.packages.${system}.auth
    inputs.astal.packages.${system}.apps
    inputs.astal.packages.${system}.mpris
    inputs.astal.packages.${system}.io
    inputs.astal.packages.${system}.astal4

    inputs.ags.packages.${system}.default


    zed-editor
    gtk4
    glib
    jmtpfs
    meson
    python3
    nixd
    alejandra
    xdg-desktop-portal-termfilechooser
  ];

  home.file = {

    # Config
    ".config/hypr".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixconf/config/hypr";
    ".config/fish".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixconf/config/fish";
    ".config/yazi".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixconf/config/yazi";
    ".config/tmux".source = ./config/tmux;
    ".config/kitty".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixconf/config/kitty";
    ".config/rofi".source = ./config/rofi;
    ".config/wal".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixconf/config/wal";
    ".config/opencode".source = ./config/opencode;
    ".config/ghostty".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixconf/config/ghostty";
    ".config/waybar".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixconf/config/waybar";
    ".config/zed".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixconf/config/zed";

    # Wrapper para TermfileChooser para HYprland
    ".config/xdg-desktop-portal-termfilechooser/yazi-wrapper.sh".source = ./extras/scripts/yazi-wrapper.sh;

    #Extras
    "Pictures/Wallpapers".source = ./extras/Wallpapers;
    "scripts".source = ./extras/scripts;
    "Documents/TYPST/templates".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixconf/extras/templates";

  };
  programs.home-manager.enable = true;
}
