{ pkgs, ... }: {
  # Shell y prompt
  home.packages = with pkgs; [
    fish
    starship
    atuin
    typstyle
  ];
}