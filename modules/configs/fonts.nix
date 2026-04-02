{ pkgs, ... }: {
  # Fuentes del sistema
  fonts.packages = with pkgs; [
    iosevka
    monocraft
    liberation_ttf
    noto-fonts
    noto-fonts-cjk-sans
    nerd-fonts.jetbrains-mono
    nerd-fonts.iosevka-term-slab
  ];
}