{config, ...}: let
  c = config.stylix.cursor;
in {
  gtk = {
    enable = true;
    cursorTheme = {
      package = c.package;
      name = c.name;
      size = c.size;
    };
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
