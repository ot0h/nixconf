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

    # Utilidades
    jq
    procps
    clipse
    onefetch
    fastfetch
    delta

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

      # NestJS CLI
      if ! command -v nest &> /dev/null; then
        ${bun} i -g @nestjs/cli
      fi

      if ! command -v vscode-langservers-extracted &> /dev/null; then
        ${bun} i -g vscode-langservers-extracted
      fi
    '';
}
