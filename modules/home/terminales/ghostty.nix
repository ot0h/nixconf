{pkgs, ...}: {
  programs.ghostty = {
    enable = false;
    enableFishIntegration = true;
    clearDefaultKeybinds = true;

    package = pkgs.ghostty;

    settings = {
      # Colores de Pywal
      config-file = "~/.cache/wal/ghostty.conf";

      # Font Settings
      font-family = "Departure Mono";
    };
  };
}
