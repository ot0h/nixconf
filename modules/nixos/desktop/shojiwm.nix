{inputs, ...}: {
  imports = [inputs.shojiwm.nixosModules.default];

  programs.shojiwm = {
    enable = false;
  };
}
