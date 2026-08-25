{pkgs, ...}: {
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

    mgba

    ani-cli
  ];
}
