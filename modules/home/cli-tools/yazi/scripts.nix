{config, ...}: let
  yaziRepo = "${config.home.homeDirectory}/nixconf/config/yazi";
in {
  home.file = {
    # Scripts de Yazi
    ".config/yazi/scripts".source = config.lib.file.mkOutOfStoreSymlink "${yaziRepo}/scripts";
  };
}
