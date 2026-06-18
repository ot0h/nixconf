{pkgs, ...}: {
  programs.zed-editor = {
    enable = true;
    package = pkgs.zed-editor;

    extraPackages = with pkgs; [nixd vtsls roslyn-ls angular-language-server];
  };
}
