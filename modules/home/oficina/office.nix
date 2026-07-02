{pkgs, ...}: {
  # Office
  home.packages = with pkgs; [
    libreoffice-fresh
    # onlyoffice-desktopeditors
  ];
}
