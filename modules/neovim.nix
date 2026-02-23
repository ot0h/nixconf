{
  pkgs,
  lib,
  inputs,
  ...
}: let
  # 1. Definimos el paquete base (el nightly puro de la fuente)
  # Usamos 'inputs' para ir directo al grano
  neovim-nightly = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;

  # 2. Herramientas que Neovim va a tener "en su mochila" (PATH)
  # Solo lo que pediste: TS, C++, Typst y Lua
  bins = with pkgs; [
    # Esenciales para que plugins como Lazy o Mason no chillen
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

    # C++ / C
    clang-tools
    gdb
    cmake

    # TYPST
    tinymist
    typst
    typstyle

    # NIX (siempre es bueno tenerlo para tu config)
    nixd
    alejandra
  ];

  # Herramientas específicas para Linux (Clipboard)
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
