{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    inputs.ags.homeManagerModules.default

    ./nixs/nvf.nix
  ];

  home.username = "rimv";
  home.homeDirectory = "/home/rimv";
  home.stateVersion = "25.11";

  home.packages = [
  ];

  home.file = {

    # Config
    ".config/hypr".source = ./config/hypr;
    ".config/fish".source = ./config/fish;
    ".config/yazi".source = ./config/yazi;
    ".config/tmux".source = ./config/tmux;
    ".config/kitty".source = ./config/kitty;
    ".config/rofi".source = ./config/rofi;
    ".config/wal".source = ./config/wal;
    ".config/opencode".source = ./config/opencode;
    ".config/ghostty".source = ./config/ghostty;

    #Extras
    "Pictures/Wallpapers".source = ./extras/Wallpapers;
    "scripts".source = ./extras/scripts;
    "Documents/TYPST".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixconf/extras/templates";

  };
  programs.ags = {
    enable = true;
    configDir = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixconf/config/ags";

    extraPackages = with pkgs; [
      libadwaita
      inputs.astal.packages.${pkgs.system}.battery
      inputs.astal.packages.${pkgs.system}.network
      inputs.astal.packages.${pkgs.system}.bluetooth
      inputs.astal.packages.${pkgs.system}.wireplumber
      inputs.astal.packages.${pkgs.system}.tray
      inputs.astal.packages.${pkgs.system}.cava
      inputs.astal.packages.${pkgs.system}.greet
      inputs.astal.packages.${pkgs.system}.hyprland
      inputs.astal.packages.${pkgs.system}.notifd
      inputs.astal.packages.${pkgs.system}.auth
      inputs.astal.packages.${pkgs.system}.apps
      inputs.astal.packages.${pkgs.system}.mpris
    ];
  };
  programs.home-manager.enable = true;
}
