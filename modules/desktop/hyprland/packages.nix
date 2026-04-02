{ pkgs, ... }: {
  # Paquetes Hyprland
  environment.systemPackages = with pkgs; [
    hypridle
    hyprlock
    hyprsunset
    hyprshot
    hyprpicker
  ];
}