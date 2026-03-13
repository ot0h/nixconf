{
  config,
  pkgs,
  lib,
  ...
}: let
  yaziRepo = "${config.home.homeDirectory}/nixconf/config/yazi";

  yaziBins = with pkgs; [
    dragon-drop
  ];
in {
  programs.yazi = {
    enable = true;

    plugins = with pkgs.yaziPlugins; {
      gvfs = gvfs;
      projects = projects;
      lazygit = lazygit;
      ouch = ouch;
      toggle-pane = toggle-pane;
      bookmarks = bookmarks;
    };

    package = pkgs.yazi.overrideAttrs (oldAttrs: {
      nativeBuildInputs = (oldAttrs.nativeBuildInputs or []) ++ [pkgs.makeWrapper];
      postInstall =
        (oldAttrs.postInstall or "")
        + ''
          wrapProgram $out/bin/yazi \
            --suffix PATH : "${lib.makeBinPath yaziBins}"
        '';
    });
  };

  home.file = {
    # Config de yazi
    ".config/yazi/yazi.toml".source = config.lib.file.mkOutOfStoreSymlink "${yaziRepo}/yazi.toml";
    ".config/yazi/keymap.toml".source = config.lib.file.mkOutOfStoreSymlink "${yaziRepo}/keymap.toml";
    ".config/yazi/theme.toml".source = config.lib.file.mkOutOfStoreSymlink "${yaziRepo}/theme.toml";
    ".config/yazi/init.lua".source = config.lib.file.mkOutOfStoreSymlink "${yaziRepo}/init.lua";

    # Scripts
    ".config/yazi/scripts".source = config.lib.file.mkOutOfStoreSymlink "${yaziRepo}/scripts";
  };
}
