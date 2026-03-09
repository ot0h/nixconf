{pkgs, ...}: {
  programs.yazi = {
    enable = true;

    plugins = with pkgs; {
      gvfs = yaziPlugins.gvfs;
    };
    xdg.configFile."yazi" = {
      source = ../config/yazi;
      recursive = true;
    };
  };
}
