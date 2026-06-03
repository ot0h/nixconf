{pkgs, ...}: {
  # Nix tools y entorno
  home.packages = with pkgs; [
    nix-init
    home-manager
    nix-prefetch-github
    devenv
  ];

  programs.direnv = {
    enable = true;
    enableFishIntegration = true;
    nix-direnv.enable = true;
  };

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 7d --keep 3";
  };
}
