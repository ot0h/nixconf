{
  pkgs,
  lib,
  inputs,
  ...
}: let
  neovim-nightly = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;

  bins = with pkgs; [
    git
    gcc
    gnumake
    unzip
    wget
    curl
    tree-sitter
    ripgrep
    fd
    fzf
    lazygit

    # LUA
    lua-language-server
    stylua

    # TYPESCRIPT / JS
    nodejs
    nodePackages.npm
    vtsls
    nodePackages.prettier
    yarn
    deno
    pnpm

    # C++ / C
    clang-tools
    gdb

    # TYPST
    tinymist
    typstyle

    # NIX
    nixd
    alejandra

    # Rust
    rust-analyzer
    rustfmt

    # Python
    basedpyright
    ruff

    # Go
    go
    gopls
    gotools

    emmet-language-server
    vscode-langservers-extracted
  ];

  linuxBins =
    if pkgs.stdenv.isDarwin
    then []
    else
      with pkgs; [
        wl-clipboard
        xsel
        xclip
      ];
in {
  home.packages = [
    (pkgs.wrapNeovimUnstable neovim-nightly {
      withNodeJs = true;
      withPython3 = false;
      withRuby = false;
      wrapRc = false;
      configure = {
        packages.myPlugins = with pkgs.vimPlugins; {
          start = [
            # typst-preview-nvim
            # oil-nvim
          ];
          opt = [];
        };
      };
      wrapperArgs = [
        "--set"
        "SHELL"
        "${pkgs.bash}/bin/bash"
        "--suffix"
        "PATH"
        ":"
        "${lib.makeBinPath (bins ++ linuxBins)}"
      ];
    })
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };
}
