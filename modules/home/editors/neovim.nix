{
  pkgs,
  lib,
  inputs,
  ...
}: let
  neovim-nightly = inputs.neovim-nightly-overlay.packages.${pkgs.stdenv.hostPlatform.system}.default;

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
    tailwindcss-language-server

    # LUA
    lua-language-server
    stylua

    # TYPESCRIPT / JS
    nodejs_latest
    vtsls
    prettier
    yarn
    pnpm
    angular-language-server

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
    taplo
    clippy

    # Python
    basedpyright
    ruff

    # Go
    go
    gopls
    gotools

    # Extras
    emmet-language-server

    #AI
    lsof
    ps

    #Fish y Bash
    fish-lsp
    bash-language-server
    shfmt

    # SQL
    sqls
    sql-formatter
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
