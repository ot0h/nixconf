{
  imports = [
    ./{ pkgs, ... }: {
      home.packages = with pkgs; [
        libreoffice-fresh
        onlyoffice-desktopeditors
      ];
    }
  ];
}