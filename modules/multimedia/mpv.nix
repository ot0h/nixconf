{ pkgs, ... }: {
  home.packages = with pkgs; [
    # Reproductores
    mpv
    spotify
    ncspot
    ani-cli
    dart-sass

    # Discord
    discord

    # Audio
    wiremix
  ];
}