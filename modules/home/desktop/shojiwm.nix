{config, ...}: {
  home.file = {
    ".config/shojiwm".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixconf/config/shojiwm";
  };
}
