{pkgs, ...}: {
  programs.yazi = {
    enable = true;

    plugins = with pkgs; {
      gvfs = yaziPlugins.gvfs;
    };
  };
}
