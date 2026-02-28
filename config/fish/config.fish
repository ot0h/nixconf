if status is-interactive
    # --- Zoxide ---
    abbr -a ze 'zoxide edit'
    abbr -a cd z # Para que el viejo cd use la magia de zoxide

    # --- Servidor ---
    abbr -a lsrv 'bunx browser-sync start --server --files "**/*"'

    # --- Bun (para que no te canses los dedos) ---
    abbr -a bi 'bun install'
    abbr -a ba 'bun add'
    abbr -a bx bunx
    abbr -a br 'bun run'
    abbr -a bd 'bun dev'

    # --- Utilidades ---
    abbr -a .. 'cd ..'
    abbr -a ... 'cd ../..'
    abbr -a cls clear
end

set -g fish_greeting ""

# TMUX
set -x TMUX_CONF ~/.config/tmux/tmux.conf

# Cosas
set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx SUDO_EDITOR nvim
set -gx MANPAGER "nvim +Man!"
set -gx PAGER "nvim -R"
set -gx MANWIDTH 999

# Vim Mode papi
# Emulates vim's cursor shape behavior
# Set the normal and visual mode cursors to a block
set fish_cursor_default block
# Set the insert mode cursor to a line
set fish_cursor_insert line
# Set the replace mode cursors to an underscore
set fish_cursor_replace_one underscore
set fish_cursor_replace underscore
# Set the external cursor to a line. The external cursor appears when a command is started.
# The cursor shape takes the value of fish_cursor_default when fish_cursor_external is not specified.
set fish_cursor_external line
# The following variable can be used to configure cursor shape in
# visual mode, but due to fish_cursor_default, is redundant here
set fish_cursor_visual block
# Shell Integration
fzf --fish | source
zoxide init fish | source
atuin init fish | source
starship init fish | source
