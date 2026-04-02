{
  imports = [
    ./neovim.nix
    ./{ pkgs, ... }: {
      home.packages = with pkgs; [ zed-editor ];
    }
  ];
}