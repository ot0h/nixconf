{pkgs, ...}: {
  programs.lutris = {
    enable = true;
    package = pkgs.lutris;

    protonPackages = with pkgs; [proton-ge-bin];
  };
}
