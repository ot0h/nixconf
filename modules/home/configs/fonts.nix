{pkgs, ...}: let
  nerdFonts = with pkgs.nerd-fonts; [
    jetbrains-mono
    caskaydia-cove
    iosevka-term-slab
    departure-mono
  ];
in {
  home.packages = with pkgs;
    [
      # departure-mono
      # pixel-code
      # iosevka
      liberation_ttf
      noto-fonts
      noto-fonts-cjk-sans
    ]
    ++ nerdFonts;
}
