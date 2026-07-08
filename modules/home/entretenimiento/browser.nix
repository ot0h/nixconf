{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    inputs.zen-browser.packages.${stdenv.hostPlatform.system}.default
    chromium

    # (pkgs.callPackage ./helium.nix {})
  ];
}
