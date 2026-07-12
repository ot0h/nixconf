''
    # Para ocultar la barra de estado
    bind b set-option status

    # Recargar config
    bind M-Space send-prefix
    bind r source-file ~/.config/tmux/tmux.conf \; display-message "Se ajusto TMUX!"

    # Scroll fluido
    bind -n WheelUpPane if-shell -F -t = "#{mouse_any_flag}" "send-keys -M" "if -Ft= '#{pane_in_mode}' 'send-keys -M' 'copy-mode -e'"

    # --- Bindings (Vim Style) ---
    bind v split-window -h -c "#{pane_current_path}"
    bind s split-window -v -c "#{pane_current_path}"
    bind h previous-window
    bind l next-window
    bind X kill-window
    bind x kill-pane

    # --- Navegación inteligente Neovim/TMUX ---
    bind-key -n C-h if -F "#{@pane-is-vim}" 'send-keys C-h' 'select-pane -L'
    bind-key -n C-j if -F "#{@pane-is-vim}" 'send-keys C-j' 'select-pane -D'
    bind-key -n C-k if -F "#{@pane-is-vim}" 'send-keys C-k' 'select-pane -U'
    bind-key -n C-l if -F "#{@pane-is-vim}" 'send-keys C-l' 'select-pane -R'

    # --- Swap Paneles ---
    bind-key -n C-M-j if -F "#{@pane-is-vim}" 'send-keys C-M-j' 'swap-pane -D'
    bind-key -n C-M-k if -F "#{@pane-is-vim}" 'send-keys C-M-k' 'swap-pane -U'

    # --- Resize Paneles con Alt ---
    bind-key -n M-h if -F "#{@pane-is-vim}" 'send-keys M-h' 'resize-pane -L 3'
    bind-key -n M-j if -F "#{@pane-is-vim}" 'send-keys M-j' 'resize-pane -D 3'
    bind-key -n M-k if -F "#{@pane-is-vim}" 'send-keys M-k' 'resize-pane -U 3'
    bind-key -n M-l if -F "#{@pane-is-vim}" 'send-keys M-l' 'resize-pane -R 3'

    # --- Zoom + Navegación ---
    bind Up    if -F '#{window_zoomed_flag}' 'select-pane -U ; resize-pane -Z'
    bind Down  if -F '#{window_zoomed_flag}' 'select-pane -D ; resize-pane -Z'
    bind Left  if -F '#{window_zoomed_flag}' 'select-pane -L ; resize-pane -Z'
    bind Right if -F '#{window_zoomed_flag}' 'select-pane -R ; resize-pane -Z'

    # --- Copy Mode (vi) ---
    bind _ copy-mode

    bind-key -T copy-mode-vi 'C-h' select-pane -L
    bind-key -T copy-mode-vi 'C-j' select-pane -D
    bind-key -T copy-mode-vi 'C-k' select-pane -U
    bind-key -T copy-mode-vi 'C-l' select-pane -R
    bind-key -T copy-mode-vi 'C-\' select-pane -l
    bind-key -T copy-mode-vi v   send -X begin-selection
    bind-key -T copy-mode-vi y   send -X copy-selection-and-cancel
    bind-key -T copy-mode-vi C-v send -X rectangle-toggle
    bind -T copy-mode-vi Escape  send -X clear-selection
    bind -T copy-mode-vi q       send -X cancel

    # --- Sesiones ---
    bind-key j switch-client -p
    bind-key k switch-client -n

    # --- Border Styles ---
    set -g pane-border-style        'fg=colour1'
    set -g pane-active-border-style 'fg=colour3'

    # --- Sesh Config ---
    bind-key "Tab" run-shell "sesh connect \"$(
      sesh list --icons | fzf-tmux -p 80%,70% --color base16 \
        --no-sort --ansi --border-label ' sesh ' --prompt '  ' \
        --header '  ^a all ^t tmux ^g configs ^x zoxide ^d tmux kill ^f find' \
        --bind 'tab:down,btab:up' \
        --bind 'ctrl-a:change-prompt(  )+reload(sesh list --icons)' \
        --bind 'ctrl-t:change-prompt(  )+reload(sesh list -t --icons)' \
        --bind 'ctrl-g:change-prompt(  )+reload(sesh list -c --icons)' \
        --bind 'ctrl-x:change-prompt(  )+reload(sesh list -z --icons)' \
        --bind 'ctrl-f:change-prompt(  )+reload(fd -H -d 2 -t d -E .Trash . ~)' \
        --bind 'ctrl-d:execute(tmux kill-session -t {2..})+change-prompt(  )+reload(sesh list --icons)' \
        --preview-window 'right:55%' \
        --preview 'sesh preview {}'
    )\""

    # Scratchpad (Popup)
  bind-key o if-shell -F '#{==:#{session_name},scratch}' { detach-client } { display-popup -d "#{pane_current_path}" -w 80% -h 80% -E -b rounded -s "fg=colour4" -S "bg=colour0" "tmux new-session -A -s scratch \\; set -gq allow-passthrough on" }

    # Lazygit
    bind g display-popup  -d "#{pane_current_path}"  -w 95% -h 80%  -E "lazygit"
''
