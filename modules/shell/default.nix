{
  imports = [
    ./{ pkgs, ... }: {
      home.packages = with pkgs; [
        fish
        starship
        atuin
        typstyle
      ];
    }
  ];
}