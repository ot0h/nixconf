{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    inputs.zen-browser.packages.${stdenv.hostPlatform.system}.default

    # firefox
    (pkgs.callPackage ./helium.nix {})
  ];
}
