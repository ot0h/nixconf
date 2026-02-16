{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ./nixs/nvf.nix
    ./modules/ags.nix
  ];

  home.username = "rimv";
  home.homeDirectory = "/home/rimv";
  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    zed-editor
    jmtpfs
    meson
    python3
    nixd
    nil
    alejandra
    ouch
    imagemagick
    typst
    vala
  ];

  home.file = {

    # Config
    ".config/hypr".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixconf/config/hypr";
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
    ".config/ghostty".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixconf/config/ghostty";
    ".config/waybar".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixconf/config/waybar";
    ".config/zed".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixconf/config/zed";

    # Wrapper para TermfileChooser para HYprland
    ".config/xdg-desktop-portal-termfilechooser/yazi-wrapper.sh".source = ./extras/termfilechooser;

    #Extras
    "Pictures/Wallpapers".source = ./extras/Wallpapers;
    "scripts".source = ./extras/scripts;
    "Documents/TYPST/templates".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixconf/extras/templates";

  };
  programs.home-manager.enable = true;
}
