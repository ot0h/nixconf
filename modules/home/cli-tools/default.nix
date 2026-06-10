{pkgs, ...}: {
  imports = [
    ./tmux
    ./yazi
  ];

  home.packages = with pkgs; [zellij];
}
