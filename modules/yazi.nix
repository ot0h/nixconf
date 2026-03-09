{pkgs, ...}: {
  programs.yazi = {
    enable = true;
    plugins = with pkgs.yaziPlugins; {
      gvfs = gvfs;
    };
  };

  xdg.configFile = {
    "yazi/yazi.toml".source = ../config/yazi/yazi.toml;
    "yazi/keymap.toml".source = ../config/yazi/keymap.toml;
    "yazi/theme.toml".source = ../config/yazi/theme.toml;
    "yazi/init.lua".source = ../config/yazi/init.lua;

    "yazi/scripts" = {
      source = ../config/yazi/scripts;
      recursive = true;
    };

    "yazi/plugins" = {
      source = ../config/yazi/plugins;
      recursive = true;
    };
  };
}
