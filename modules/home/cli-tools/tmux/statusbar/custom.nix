{c, ...}: let
  b = c;
in {
  config = ''
    # --- Custom Modern Statusbar (stylix) ---
    set -g status-position top
    set -g status-interval 1
    set -g status-style "bg=default"
    set -g status-justify "absolute-centre"

    # --- Left ---
    set -g status-left-length 100
    set -g status-left ""

    # Modo
    set -ga status-left "#{?client_prefix,#[bg=${b.base04} fg=${b.base00} bold]  PREFIX ,#{?#{==:#{pane_mode},copy-mode},#[bg=${b.base03} fg=${b.base07} bold]  COPY ,#[fg=${b.base03}]  NORMAL }}"

    # Separator
    set -ga status-left "#[bg=default fg=${b.base03}] ▎"

    # Sesión
    set -ga status-left "#[bg=default fg=${b.base07} bold]  #S "

    # Zoom
    set -ga status-left "#{?window_zoomed_flag,#[bg=default fg=${b.base03}]▎#[bg=${b.base01} fg=${b.base07} bold]  ZOOM ,}"

    # --- Right ---
    set -g status-right-length 100
    set -g status-right ""

    # RAM
    set -ga status-right "#[bg=${b.base01} fg=${b.base07} bold] 󰍛 #(free -h | awk 'NR==2{printf \"%.0f%%\", $3*100/$2 }') "

    # Separator
    set -ga status-right "#[bg=default fg=${b.base03}] ▎"

    # Batería
    set -ga status-right "#[bg=default fg=${b.base05}] #(acpi -b | awk '{ match($0, /([0-9]+)%/, a); p=a[1]; if(/Charging/){ if(p<=10)icon=\"󰢜\";else if(p<=20)icon=\"󰂆\";else if(p<=30)icon=\"󰂇\";else if(p<=40)icon=\"󰂈\";else if(p<=50)icon=\"󰢝\";else if(p<=60)icon=\"󰂉\";else if(p<=70)icon=\"󰢞\";else if(p<=80)icon=\"󰂊\";else if(p<=90)icon=\"󰂋\";else icon=\"󰂄\";}else{ if(p<=10)icon=\"󰁺\";else if(p<=20)icon=\"󰁻\";else if(p<=30)icon=\"󰁼\";else if(p<=40)icon=\"󰁽\";else if(p<=50)icon=\"󰁾\";else if(p<=60)icon=\"󰁿\";else if(p<=70)icon=\"󰂀\";else if(p<=80)icon=\"󰁁\";else if(p<=90)icon=\"󰂂\";else icon=\"󰁹\";} print icon \" \" p \"%\" }') "

    # Separator
    set -ga status-right "#[bg=default fg=${b.base03}] ▎"

    # Hora
    set -ga status-right "#[bg=${b.base02} fg=${b.base07} bold]  %H:%M "

    # --- Window Status ---
    set -g window-status-format         "#[bg=${b.base03} fg=${b.base00} bold] #I #[bg=default fg=${b.base03}] #W "
    set -g window-status-current-format "#[bg=${b.base02} fg=${b.base07} bold] #I #[bg=default fg=${b.base07} bold] #W "
    set -g window-status-style          "bg=default"
    set -g window-status-bell-style     "bg=${b.base08} fg=${b.base00} bold"
    set -gF window-status-separator     "#[bg=default fg=${b.base03}] "

    # --- Borders ---
    set -g pane-border-style        "fg=${b.base01}"
    set -g pane-active-border-style "fg=${b.base04}"
  '';
}
