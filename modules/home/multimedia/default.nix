{pkgs, ...}: {
  imports = [];

  home.packages = with pkgs; [
    # Reproductores
    spotify
    ncspot
    dart-sass
    mpv-unwrapped

    # Audio
    wiremix

    (callPackage ./ani-cli.nix {})
  ];
}
