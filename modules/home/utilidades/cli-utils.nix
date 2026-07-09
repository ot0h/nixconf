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
    fd
    xclip
    wl-clipboard
    inputs.gazelle.packages.${pkgs.stdenv.hostPlatform.system}.default
    chafa
    file
    cava
  ];

  programs.bat = {
    enable = true;
    config = {
      pager = "less -FR";
      theme = "base16";
    };
  };
}
