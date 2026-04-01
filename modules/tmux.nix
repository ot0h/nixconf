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

      # Scroll fluido
      bind -n WheelUpPane if-shell -F -t = "#{mouse_any_flag}" "send-keys -M" "if -Ft= '#{pane_in_mode}' 'send-keys -M' 'copy-mode -e'"

      # --- Bindings (Vim Style) ---
      bind v split-window -h -c "#{pane_current_path}"
      bind s split-window -v -c "#{pane_current_path}"
      bind h previous-window
      bind l next-window
      bind X kill-window
      bind x kill-pane

      # Navegación inteligente Neovim/TMUX
      bind-key -n C-h if -F "#{@pane-is-vim}" 'send-keys C-h' 'select-pane -L'
      bind-key -n C-j if -F "#{@pane-is-vim}" 'send-keys C-j' 'select-pane -D'
      bind-key -n C-k if -F "#{@pane-is-vim}" 'send-keys C-k' 'select-pane -U'
      bind-key -n C-l if -F "#{@pane-is-vim}" 'send-keys C-l' 'select-pane -R'

      # --- Status Bar (Fish Friendly) ---
      set -g status-position top
      set -g status-interval 2
      set -g status-style "bg=default"
      set -g status-justify "absolute-centre"

      set -g status-left-length 100
      set -g status-left "#[bg=default,fg=colour4]  #{pane_current_command} #[fg=colour15]│ #[fg=colour4] #{=/-32/...:#{s|$USER|~|:#{b:pane_current_path}}} #{?window_zoomed_flag,#[fg=colour7 bold] zoom ,}"

      set -g status-right-length 150
      set -g status-right " #{?client_prefix,#[fg=colour8 bold]PREFIX ,#{?#{==:#{pane_mode},copy-mode},#[fg=colour3 bold]COPY ,#[fg=colour4 bold]NORMAL }}#[fg=colour15]│ #[fg=colour15,bold] #S "

      # RAM & Batería (con sh -c para que fish no se queje)
      set -ga status-right "#[bg=none,fg=colour15,none]│ #[fg=colour5,bold]󰍛 #(sh -c \"${pkgs.procps}/bin/free -h | awk 'NR==2{printf \\\"%.0f%%\\\", \$3*100/\$2 }'\")"
      set -ga status-right "#[bg=none,fg=colour15,none] │ #[fg=colour5,bold]#(sh -c \"${pkgs.acpi}/bin/acpi -b | awk '{ match(\$0, /([0-9]+)%/, a); p=a[1]; if(/Charging/){ if(p<=10)icon=\\\"󰢜\\\";else if(p<=20)icon=\\\"󰂆\\\";else if(p<=30)icon=\\\"󰂇\\\";else if(p<=40)icon=\\\"󰂈\\\";else if(p<=50)icon=\\\"󰢝\\\";else if(p<=60)icon=\\\"󰂉\\\";else if(p<=70)icon=\\\"󰢞\\\";else if(p<=80)icon=\\\"󰂊\\\";else if(p<=90)icon=\\\"󰂋\\\";else icon=\\\"󰂄\\\";}else{ if(p<=10)icon=\\\"󰁺\\\";else if(p<=20)icon=\\\"󰁻\\\";else if(p<=30)icon=\\\"󰁼\\\";else if(p<=40)icon=\\\"󰁽\\\";else if(p<=50)icon=\\\"󰁾\\\";else if(p<=60)icon=\\\"󰁿\\\";else if(p<=70)icon=\\\"󰂀\\\";else if(p<=80)icon=\\\"󰂁\\\";else if(p<=90)icon=\\\"󰂂\\\";else icon=\\\"󰁹\\\";} print icon \\\" \\\" p \\\"%\\\" }'\")"

      # --- Plugins Config ---
      set -g @resurrect-capture-pane-contents 'on'
      set -g @resurrect-processes 'yazi'

      # Scratchpad (Popup)
      bind-key o if-shell -F '#{==:#{session_name},scratch}' { detach-client } { display-popup -d "#{pane_current_path}" -E "tmux new-session -A -s scratch" }
    '';
  };

  home.packages = statusBins;
}
