{pkgs, ...}: {
  programs.ghostty = {
    enable = true;

    settings = {
      command = "env GTK_IM_MODULE=simple";
    };
  };
}
