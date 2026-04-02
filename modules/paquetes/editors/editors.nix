{ pkgs, ... }: {
  # Editores de texto y IDEs
  home.packages = with pkgs; [
    kitty
    tinymist
    zed-editor
    vim
  ];
}