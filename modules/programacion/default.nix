{
  imports = [
    ./{ pkgs, ... }: {
      home.packages = with pkgs; [
        gcc
        clang-tools
        cmake
        meson
        cargo
        rustc
        go
        nodejs
        bun
        yarn
        pnpm
      ];
    }
  ];
}