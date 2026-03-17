{
  pkgs,
  config,
  ...
}: {
  programs.ghostty = {
    enable = true;

    package = pkgs.ghostty;

    settings = {
      config-file = "${config.home.homeDirectory}/.cache/wal/ghostty.conf";

      command = "env GTK_IM_MODULE=simple tmux -CC attach -t default || env GTK_IM_MODULE=simple tmux -CC new -s default";
      shell-integration = "fish";
      font-family = "IosevkaTermSlab Nerd Font";
      font-size = 12;
      confirm-close-surface = false;
    };
  };
}
