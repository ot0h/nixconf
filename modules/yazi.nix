{
  config,
  pkgs,
  ...
}: let
  yaziRepo = "../config/yazi";
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
