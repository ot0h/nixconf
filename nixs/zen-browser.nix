{inputs,...}:
{
  imports = [inputs.zen-browser.homeManagerModules.default];
  programs.zen-browser = {
    enable = true;
  };
}
