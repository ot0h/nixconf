{
  pkgs,
  inputs,
  ...
}: let
  astalPkgs = inputs.astal.packages.${pkgs.stdenv.hostPlatform.system};
  agsPkg = inputs.ags.packages.${pkgs.stdenv.hostPlatform.system};
in {
  imports = [
    inputs.ags.homeManagerModules.default
  ];

  programs.ags = {
    enable = true;

    extraPackages = with pkgs; [
      astalPkgs.battery
      astalPkgs.network
      astalPkgs.bluetooth
      astalPkgs.wireplumber
      astalPkgs.tray
      astalPkgs.cava
      astalPkgs.brightness
      astalPkgs.greet
      astalPkgs.hyprland
      astalPkgs.notifd
      astalPkgs.auth
      astalPkgs.apps
      astalPkgs.mpris
      astalPkgs.io
      astalPkgs.powerprofiles
      astalPkgs.astal4
      astalPkgs.workspace

      agsPkg.default
      libadwaita
    ];
  };
}
