{
  pkgs,
  lib,
  ...
}: let
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
    vscode-langservers-extracted

    # AI
    lsof
    ps

    # Fish y Bash
    fish-lsp
    bash-language-server
    shfmt
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

  # Wrapper que expone los LSPs/tools solo cuando ejecutás hx,
  # sin contaminar el PATH global — mismo concepto que wrapNeovimUnstable.
  helix-wrapped = let
    original = pkgs.evil-helix;
    extraPath = lib.makeBinPath (bins ++ linuxBins);
  in
    pkgs.symlinkJoin {
      name = "helix-wrapped";
      paths = [original];
      nativeBuildInputs = [pkgs.makeWrapper];
      postBuild = ''
        wrapProgram $out/bin/hx \
          --prefix PATH : "${extraPath}"
      '';
    };
in {
  programs.helix = {
    enable = true;
    package = helix-wrapped;

    settings = {
      theme = "base16_terminal";
      editor = {
        # Display & cursor
        line-number = "relative";
        cursorline = true;
        color-modes = true;
        scrolloff = 8;

        # use system clipboard by default
        default-yank-register = "+";

        # Wrap long lines to the viewport (word-wrap style; does not insert hard line endings)
        soft-wrap = {
          enable = true;
        };

        # Completion / formatting
        auto-format = true;
        preview-completion-insert = true;
        completion-timeout = 5;
        idle-timeout = 200;
        end-of-line-diagnostics = "hint";

        # Save to disk on focus loss and after idle (helps LSP see disk changes)
        auto-save = {
          focus-lost = true;
          after-delay = {
            enable = true;
            timeout = 2000;
          };
        };

        # LSP: inlay hints, signature help, progress / messages in status area
        lsp = {
          display-messages = true;
          display-progress-messages = true;
          display-inlay-hints = true;
          auto-signature-help = true;
        };

        inline-diagnostics = {
          cursor-line = "hint";
          other-lines = "disable";
        };

        # Buffers tab strip, menu borders, status line layout
        bufferline = "multiple";
        popup-border = "menu";
        statusline = {
          left = [
            "mode"
            "spinner"
            "version-control"
            "file-name"
            "read-only-indicator"
            "file-modification-indicator"
          ];
          center = [];
          right = [
            "workspace-diagnostics"
            "diagnostics"
            "selections"
            "position"
            "position-percentage"
            "file-type"
            "file-encoding"
            "file-line-ending"
          ];
          separator = "│";
          diagnostics = [
            "error"
            "warning"
            "info"
          ];
          workspace-diagnostics = [
            "error"
            "warning"
          ];
          mode = {
            normal = "NORMAL";
            insert = "INSERT";
            select = "SELECT";
          };
        };

        # Show dotfiles in picker (project-wide ignores still apply)
        file-picker.hidden = false;

        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
        indent-guides.render = true;
      };
      # ─── NOTA SOBRE KEYBINDS ───────────────────────────────────────
      # Helix NO usa el modelo "verbo + sustantivo" de Vim.
      # No se pueden mapear d+w / y+w / c+w como operador + motion.
      # Helix es "sustantivo + verbo": primero seleccionás (w, b, miw...),
      # después actuás (d, y, c). Es un paradigma distinto, no configurable.
      # Los movimientos básicos (h/j/k/l/w/b/e/f/t/gg/G/%) ya vienen igual.
      # ───────────────────────────────────────────────────────────────
    };
  };
}
