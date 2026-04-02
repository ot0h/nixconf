{ pkgs, ... }: {
  # CLI tools básicos
  home.packages = with pkgs; [
    vim
    btop
    opencode
    rofi
    wget
    fzf
    zoxide
    bat
    fd
    watchexec
    xclip
    wl-clipboard
  ];
}