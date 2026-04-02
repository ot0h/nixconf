{
  imports = [
    ./{ pkgs, ... }: {
      home.packages = with pkgs; [
        mpv
        spotify
        ncspot
        ani-cli
        dart-sass
      ];
    }
  ];
}