{pkgs, ...}: {
  imports = [
    ./games.nix
  ];

  home.packages = with pkgs; [
    # Reproductores
    spotify
    ncspot
    spotatui
    dart-sass
    mpv-unwrapped

    # Audio
    wiremix

    mgba

    ani-cli
  ];
}
