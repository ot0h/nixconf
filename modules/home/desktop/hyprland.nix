{pkgs, ...}: {
  # Paquetes Hyprland
  home.packages = with pkgs; [
    hypridle
    hyprsunset
    hyprpaper
    hyprshot
    hyprpicker
  ];
}
