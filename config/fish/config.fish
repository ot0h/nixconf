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

# Shell Integration
fzf --fish | source
zoxide init fish | source
atuin init fish | source
starship init fish | source
