{ pkgs, ... }: {
  # Paquetes del sistema - disponibles para todos los usuarios
  environment.systemPackages = with pkgs; [
    # Compiladores y build tools
    gcc
    clang-tools
    cmake
    meson
    cargo
    rustc

    # Servicios del sistema
    cups
    gobject-introspection
    libpulseaudio

    # Gestión del sistema
    networkmanager
    acpi
    nodejs

    # Home Manager como módulo del sistema
    home-manager

    # Utilidades del sistema
    wget
    git
    fd
  ];

  # Fuentes del sistema
  fonts.packages = with pkgs; [
    iosevka
    monocraft
    liberation_ttf
    noto-fonts
    noto-fonts-cjk-sans
    nerd-fonts.jetbrains-mono
    nerd-fonts.iosevka-term-slab
  ];
}