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
    # 3. El Wrapper: Aquí es donde armamos el Neovim con esteroides
    (pkgs.wrapNeovimUnstable neovim-nightly {
      withNodeJs = true;
      withPython3 = false;
      withRuby = false;
      wrapRc = false; # Esto deja que tu init.lua en ~/.config/nvim mande
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

  # Definimos nvim como el editor por defecto en la terminal
  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };
}
