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
  ];
}