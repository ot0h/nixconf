{
  pkgs,
  inputs,
  ...
}: let
  curd = inputs.curd.packages.${pkgs.stdenv.hostPlatform.system}.default;
in {
  imports = [];

  home.packages = with pkgs; [
    # Reproductores
    spotify
    ncspot
    dart-sass
    mpv-unwrapped

    # Audio
    wiremix

    mgba

    curd
    (callPackage ./ani-cli.nix {})
  ];
}
