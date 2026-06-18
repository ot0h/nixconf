{
  pkgs,
  lib,
  ...
}: {
  programs.zed-editor = {
    enable = true;
    extensions = [
      "nix"
      "toml"
      "elixir"
      "make"
      "python"
      "go"
      "html"
      "css"
      "angular"
      "csharp"
      "typst"
    ];

    extraPackages = with pkgs;
      [
        # Git / build tools
        git
        gcc
        gnumake
        unzip
        wget
        curl
        # Search / nav
        ripgrep
        fd
        fzf
        tree-sitter
        # LazyGit
        lazygit
        # TypeScript / JS
        nodejs_latest
        vtsls
        prettier
        yarn
        pnpm
        angular-language-server
        # Nix
        nixd
        alejandra
        # Rust
        rust-analyzer
        rustfmt
        taplo
        clippy
        # Python
        basedpyright
        ruff
        # Go
        go
        gopls
        gotools
        # C / C++
        clang-tools
        gdb
        # Typst
        tinymist
        typstyle
        # Elixir
        elixir-ls
        # C# / .NET
        roslyn-ls
        dotnet-sdk_8
        # HTML / CSS / Emmet
        emmet-language-server
        vscode-langservers-extracted
        # Bash
        bash-language-server
        shfmt
        # Lua (por si acaso)
        lua-language-server
        stylua
        # Clipboard (Linux only)
      ]
      ++ lib.optionals (!pkgs.stdenv.isDarwin) (with pkgs; [
        wl-clipboard
        xsel
        xclip
      ]);

    userSettings = {
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
        font_family = "Pixel Code";
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

      lsp = {
        rust-analyzer.binary.path_lookup = true;
        nixd.binary.path_lookup = true;
        elixir-ls = {
          binary.path_lookup = true;
          settings.dialyzerEnabled = true;
        };
        typescript-language-server.binary.path_lookup = true;
        basedpyright.binary.path_lookup = true;
        ruff.binary.path_lookup = true;
        gopls.binary.path_lookup = true;
        clangd.binary.path_lookup = true;
        roslyn.binary.path_lookup = true;
        bash-language-server.binary.path_lookup = true;
        vscode-css-language-server.binary.path_lookup = true;
        vscode-html-language-server.binary.path_lookup = true;
        tinymist.binary.path_lookup = true;
        emmet-language-server.binary.path_lookup = true;
      };

      languages = {
        "Elixir" = {
          language_servers = ["!lexical" "elixir-ls" "!next-ls"];
          format_on_save.external = {
            command = "mix";
            arguments = ["format" "--stdin-filename" "{buffer_path}" "-"];
          };
        };
        "HEEX" = {
          language_servers = ["!lexical" "elixir-ls" "!next-ls"];
          format_on_save.external = {
            command = "mix";
            arguments = ["format" "--stdin-filename" "{buffer_path}" "-"];
          };
        };
        "Python" = {
          language_servers = ["basedpyright" "ruff"];
          format_on_save.external = {
            command = "ruff";
            arguments = ["format" "--stdin-filename" "{buffer_path}" "-"];
          };
        };
        "Go".format_on_save.external = {
          command = "gofmt";
          arguments = ["-w" "{buffer_path}"];
        };
        "TypeScript".format_on_save.external = {
          command = "prettier";
          arguments = ["--stdin-filepath" "{buffer_path}"];
        };
        "JavaScript".format_on_save.external = {
          command = "prettier";
          arguments = ["--stdin-filepath" "{buffer_path}"];
        };
        "CSS".format_on_save.external = {
          command = "prettier";
          arguments = ["--stdin-filepath" "{buffer_path}"];
        };
        "HTML".format_on_save.external = {
          command = "prettier";
          arguments = ["--stdin-filepath" "{buffer_path}"];
        };
        "Nix".format_on_save.external = {
          command = "alejandra";
          arguments = ["-"];
        };
        "C#".language_servers = ["roslyn-ls"];
        "Rust".format_on_save.external = {
          command = "rustfmt";
          arguments = ["--edition" "2021"];
        };
      };

      vim_mode = true;
      load_direnv = "shell_hook";
      base_keymap = "VSCode";
      theme = {
        mode = "system";
        light = "Gruvbox Dark Hard";
        dark = "Gruvbox Dark Hard";
      };
      show_whitespaces = "all";
      ui_font_size = 14;
      buffer_font_size = 14;
    };
  };
}
