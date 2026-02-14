{ config, pkgs, ... }:

{
  home.username = "rimv";
  home.homeDirectory = "/home/rimv";
  home.stateVersion = "25.11"; # Please read the comment before changing.

  home.packages = [
  ];
 

  home.file = {
  	".config/hypr".source  = ./config/hypr;
  	".config/fish".source  = ./config/fish;
  	".config/yazi".source  = ./config/yazi;
  	".config/tmux".source  = ./config/tmux;
  	".config/tmux".source  = ./config/kitty;
  	".config/tmux".source  = ./config/rofi;
  	".config/tmux".source  = ./config/wal;
  	".config/tmux".source  = ./config/opencode;
  	".config/tmux".source  = ./config/ghostty;
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
