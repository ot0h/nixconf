{pkgs, ...}: let
  nerdFonts = with pkgs.nerd-fonts; [
    jetbrains-mono
    caskaydia-cove
    iosevka-term-slab
    bigblue-terminal
  ];
in {
  home.packages = with pkgs;
    [
      iosevka
      monocraft
      victor-mono
      liberation_ttf
      noto-fonts
      noto-fonts-cjk-sans
      monaspace
    ]
    ++ nerdFonts;
}
