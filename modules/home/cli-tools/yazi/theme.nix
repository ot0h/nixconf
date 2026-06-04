{...}: {
  programs.yazi.theme = {
    mgr = {
      border_symbol = " ";
      border_style = {fg = "#838ba7";};
    };

    icon = {
      prepend_conds = [
        {
          "if" = "dir";
          text = "";
        }
      ];
      prepend_dirs = [
        {
          name = "Games";
          text = "󰊖";
        }
        {
          name = "nvim";
          text = "";
        }
        {
          name = "kitty";
          text = "󰄛";
        }
        {
          name = "ghostty";
          text = "";
        }
        {
          name = "yazi";
          text = "󰇥";
        }
        {
          name = "hypr";
          text = "";
        }
        {
          name = "i3";
          text = "";
        }
        {
          name = "sway";
          text = "";
        }
        {
          name = "TIGO";
          text = "";
        }
        {
          name = "Libros";
          text = "󱉟";
        }
        {
          name = "books";
          text = "󱉟";
        }
        {
          name = "CODE";
          text = "";
        }
        {
          name = "CEUTEC";
          text = "";
        }
        {
          name = "dotfiles";
          text = "";
        }
        {
          name = "scripts";
          text = "󰯂";
        }
        {
          name = "OBS";
          text = "󰻃";
        }
        {
          name = "spotify";
          text = "";
        }
        {
          name = "tmux";
          text = "";
        }
        {
          name = "go";
          text = "";
        }
      ];
      append_exts = [
        {
          name = "aseprite";
          text = "󰽉";
        }
        {
          name = "ts";
          text = "";
        }
      ];
      prepend_exts = [];
    };

    tabs = {
      sep_inner = {
        open = "";
        close = "";
      };
      sep_outer = {
        open = "";
        close = "";
      };
    };

    status = {
      sep_left = {
        open = "🭁";
        close = "🭠";
      };
      sep_right = {
        open = "🭁";
        close = "🭠";
      };
      progress_label = {bold = true;};
    };

    indicator = {
      padding = {
        open = "█";
        close = "█";
      };
    };
  };
}
