{inputs, ...}: {
  imports = [inputs.nvf.homeManagerModules.default];

  programs.nvf = {
    enable = false;
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
              enable = false;
            };
          };

          registers = "unnamedplus";
        };

        mini = {
          icons = {
            enable = true;
          };
        };
        lsp = {
          enable = true;
          inlayHints.enable = true;
        };

        diagnostics = {
          enable = true;
          config = {
            virtual_lines = true;
            virtual_text = false;
          };
        };

        autocomplete = {
          blink-cmp = {
            enable = true;

            mappings = {
              close = "esc";
              confirm = "<C-y>";
              next = "<C-n>";
              previous = "<C-p>";
            };

            friendly-snippets = {
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
          name = "gruvbox";
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
            format = {
              enable = true;
            };
            lsp = {
              enable = true;
              servers = ["nixd"];
            };
          };
          ts = {
            enable = true;
            treesitter = {
              enable = true;
            };
          };
          markdown = {
            enable = true;
            extensions = {
              markview-nvim = {
                enable = false;
              };
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
          css = {
            enable = true;
          };
          html = {
            enable = true;
          };
          tailwind = {
            enable = true;
          };
          rust = {
            enable = true;
            format = {
              enable = true;
            };
          };
          python = {
            enable = true;
            format = {
              enable = true;
              type = ["ruff"];
            };
            lsp = {
              enable = true;
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

          images = {
            image-nvim = {
              enable = true;

              setupOpts = {
                backend = "kitty";
              };
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

        statusline.lualine.enable = true;
        telescope.enable = true;
      };
    };
  };
}
