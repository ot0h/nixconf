{pkgs, ...}: {
  # Paquetes Hyprland
  home.packages = with pkgs; [
    hypridle
    hyprlock
    hyprsunset
    hyprshot
    hyprpicker
    pywal16
    hyprcursor
  ];
}
