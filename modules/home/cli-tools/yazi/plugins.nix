{
  config,
  pkgs,
  lib,
  ...
}: let
  # Fork de bookmarks.yazi — el original (dedukun/bookmarks.yazi) quedó obsoleto
  # por un cambio en la API de Yazi. Propio Fork
  bookmarks-yazi = pkgs.yaziPlugins.bookmarks.overrideAttrs (old: {
    src = pkgs.fetchFromGitHub {
      owner = "numbpi";
      repo = "bookmarks.yazi";
      rev = "f0fb5ecd355bf76a4db356a54cc3c7f13be03cc0";
      hash = "sha256-NW4YliNg0z3WkfxWWun8VPxqdojrJ8RS8vPEXTm2ly4=";
    };
    version = "0-unstable-2026-06-04";
  });
in {
  programs.yazi.plugins = {
    # ── Plugins con setup (generan init.lua automáticamente) ──────

    gvfs = {
      package = pkgs.yaziPlugins.gvfs;
      setup = true;
      settings = {
        which_keys = "1234567890qwertyuiopasdfghjklzxcvbnm-=[]\\;',./!@#$%^&*()_+{}|:\"<>?";
        input_position = lib.generators.mkLuaInline ''{"center", y=0, w=60}'';
        password_vault = "keyring";
        save_password_autoconfirm = true;
        key_grip = "BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB";
      };
    };

    bookmarks = {
      package = bookmarks-yazi;
      setup = true;
      settings = {
        last_directory = {
          enable = false;
          persist = false;
          mode = "dir";
        };
        persist = "all";
        desc_format = "full";
        file_pick_mode = "hover";
        custom_desc_input = false;
        show_keys = true;
        notify = {
          enable = true;
          timeout = 1;
          message = {
            new = "New bookmark '<key>' -> '<folder>'";
            delete = "Deleted bookmark in '<key>'";
            delete_all = "Deleted all bookmarks";
          };
        };
      };
    };

    projects = {
      package = pkgs.yaziPlugins.projects;
      setup = true;
      settings = {
        event = {
          save = {
            enable = true;
            name = "project-saved";
          };
          load = {
            enable = true;
            name = "project-loaded";
          };
          delete = {
            enable = true;
            name = "project-deleted";
          };
          delete_all = {
            enable = true;
            name = "project-deleted-all";
          };
          merge = {
            enable = true;
            name = "project-merged";
          };
        };
        save = {
          method = "yazi";
          yazi_load_event = "@projects-load";
          lua_save_path = "";
        };
        last = {
          update_after_save = true;
          update_after_load = true;
          update_before_quit = false;
          load_after_start = false;
        };
        merge = {
          event = "projects-merge";
          quit_after_merge = false;
        };
        notify = {
          enable = true;
          title = "Projects";
          timeout = 3;
          level = "info";
        };
      };
    };

    yafg = {
      package = pkgs.yaziPlugins.yafg;
      setup = true;
      settings = {
        toggle_mode_key = "f1";
        editor = "nvim";
        args = ["--noplugin"];
        file_arg_format = "+{row} {file}";
      };
    };

    starship = {
      package = pkgs.yaziPlugins.starship;
      setup = true;
      settings = {
        hide_flags = false;
        flags_after_prompt = true;
        show_right_prompt = false;
        hide_count = false;
        count_separator = " ";
      };
    };

    # ── Plugins sin setup (solo se linkean) ──────────────────────

    lazygit = pkgs.yaziPlugins.lazygit;
    ouch = pkgs.yaziPlugins.ouch;
    toggle-pane = pkgs.yaziPlugins.toggle-pane;
    sudo = pkgs.yaziPlugins.sudo;
  };
}
