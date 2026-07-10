{
  lib,
  pkgs,
  ...
}: let
  font = "Departure Mono";
in {
  assistant = {
    enabled = true;
    version = "2";
    default_open_ai_model = null;
    default_model = {
      provider = "zed.dev";
      model = "claude-3-5-sonnet-latest";
    };
  };

  node = {
    path = lib.getExe pkgs.nodejs_latest;
    npm_path = lib.getExe' pkgs.nodejs_latest "npm";
  };

  hour_format = "hour24";
  auto_update = false;

  sessions = {
    trust_all_worktrees = true;
  };

  terminal = {
    alternate_scroll = "off";
    blinking = "off";
    copy_on_select = false;
    dock = "bottom";
    detect_venv = {
      on = {
        directories = [".env" "env" ".venv" "venv"];
        activate_script = "default";
      };
    };
    env = {
      TERM = "kitty";
    };
    font_family = font;
    font_features = null;
    font_size = null;
    line_height = "comfortable";
    option_as_meta = false;
    button = false;
    shell = "system";
    toolbar = {
      title = true;
    };
    working_directory = "current_project_directory";
  };

  vim_mode = true;
  load_direnv = "shell_hook";
  base_keymap = "VSCode";

  ui_font_family = font;
  buffer_font_family = font;
  show_whitespaces = "all";
  ui_font_size = lib.mkDefault 14;
  buffer_font_size = lib.mkDefault 14;
}
