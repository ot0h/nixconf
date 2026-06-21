{
  pkgs,
  lib,
  ...
}: let
  extensions = import ./extensions.nix;
  packages = import ./packages.nix {inherit pkgs lib;};
  settings = import ./settings.nix {inherit lib pkgs;};
  lsp = import ./lsp.nix {inherit pkgs lib;};
  languages = import ./languages.nix;
  keybindings = import ./keybindings.nix;
in {
  programs.zed-editor = {
    enable = true;
    extensions = extensions;
    extraPackages = packages;
    userSettings = settings
      // {
        lsp = lsp;
        languages = languages;
      };
    userKeymaps = keybindings;
  };
}
