{ pkgs, ... }: {
  home.packages = with pkgs; [
    zed-editor
    sioyek
    typst
  ];
}