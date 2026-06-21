# Traducido de ~/.config/nvim/lua/config/keymaps.lua
# Atajos al estilo Neovim para Zed (Linux)
[
  # ── Pane / Split Navigation (SmartSplits) ──────────────────────────
  # Navegar entre paneles: C-h/j/k/l
  # Redimensionar:         M-h/j/k/l
  # Intercambiar paneles:  C-M-h/j/k/l
  {
    context = "Editor && vim_mode";
    bindings = {
      # Navegación
      "ctrl-h" = "workspace::ActivatePaneLeft";
      "ctrl-j" = "workspace::ActivatePaneDown";
      "ctrl-k" = "workspace::ActivatePaneUp";
      "ctrl-l" = "workspace::ActivatePaneRight";
      # Redimensionar
      "alt-h" = "vim::ResizePaneLeft";
      "alt-j" = "vim::ResizePaneDown";
      "alt-k" = "vim::ResizePaneUp";
      "alt-l" = "vim::ResizePaneRight";
      # Swap
      "ctrl-alt-h" = "workspace::SwapPaneLeft";
      "ctrl-alt-j" = "workspace::SwapPaneDown";
      "ctrl-alt-k" = "workspace::SwapPaneUp";
      "ctrl-alt-l" = "workspace::SwapPaneRight";
    };
  }

  # ── Terminal ────────────────────────────────────────────────────
  # Navegar paneles desde terminal (C-h/j/k/l te saca al editor)
  {
    context = "Terminal";
    bindings = {
      "ctrl-h" = "workspace::ActivatePaneLeft";
      "ctrl-j" = "workspace::ActivatePaneDown";
      "ctrl-k" = "workspace::ActivatePaneUp";
      "ctrl-l" = "workspace::ActivatePaneRight";
    };
  }

  # ── Buffer / Tab Navigation ───────────────────────────────────────
  # H/L para navegar buffers anterior/siguiente (como en Neovim)
  {
    context = "Editor && vim_mode";
    bindings = {
      "shift-h" = "pane::ActivatePrevItem";
      "shift-l" = "pane::ActivateNextItem";
    };
  }

  # ── LSP ───────────────────────────────────────────────────────────
  {
    context = "Editor && vim_mode";
    bindings = {
      # Navegación LSP (como gd, gR, gI en Neovim)
      "g d" = "editor::GoToDefinition";
      "g R" = "editor::FindAllReferences";
      "g I" = "editor::GoToImplementation";
      # Hover (K en Neovim)
      "shift-k" = "editor::Hover";
    };
  }

  # ── Picker / File Finding ────────────────────────────────────────
  {
    context = "Editor && vim_mode";
    bindings = {
      # Smart picker (como <space><space> en Neovim)
      "space space" = "file_finder::Toggle";
      # Command palette (como <space>p en Neovim)
      "space p" = "command_palette::Toggle";
      # Grep / Project search (como <leader>fg en Neovim)
      "space f g" = "project_search::ToggleFocus";
      # Explorer / Project panel (como <leader>e en Neovim)
      "space e" = "project_panel::ToggleFocus";
      # LazyGit (como <leader>gg en Neovim)
      "space g g" = "task::Spawn";
    };
  }

  # ── Diagnostic / LSP actions ─────────────────────────────────────
  {
    context = "Editor && vim_mode";
    bindings = {
      # Diagnostic bajo el cursor (como <space>k en Neovim)
      "space k" = "editor::GoToDiagnostic";
      # Formatear (como <space>F en Neovim)
      "space F" = "editor::Format";
    };
  }

  # ── UI Toggles (como <leader>u* en Neovim) ───────────────────────
  {
    context = "Editor && vim_mode";
    bindings = {
      # Toggle soft wrap (como <leader>uw en Neovim)
      "space u w" = "editor::ToggleSoftWrap";
      # Toggle inlay hints (como <leader>uh en Neovim)
      "space u h" = "editor::ToggleInlayHints";
    };
  }

  # ── Save ─────────────────────────────────────────────────────────
  {
    context = "Editor && vim_mode";
    bindings = {
      "ctrl-s" = "workspace::Save";
    };
  }

  # ── Completions (como en Neovim) ─────────────────────────────────
  {
    context = "Editor && showing_completions";
    bindings = {
      # Aceptar completion (C-y en Neovim)
      "ctrl-y" = "editor::ConfirmCompletion";
      # Cancelar / cerrar menú (C-c en Neovim)
      "ctrl-c" = "editor::Cancel";
    };
  }

  # ── Code Actions ─────────────────────────────────────────────────
  {
    context = "Editor && vim_mode";
    bindings = {
      # Code actions (como <space>A en Neovim)
      "space A" = "editor::ToggleCodeActions";
    };
  }
]
