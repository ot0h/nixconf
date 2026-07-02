{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ../../modules/home/default.nix
  ];

  home.username = "rimv";
  home.homeDirectory = "/home/rimv";
  home.stateVersion = "26.05";

  home.file = {
    ".config/hypr".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixconf/config/hypr";
    ".config/fastfetch".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixconf/config/fastfetch";
    ".config/fish".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixconf/config/fish";
    ".config/wal".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixconf/config/wal";
    ".config/opencode".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixconf/config/opencode";
    ".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixconf/config/nvim";
    ".config/ags" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixconf/config/ags";
      recursive = true;
    };
    ".config/xdg-desktop-portal-termfilechooser/yazi-wrapper.sh".source = ../../extras/termfilechooser;

    "Pictures/Wallpapers".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixconf/extras/Wallpapers";
    "scripts".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixconf/extras/scripts";
    "Documents/TYPST/templates".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixconf/extras/templates";
  };
  programs.home-manager.enable = true;
}
