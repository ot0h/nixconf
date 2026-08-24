{pkgs, ...}: {
  # Paquetes Hyprland
  home.packages = with pkgs; [
    hypridle
    hyprsunset
    hyprpaper
    hyprshot
    hyprpicker
  ];

  systemd.user.targets.hyprland-session = {
    Unit = {
      Description = "Hyprland Session";
      After = ["graphical-session-pre.target"];
      Wants = ["graphical-session.target"];
    };
  };
}
