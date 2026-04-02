{ pkgs, ... }: {
  # Compiladores y lenguajes
  home.packages = with pkgs; [
    gcc
    clang-tools
    cmake
    meson

    cargo
    rustc
    go
    nodejs
    deno

    bun
    yarn
    pnpm
  ];
}