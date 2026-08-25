{pkgs, ...}: {
  # Office
  home.packages = with pkgs; [
    libreoffice-stable
    # onlyoffice-desktopeditors
  ];
}
