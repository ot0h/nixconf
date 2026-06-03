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
      font-family = "IosevkaTermSlab Nerd Font";
      font-family-italic = "Victor Mono Italic";
      font-feature = ["liga" "calt"];
    };
  };
}
