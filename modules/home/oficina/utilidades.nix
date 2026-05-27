{...}: {
  programs.sioyek = {
    enable = true;
    config = {
      "show_statusbar_only_when_hovered" = "true";
      startup_commands = [
        "toggle_visual_scroll"
        "toggle_dark_mode"
      ];
    };
    bindings = {
      "move_up" = "k";
      "move_down" = "j";
      "move_left" = "l";
      "move_right" = "h";
      "screen_down" = ["d" "<c-d>"];
      "screen_up" = ["u" "<c-u>"];
    };
  };
}
