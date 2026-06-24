{
  inputs,
  pkgs,
  lib,
  ...
}: let
  llmAgents = inputs.llm-agents.packages.${pkgs.stdenv.hostPlatform.system};
in {
  # Herramientas de desarrollo
  home.packages = with pkgs; [
    git
    git-filter-repo
    lazygit
    gh
    gh-dash
    prettier
    vtsls
    watchexec
    posting
    resterm

    # Python tools
    python314

    # Notas
    obsidian

    nest-cli

    # Utilidades
    jq
    procps
    clipse
    onefetch
    fastfetch
    delta

    lazydocker
    docker

    # Cloud
    google-drive-ocamlfuse

    # Typst
    typst

    #Cosas de IA
    llmAgents.opencode
    qwen-code
    (callPackage ./engram.nix {})
  ];

  # Instalar herramientas globales que no están en nixpkgs
  home.activation.installExtraTools = let
    bun = "${pkgs.bun}/bin/bun";
  in
    lib.hm.dag.entryAfter ["linkGeneration"] ''
      # some-sass-language-server
      if ! command -v some-sass-language-server &> /dev/null; then
        ${bun} i -g some-sass-language-server
      fi

      # Angular CLI
      if ! command -v ng &> /dev/null; then
        ${bun} i -g @angular/cli
      fi

      if ! command -v vscode-langservers-extracted &> /dev/null; then
        ${bun} i -g vscode-langservers-extracted
      fi
    '';
}
