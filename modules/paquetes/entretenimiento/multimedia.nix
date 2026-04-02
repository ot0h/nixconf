{ pkgs, ... }: {
  # Multimedia
  environment.systemPackages = with pkgs; [
    mpv
    spotify
    ncspot
    ani-cli
    dart-sass
  ];
}