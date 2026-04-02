{ pkgs, ... }: {
  # Paquetes del sistema
  environment.systemPackages = with pkgs; [
    # Compiladores
    gcc
    clang-tools
    cmake
    meson

    # Lenguajes
    cargo
    rustc
    go
    nodejs

    # Herramientas de build
    bun
    yarn
    pnpm
  ];
}