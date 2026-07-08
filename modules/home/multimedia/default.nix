{
  pkgs,
  inputs,
  ...
}: let
  curd = inputs.curd.packages.${pkgs.stdenv.hostPlatform.system}.default;
in {
  imports = [
    ./games.nix
  ];

  home.packages = with pkgs; [
    # Reproductores
    spotify
    ncspot
    dart-sass
    mpv-unwrapped

    # Audio
    wiremix
    kopuz

    mgba

    curd
    (callPackage ./ani-cli.nix {})
  ];
}
