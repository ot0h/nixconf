{pkgs ? null}: {
  config = ''
    # --- Custom Modern Statusbar ---
    set -g status-position top
    set -g status-interval 1
    set -g status-style "bg=default"
    set -g status-justify "absolute-centre"

    # --- Left ---
    set -g status-left-length 100
    set -g status-left ""

    # Modo
    set -ga status-left "#{?client_prefix,#[bg=colour1 fg=colour0 bold]  PREFIX ,#{?#{==:#{pane_mode},copy-mode},#[bg=colour3 fg=colour0 bold]  COPY ,#[bg=colour4 fg=colour0 bold]  NORMAL }}"

    # Sesión
    set -ga status-left "#[bg=default fg=colour8] ▎"
    set -ga status-left "#[bg=colour0 fg=colour15 bold]  #S "

    # Comando actual
    # set -ga status-left "#[bg=default fg=colour8] ▎"
    # set -ga status-left "#[bg=colour8 fg=colour15]  #{pane_current_command} "

    # Path
    set -ga status-left "#[bg=default fg=colour8] ▎"
    set -ga status-left "#[bg=colour0 fg=colour15]  #{=/-32/...:#{s|$USER|~|:#{b:pane_current_path}}} "

    # Zoom
    set -ga status-left "#{?window_zoomed_flag,#[bg=default fg=colour8]▎#[bg=colour6 fg=colour0 bold]  ZOOM ,}"

    # --- Right ---
    set -g status-right-length 100
    set -g status-right ""

    # RAM
    set -ga status-right "#[bg=colour5 fg=colour0 bold] 󰍛 #(free -h | awk 'NR==2{printf \"%.0f%%\", $3*100/$2 }') "

    # Batería
    set -ga status-right "#[bg=default fg=colour8] ▎"
    set -ga status-right "#[bg=colour0 fg=colour15] #(acpi -b | awk '{ match($0, /([0-9]+)%/, a); p=a[1]; if(/Charging/){ if(p<=10)icon=\"󰢜\";else if(p<=20)icon=\"󰂆\";else if(p<=30)icon=\"󰂇\";else if(p<=40)icon=\"󰂈\";else if(p<=50)icon=\"󰢝\";else if(p<=60)icon=\"󰂉\";else if(p<=70)icon=\"󰢞\";else if(p<=80)icon=\"󰂊\";else if(p<=90)icon=\"󰂋\";else icon=\"󰂄\";}else{ if(p<=10)icon=\"󰁺\";else if(p<=20)icon=\"󰁻\";else if(p<=30)icon=\"󰁼\";else if(p<=40)icon=\"󰁽\";else if(p<=50)icon=\"󰁾\";else if(p<=60)icon=\"󰁿\";else if(p<=70)icon=\"󰂀\";else if(p<=80)icon=\"󰂁\";else if(p<=90)icon=\"󰂂\";else icon=\"󰁹\";} print icon \" \" p \"%\" }') "

    # Hora
    set -ga status-right "#[bg=default fg=colour8] ▎"
    set -ga status-right "#[bg=colour2 fg=colour0 bold]  %H:%M "

    # --- Window Status ---
    set -g window-status-format         "#[bg=colour8 fg=colour0 bold] #I #[bg=default fg=colour8] #W "
    set -g window-status-current-format "#[bg=colour4 fg=colour0 bold] #I #[bg=default fg=colour15 bold] #W "
    set -g window-status-style          "bg=default"
    set -g window-status-bell-style     "bg=colour1 fg=colour0 bold"
    set -gF window-status-separator     "#[bg=default fg=colour8] "

    # --- Borders ---
    set -g pane-border-style        "fg=colour0"
    set -g pane-active-border-style "fg=colour4"
  '';
}
