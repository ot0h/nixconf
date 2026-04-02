{ pkgs, ... }: {
  # Recording y gaming
  home.packages = with pkgs; [
    obs-studio
    wf-recorder
  ];
}