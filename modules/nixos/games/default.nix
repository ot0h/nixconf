{pkgs, ...}: {
  programs.steam = {
    enable = false;
    gamescopeSession.enable = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };

  programs.gamescope = {
    enable = true;
  };
}
