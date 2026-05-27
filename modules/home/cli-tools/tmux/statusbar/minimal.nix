{pkgs ? null}: {
  config = ''
    # --- Minimal Statusbar ---
    set -g status-interval 1

    # Pane border
    setw -g pane-border-status bottom
    set -g pane-border-format "#[align=centre]#{?pane_active,#[bold],#[fg=black,bg=default]} #{pane_index} • #{?pane_active,#[bold],#[fg=black,bg=default]}#{pane_current_command} "
    setw -g pane-border-lines single

    # Left vacío (ventanas a la izquierda)
    set -g status-left ""

    # Right: sesión + estado del cliente
    set -g status-right "#[fg=white bg=default] #S #[fg=brightblack bg=default]•#{?pane_in_mode,#[bold fg=yellow]#[bg=default]  ,#{?window_zoomed_flag,#[bold fg=cyan]#[bg=default]  ,#{?client_prefix,#[bold fg=red]#[bg=default]  ,#[bold fg=blue]#[bg=default]  }}}"

    # Estilo general
    set -g status-style             bg=default
    set -g pane-active-border-style "fg=brightblack"
    set -g pane-border-style        "fg=black"

    # Ventanas: solo índice, alineadas a la izquierda
    set -g status-justify               "left"
    set -g window-status-format         "#[fg=white bg=default] #I "
    set -g window-status-current-format "#[fg=red bg=default bold] #I "
  '';
}
