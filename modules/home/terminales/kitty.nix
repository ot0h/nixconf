{pkgs, ...}: {
  programs.kitty = {
    enable = true;
    package = pkgs.kitty;

    extraConfig = ''
      include ~/.cache/wal/colors-kitty.conf
      include /tmp/kitty-opacity.conf
    '';
    settings = {
      font_family = "family=\"CaskaydiaCove Nerd Font\"";
      italic_font = "auto";
      bold_italic_font = "auto";
      font_size = 9.0;
      disable_ligatures = "never";
      clear_all_shortcuts = "yes";
      term = "xterm-kitty";
      enable_audio_bell = false;

      cursor_trail = 10;
      cursor_trail_start_threshold = 0;
      cursor_trail_decay = "0.01 0.05";
      cursor_beam_thickness = 1.5;
      cursor_underline_thickness = 2.0;
      cursor_blink_interval = 0.5;
      cursor_stop_blinking_after = 0;

      modify_font = "cell_width 110%";
      dynamic_background_opacity = true;
      hide_window_decorations = true;
      adjust_line_height = "110%";
      window_padding_width = 15;
      window_margin_width = 0;
      window_border_width = 0;

      detect_urls = true;
      shell = "fish";
      confirm_os_window_close = 0;
      mouse_hide_wait = -1;
      allow_remote_control = true;
    };

    keybindings = {
      "ctrl+shift+c" = "copy_to_clipboard";
      "ctrl+shift+v" = "paste_from_clipboard";
      "ctrl+shift+f5" = "load_config_file";
      "ctrl+shift+f6" = "debug_config";
      "ctrl+up" = "scroll_line_up";
      "ctrl+down" = "scroll_line_down";
      "ctrl+kp_add" = "change_font_size all +1.0";
      "ctrl+kp_subtract" = "change_font_size all -1.0";
      "ctrl+backspace" = "change_font_size all 0";
      "ctrl+shift+e" = "open_url_with_hints";
    };
  };
}
