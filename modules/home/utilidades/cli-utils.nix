{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    vim
    btop
    ripgrep
    wget
    nushell
    fzf
    zoxide
    sesh
    bat
    fd
    xclip
    wl-clipboard
    inputs.gazelle.packages.${pkgs.stdenv.hostPlatform.system}.default
    chafa
    file
    cava
  ];
}
