{pkgs, ...}: {
  imports = [
    ./settings.nix
    ./keymap.nix
    ./theme.nix
    ./plugins.nix
    ./scripts.nix
  ];

  programs.yazi = {
    enable = true;

    # Alias del wrapper: 'y' en vez de 'yy'
    # shellWrapperName = "y";  # HM >= 26.05 usa "y" por defecto

    # Paquetes extra disponibles en el PATH de yazi (no contaminan el PATH global)
    extraPackages = with pkgs; [
      imv
      aseprite
      gimp
      sioyek
      mpv
      unar
      ouch
      ripdrag
      mediainfo
      exiftool
    ];
  };
}
