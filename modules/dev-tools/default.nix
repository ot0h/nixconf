{ pkgs, ... }: {
  home.packages = with pkgs; [
    git
    lazygit
    gh
    gh-dash
    prettier
    vtsls
    watchexec
    nix-init
  ];
}