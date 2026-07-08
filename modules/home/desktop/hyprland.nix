{pkgs, ...}: {
  # Paquetes Hyprland
  home.packages = with pkgs; [
    hypridle
    hyprlock
    hyprsunset
    hyprpaper
    hyprshot
    hyprpicker
    pywal16
  ];
}
