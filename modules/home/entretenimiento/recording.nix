{pkgs, ...}: {
  # Recording

  home.packages = with pkgs; [
    droidcam
  ];

  programs.obs-studio = {
    enable = true;

    plugins = with pkgs.obs-studio-plugins; [
      droidcam-obs
    ];
  };
}
