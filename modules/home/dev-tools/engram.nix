{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:
buildGoModule (finalAttrs: {
  pname = "engram";
  version = "2.0.0";

  src = fetchFromGitHub {
    owner = "Gentleman-Programming";
    repo = "engram";
    tag = "v${finalAttrs.version}";
    hash = "sha256-d5bxn72roCafsnnRUZcwf66QcgZWXNdY/eqoqBP/W4s=";
  };

  vendorHash = "sha256-tLWuHdnJgBSlzcyvXLzxtvzHSgoZqVXhmUjg2phBgYw=";

  # Tests require git in sandbox PATH; not worth the dependency for personal use
  doCheck = false;

  ldflags = [
    "-s"
    "-w"
    "-X=main.version=${finalAttrs.version}"
  ];

  meta = {
    description = "Persistent memory system for AI coding agents. Agent-agnostic Go binary with SQLite + FTS5, MCP server, HTTP API, CLI, and TUI";
    homepage = "https://github.com/Gentleman-Programming/engram";
    changelog = "https://github.com/Gentleman-Programming/engram/blob/${finalAttrs.src.rev}/CHANGELOG.md";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [rrimv];
    mainProgram = "engram";
  };
})
