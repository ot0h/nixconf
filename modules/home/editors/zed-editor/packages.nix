{
  pkgs,
  lib,
}: let
  base = with pkgs; [
    # Git / build tools
    git
    gcc
    gnumake
    unzip
    wget
    curl

    # Search / nav
    ripgrep
    fd
    fzf
    tree-sitter

    # LazyGit
    lazygit

    # TypeScript / JS
    nodejs_latest
    vtsls
    prettier
    yarn
    pnpm
    angular-language-server

    # Nix
    nixd
    alejandra

    # Rust
    rust-analyzer
    rustfmt
    taplo
    clippy

    # Python
    basedpyright
    ruff

    # Go
    go
    gopls
    gotools

    # C / C++
    clang-tools
    gdb

    # Typst
    tinymist
    typstyle

    # Elixir
    elixir-ls

    # C# / .NET
    roslyn-ls
    dotnet-sdk_8

    # HTML / CSS / Tailwind / Emmet
    emmet-language-server
    vscode-langservers-extracted
    tailwindcss-language-server
    superhtml

    # Bash
    bash-language-server
    shfmt

    # Lua
    lua-language-server
    stylua
  ];

  linuxOnly = lib.optionals (!pkgs.stdenv.isDarwin) (with pkgs; [
    wl-clipboard
    xsel
    xclip
  ]);
in
  base ++ linuxOnly
