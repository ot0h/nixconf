{
  inputs,
  pkgs,
  ...
}: let
  llmAgents = inputs.llm-agents.packages.${pkgs.stdenv.hostPlatform.system};
in {
  # Herramientas de desarrollo
  home.packages = with pkgs; [
    git
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
}
