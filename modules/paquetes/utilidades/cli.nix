{ pkgs, ... }: {
  # CLI tools básicos
  environment.systemPackages = with pkgs; [
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