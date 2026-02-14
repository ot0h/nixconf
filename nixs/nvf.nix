{ inputs, pkgs, ... }:
{
  imports = [ inputs.nvf.homeManagerModules.default ];

  programs.nvf = {
    enable = true;
    enableManpages = true;
    settings = {
      vim = {
        viAlias = true;
        vimAlias = true;

        clipboard = {
          enable = true;
          providers = {
            wl-copy = {
              enable = true;
            };
            xclip = {
              enable = true;
            };
          };
        };

        keymaps = [
          {
            key = "-";
            mode = "n";
            silent = true;
            action = "<cmd>Oil<cr>";
          }
          {
            key = "<leader><leader>";
            mode = "n";
            silent = true;
            action = ":Telescope<CR>";
          }
        ];

        options = {
          shiftwidth = 2;
        };

        visuals = {
          indent-blankline = {
            enable = true;
          };

        };

        theme = {
          enable = true;
          name = "mini-base16";
          transparent = true;
          style = "dark";
        };

        formatter = {
          conform-nvim = {
            enable = true;
          };
        };

        binds = {
          whichKey = {
            enable = true;
          };
        };

        languages = {
          enableLSP = true;
          enableTreesitter = true;
          nix = {
            enable = true;
            treesitter = {
              enable = true;
            };

          };
          ts = {
            enable = true;
            treesitter = {
              enable = true;
            };
          };
          clang = {
            enable = true;
            treesitter = {
              enable = true;
            };
          };
          typst = {
            enable = true;
            treesitter = {
              enable = true;
            };
            extensions = {
              typst-preview-nvim = {
                enable = true;
              };
            };
          };
        };

        utility = {
          oil-nvim = {
            enable = true;
          };
          snacks-nvim = {
            enable = true;
          };
          smart-splits = {
            enable = true;

            keymaps = {
              resize_left = "<A-h>";
              resize_down = "<A-j>";
              resize_up = "<A-k>";
              resize_right = "<A-l>";
              move_cursor_left = "<C-h>";
              move_cursor_down = "<C-j>";
              move_cursor_up = "<C-k>";
              move_cursor_right = "<C-l>";
              move_cursor_previous = "<C-\\>";
              swap_buf_left = "<C-A-h>";
              swap_buf_down = "<C-A-j>";
              swap_buf_up = "<C-A-k>";
              swap_buf_right = "<C-A-l>";
            };

          };

          surround = {
            enable = true;

            setupOpts = {
              keypmas = {
                change = "gsr";
                change_line = "gSR";
                delete = "gsd";
                normal = "gs";
                normal_line = "gss";
                normal_cur = "gS";
                normal_cur_line = "gSS";
                visual = "gs";
                visual_line = "gS";
              };
            };
          };

          motion = {
            flash-nvim = {
              enable = true;
            };
          };
        };

        telescope.enable = true;
        autocomplete.nvim-cmp.enable = true;
        statusline.lualine.enable = true;
      };
    };
  };
}
