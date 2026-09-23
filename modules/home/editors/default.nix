{pkgs, ...}: {
  imports = [
    ./neovim.nix
    ./helix.nix
    ./zed-editor
  ];

  home.packages = with pkgs; [
    vscode
  ];
}
