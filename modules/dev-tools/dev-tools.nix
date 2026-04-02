{ pkgs, ... }: {
  # Herramientas de desarrollo
  home.packages = with pkgs; [
    git
    lazygit
    gh
    gh-dash
    prettier
    vtsls
    watchexec

    # Python tools
    python314

    # Notas
    obsidian

    # Utilidades
    jq
    procps
    clipse
    onefetch
    fastfetch

    # Cloud
    google-drive-ocamlfuse
  ];
}