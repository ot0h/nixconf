{pkgs, ...}: {
  programs.lutris = {
    enable = false;
    package = pkgs.lutris;

    protonPackages = with pkgs; [proton-ge-bin];
  };
}
