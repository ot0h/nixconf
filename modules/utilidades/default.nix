{
  imports = [
    ./{ pkgs, ... }: {
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
        xclip
        wl-clipboard
      ];
    }
  ]
  #
  # Additional utilities
  ./linux-tools.nix
  ./system-utils.nix
}