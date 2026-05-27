{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:
buildGoModule (finalAttrs: {
  pname = "engram";
  version = "1.15.15";

  src = fetchFromGitHub {
    owner = "Gentleman-Programming";
    repo = "engram";
    tag = "v${finalAttrs.version}";
    hash = "sha256-QtR90b16BC+dVRQFNZy0pAXoX0hb0MCX7ZnIr7JsCNQ=";
  };

  vendorHash = "sha256-O+pC4x4DKNUWr7Sx9iZOjK6a64wrQA4/lnjvkNLBX64=";

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
