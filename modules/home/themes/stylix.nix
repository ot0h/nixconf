{pkgs, ...}: let
  imagen = ../../../extras/Wallpapers/mono.png;
in {
  stylix = {
    enable = true;
    image = imagen;

    cursor = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
      size = 24;
    };

    icons = {
      enable = true;
      package = pkgs.tela-circle-icon-theme.override {
        colorVariants = ["black"];
      };
      dark = "Tela-circle-black-dark";
      light = "Tela-circle-black-light";
    };

    fonts = {
      monospace = {
        package = pkgs.departure-mono;
        name = "Departure Mono";
      };
      sansSerif = {
        package = pkgs.departure-mono;
        name = "Departure Mono";
      };
      serif = {
        package = pkgs.departure-mono;
        name = "Departure Mono";
      };
      sizes = {
        applications = 10;
        desktop = 10;
        terminal = 11;
      };
    };

    targets = {
      gtk.enable = true;
      hyprland = {
        enable = true;
        image.enable = true;
      };
      lazygit = {
        enable = true;
        colors.enable = true;
      };
      fzf.enable = true;
      cava.enable = true;
      bat.enable = true;
      kitty.enable = true;
      ncspot.enable = true;
      zen-browser.enable = true;
      hyprpaper.enable = true;
      starship.enable = true;
    };
  };
}
