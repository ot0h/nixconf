{
  pkgs,
  lib,
  ...
}: let
  statusbarVariant = "dotbar"; # Puede ser => dotbar, minimal o custom

  keybindings = import ./keybindings.nix;
  plugins = import ./plugins.nix {inherit pkgs;};
  statusbar = import ./statusbar/${statusbarVariant}.nix {inherit pkgs;};
in {
  programs.tmux = {
    enable = true;
    shell = "${pkgs.fish}/bin/fish";
    terminal = "xterm-kitty";
    prefix = "M-Space";
    baseIndex = 1;
    mouse = true;
    keyMode = "vi";
    clock24 = false;
    escapeTime = 0;

    plugins =
      plugins.list
      ++ lib.optional (statusbarVariant == "dotbar") {
        plugin = statusbar.plugin;
        extraConfig = statusbar.config;
      };

    extraConfig = ''
      ${keybindings}
      ${lib.optionalString (statusbarVariant == "custom") statusbar.config}


      # Colores true color
      set -as terminal-overrides ',*:Tc'
      set -as terminal-overrides ',xterm-kitty:Tc'
      # Underline styles/colors
      set -as terminal-overrides ',*:Smulx=\E[4:3m'
      set -as terminal-overrides ',*:Setulc=\E[58::2::%p1%{65536}%/%d::%p1%{256}%/%{255}%&%d::%p1%{255}%&%d%;m'

      # Terminal features para kitty
      set -as terminal-features ',xterm-kitty:RGB'
      set -as terminal-features ',xterm-kitty:extkeys'

      set -ga update-environment TERM
      set -ga update-environment TERM_PROGRAM

      # Imagenes - CRÍTICO para popups
      set -gq allow-passthrough on

      # Sin esto los popups pueden no recibir el passthrough
      set -g escape-time 0

      # No fuerces resize agresivo (rompe coordenadas de imagen)
      set -g aggressive-resize off
    '';
  };

  home.packages = plugins.statusBins;
}
