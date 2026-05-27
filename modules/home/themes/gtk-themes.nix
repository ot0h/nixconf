{pkgs, ...}: {
  home.packages = with pkgs; [
    gruvbox-gtk-theme
    gruvbox-plus-icons
    (graphite-gtk-theme.override {
      themeVariants = ["default"];
      colorVariants = ["dark"];
      sizeVariants = ["compact"];
      tweaks = ["black"];
    })
    (tela-circle-icon-theme.override {
      colorVariants = ["black"];
    })
    bibata-cursors
    nwg-look
  ];
}

