{
  pkgs,
  lib,
  ...
}: let
  statusBins = with pkgs; [
    procps
    acpi
  ];

  tmuxPluginsList = with pkgs.tmuxPlugins; [
    sensible
    vim-tmux-navigator
    resurrect
    continuum
    tmux-fzf
  ];
in {
  programs.tmux = {
    enable = true;
    shell = "${pkgs.fish}/bin/fish";
    terminal = "tmux-256color";
    prefix = "M-Space";
    baseIndex = 1;
    mouse = true;
    keyMode = "vi";
    escapeTime = 0;

    plugins = tmuxPluginsList;

    extraConfig = ''
      # --- Fix de Terminal & Colores ---
      set -as terminal-overrides ',xterm-256color:Tc:smulx=\E[4:3m:rmulx=\E[4:0m:sitm=\E[3m:ritm=\E[23m'
      set -g focus-events on
      set -g allow-passthrough on

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

      # --- last-pane con C-\ (version-aware) ---
      tmux_version='$(tmux -V | sed -En "s/^tmux ([0-9]+(.[0-9]+)?).*/\1/p")'
      if-shell -b '[ "$(echo "$tmux_version < 3.0" | bc)" = 1 ]' \
          "bind-key -n 'C-\' if -F "#{@pane-is-vim}" 'send-keys C-\'  'select-pane -l'"
      if-shell -b '[ "$(echo "$tmux_version >= 3.0" | bc)" = 1 ]' \
          "bind-key -n 'C-\' if -F "#{@pane-is-vim}" 'send-keys C\\'  'select-pane -l'"

      # --- Zoom + Navegación ---
      bind Up if -F '#{window_zoomed_flag}' 'select-pane -U ; resize-pane -Z'
      bind Down if -F '#{window_zoomed_flag}' 'select-pane -D ; resize-pane -Z'
      bind Left if -F '#{window_zoomed_flag}' 'select-pane -L ; resize-pane -Z'
      bind Right if -F '#{window_zoomed_flag}' 'select-pane -R ; resize-pane -Z'

      # --- Copy Mode (vi) ---
      bind _ copy-mode

      bind-key -T copy-mode-vi 'C-h' select-pane -L
      bind-key -T copy-mode-vi 'C-j' select-pane -D
      bind-key -T copy-mode-vi 'C-k' select-pane -U
      bind-key -T copy-mode-vi 'C-l' select-pane -R
      bind-key -T copy-mode-vi 'C-\' select-pane -l
      bind-key -T copy-mode-vi v send -X begin-selection
      bind-key -T copy-mode-vi y send -X copy-selection-and-cancel
      bind-key -T copy-mode-vi C-v send -X rectangle-toggle
      bind -T copy-mode-vi Escape send -X clear-selection
      bind -T copy-mode-vi q send -X cancel

      # --- Sesiones ---
      bind-key j switch-client -p
      bind-key k switch-client -n

      # --- Borrar archivos de resurrect ---
      bind-key M-d command-prompt -p "Borrar archivos de resurrect? (y/n)" "run-shell 'if [ \"%\" = \"y\" ]; then rm -f ~/.local/share/tmux/resurrect/* && tmux display-message \"Archivos de resurrect eliminados\"; else tmux display-message \"Cancelado\"; fi'"

      # --- Border Styles ---
      set -g pane-border-style 'fg=colour1'
      set -g pane-active-border-style 'fg=colour3'

      # --- Status Bar ---
      set -g status-position top
      set -g status-interval 1
      set -g status-style "bg=default"
      set -g status-justify "absolute-centre"

      set -g status-left-length 100
      set -g status-left "#[bg=default,fg=colour4]  #{pane_current_command} #[fg=colour15]│ #[fg=colour4] #{=/-32/...:#{s|$USER|~|:#{b:pane_current_path}}} #{?window_zoomed_flag,#[fg=colour7]❯#[fg=colour7 bold]  zoom ,}"

      set -g status-right-length 100
      set -g status-right " #{?client_prefix,#[fg=colour8 bold]PREFIX ,#{?#{==:#{pane_mode},copy-mode},#[fg=colour3 bold]COPY ,#[fg=colour4 bold]NORMAL }}#[fg=colour15]│ #[fg=colour15,bold] #S "

      # --- Window Status ---
      set -g window-status-format " #I#{?#{!=},: #W,} "
      set -g window-status-style "bg=default,fg=colour2"
      set -g window-status-bell-style "bg=colour1,fg=colour5,bold"
      set -gF window-status-separator "#[bg=none,fg=colour15]│"

      set -g window-status-current-format " #I#{?#{!=},: #W,} "
      set -g window-status-current-style "bg=default,fg=colour4,bold"

      # --- Plugins Config ---
      set -g @resurrect-capture-pane-contents 'on'
      set -g @resurrect-processes 'yazi'
      # Nota: @resurrect-strategy-vim no existe, es @resurrect-strategy-nvim
      # set -g @resurrect-strategy-nvim 'session'

      # Scratchpad (Popup)
      bind-key o if-shell -F '#{==:#{session_name},scratch}' { detach-client } { display-popup -d "#{pane_current_path}" -E "tmux new-session -A -s scratch" }
    '';
  };

  home.packages = statusBins;
}
