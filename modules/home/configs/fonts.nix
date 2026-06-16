{pkgs, ...}: let
  nerdFonts = with pkgs.nerd-fonts; [
    jetbrains-mono
    # caskaydia-cove
    # iosevka-term-slab
  ];
in {
  home.packages = with pkgs;
    [
      pixel-code
      # iosevka
      liberation_ttf
      noto-fonts
      noto-fonts-cjk-sans
    ]
    ++ nerdFonts;
}
