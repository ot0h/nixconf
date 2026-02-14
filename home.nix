{ config, pkgs, inputs,... }:

{
  imports = [
    inputs.ags.homeManagerModules.default
  ];

  home.username = "rimv";
  home.homeDirectory = "/home/rimv";
  home.stateVersion = "25.11"; # Please read the comment before changing.

  home.packages = [
  ];
 

  home.file = {
	#Los dizque Dotfiles xD
  	".config/hypr".source  = ./config/hypr;
  	".config/fish".source  = ./config/fish;
  	".config/yazi".source  = ./config/yazi;
  	".config/tmux".source  = ./config/tmux;
  	".config/kitty".source  = ./config/kitty;
  	".config/rofi".source  = ./config/rofi;
  	".config/wak".source  = ./config/wal;
  	".config/opencode".source  = ./config/opencode;
  	".config/ghostty".source  = ./config/ghostty;
  	".config/ags".source  = ./config/ags;
  };
  programs.ags = {
    enable = true;
    
    extraPackages = with pkgs; [
      inputs.astal.packages.${pkgs.system}.battery
      inputs.astal.packages.${pkgs.system}.bluetooth
      inputs.astal.packages.${pkgs.system}.wireplumber
      inputs.astal.packages.${pkgs.system}.tray
      inputs.astal.packages.${pkgs.system}.cava
      inputs.astal.packages.${pkgs.system}.greet
      inputs.astal.packages.${pkgs.system}.hyprland
      inputs.astal.packages.${pkgs.system}.notifd
      inputs.astal.packages.${pkgs.system}.auth
      inputs.astal.packages.${pkgs.system}.app
      inputs.astal.packages.${pkgs.system}.mpris
    ];
  };
  programs.home-manager.enable = true;
}
