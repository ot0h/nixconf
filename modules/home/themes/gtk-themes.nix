{pkgs, ...}: {
  home.packages = with pkgs; [
    gruvbox-gtk-theme # Alternativa disponible
    gruvbox-plus-icons # Alternativa disponible
  ];

  # -------------------------------------------------------------------
  # Configuración GTK declarativa
  # -------------------------------------------------------------------
  # Home Manager escribe ~/.config/gtk-{3,4}.0/settings.ini por vos.
  # Si usás nwg-look para probar, los cambios se pierden al rebuild →
  # la fuente de verdad es este archivo.
  # -------------------------------------------------------------------

  gtk = {
    enable = true;

    # ---- Tema ----
    theme = {
      name = "Graphite-Dark-compact";
      package = pkgs.graphite-gtk-theme.override {
        themeVariants = ["default"];
        colorVariants = ["dark"];
        sizeVariants = ["compact"];
        tweaks = ["black"];
      };
    };

    # ---- Iconos ----
    iconTheme = {
      name = "Tela-circle-black-dark";
      package = pkgs.tela-circle-icon-theme.override {
        colorVariants = ["black"];
      };
    };

    # ---- Cursor ----
    cursorTheme = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
      size = 24;
    };

    # ---- Fuente ----
    font = {
      name = "Pixel Code";
      size = 10;
    };

    # ---- Config extra de GTK ----
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
      gtk-button-images = true;
      gtk-menu-images = true;
      gtk-enable-event-sounds = false;
      gtk-enable-input-feedback-sounds = false;
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };
  };
}
