{pkgs, ...}: {
  # Utilidades de hardware
  home.packages = with pkgs; [
    brightnessctl
    acpi
  ];
}
