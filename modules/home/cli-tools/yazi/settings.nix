{...}: {
  programs.yazi.settings = {
    mgr = {
      ratio = [2 3 4];
      sort_by = "natural";
      sort_sensitive = true;
      sort_reverse = false;
      sort_dir_first = true;
      linemode = "size";
      show_hidden = false;
      show_symlink = true;
      scrolloff = 5;
    };

    preview = {
      wrap = "yes";
      tab_size = 2;
      max_width = 3000;
      max_height = 3000;
      image_filter = "triangle";
      image_quality = 90;
      sixel_fraction = 15;
      ueberzug_scale = 0.83;
      ueberzug_offset = [300 600 10 10];
    };

    input = {
      cursor_blink = true;
    };

    opener = {
      edit = [
        {
          run = ''nvim "%s"'';
          block = true;
          for = "unix";
          desc = "Neovim";
        }
        {
          run = ''zeditor "%s"'';
          block = true;
          for = "unix";
          desc = "Zed";
        }
        {
          run = ''code"%s"'';
          block = true;
          for = "unix";
          desc = "VSCODE";
        }
      ];
      open = [
        {
          run = ''xdg-open "$@"'';
          desc = "Open";
          for = "linux";
        }
        {
          run = ''open "%s"'';
          desc = "Open";
          for = "macos";
        }
        {
          run = ''start "%1"'';
          orphan = true;
          desc = "Open";
          for = "windows";
        }
      ];
      image = [
        {
          run = "imv-dir %s";
          orphan = true;
          desc = "IMV-DIR";
          for = "linux";
        }
        {
          run = ''aseprite "%s"'';
          orphan = true;
          desc = "Aseprite";
          for = "linux";
        }
        {
          run = ''gimp "%s"'';
          orphan = true;
          desc = "Gimp";
          for = "linux";
        }
        {
          run = ''sh ~/.config/yazi/scripts/wallpaper.sh "$@" && hyprctl reload'';
          orphan = false;
          block = false;
          desc = "Wallpaper";
          for = "linux";
        }
      ];
      pdf = [
        {
          run = "sioyek %s";
          orphan = true;
          desc = "Sioyek";
          for = "linux";
        }
        {
          run = "zen-beta %s";
          orphan = true;
          desc = "Zen";
          for = "linux";
        }
        {
          run = "firefox %s";
          orphan = true;
          desc = "Firefox";
          for = "linux";
        }
      ];
      epub = [
        {
          run = "bookokrat %s";
          block = true;
          desc = "Bookokrat";
          for = "linux";
        }
      ];
      reveal = [
        {
          run = ''open -R "$1"'';
          desc = "Reveal";
          for = "macos";
        }
        {
          run = ''explorer /select,%1'';
          orphan = true;
          desc = "Reveal";
          for = "windows";
        }
        {
          run = ''exiftool "$1"; echo "Press enter to exit"; read'';
          block = true;
          desc = "Show EXIF";
          for = "unix";
        }
      ];
      extract = [
        {
          run = ''unar "$1"'';
          desc = "Extract here";
          for = "unix";
        }
        {
          run = ''unar "%1"'';
          desc = "Extract here";
          for = "windows";
        }
        {
          run = "ouch d -y $@";
          desc = "Extract here with ouch";
          for = "windows";
        }
        {
          run = ''ouch d -y "$@"'';
          desc = "Extract here with ouch";
          for = "unix";
        }
      ];
      play = [
        {
          run = "mpv %s";
          orphan = true;
          for = "unix";
        }
        {
          run = ''vlc "%s"'';
          orphan = true;
          desc = "VLC";
          for = "unix";
        }
        {
          run = ''vlc "%1"'';
          orphan = true;
          desc = "VLC";
          for = "windows";
        }
        {
          run = ''mpv "%1"'';
          block = true;
          desc = "MPV Player";
          for = "windows";
        }
        {
          run = ''mpv "%1"'';
          orphan = true;
          for = "windows";
        }
        {
          run = ''mediainfo "$1"; echo "Press enter to exit"; read'';
          block = true;
          desc = "Show media info";
          for = "unix";
        }
      ];
      document = [
        {
          run = "libreoffice %s";
          orphan = true;
          desc = "Libreoffice";
          for = "linux";
        }
      ];
      game = [
        {
          run = ''mgba "%s"'';
          orphan = true;
          desc = "MGBA";
          for = "unix";
        }
      ];
      nds = [
        {
          run = ''melonDS "%s"'';
          orphan = true;
          desc = "melonDs";
          for = "unix";
        }
      ];
    };

    open = {
      rules = [
        {
          url = "*/";
          use = ["edit" "open" "reveal"];
        }

        {
          mime = "text/*";
          use = ["edit" "reveal"];
        }
        {
          mime = "image/*";
          use = ["image" "open" "reveal"];
        }
        {
          mime = "video/*";
          use = ["play" "reveal"];
        }
        {
          mime = "audio/*";
          use = ["play" "reveal"];
        }
        {
          mime = "inode/empty";
          use = ["edit" "reveal"];
        }
        {
          mime = "application/json";
          use = ["edit" "reveal"];
        }
        {
          mime = "*/javascript";
          use = ["edit" "reveal"];
        }

        {
          mime = "application/zip";
          use = ["extract" "reveal"];
        }
        {
          mime = "application/gzip";
          use = ["extract" "reveal"];
        }
        {
          mime = "application/x-tar";
          use = ["extract" "reveal"];
        }
        {
          mime = "application/x-bzip";
          use = ["extract" "reveal"];
        }
        {
          mime = "application/x-bzip2";
          use = ["extract" "reveal"];
        }
        {
          mime = "application/x-7z-compressed";
          use = ["extract" "reveal"];
        }
        {
          mime = "application/x-rar";
          use = ["extract" "reveal"];
        }
        {
          mime = "application/xz";
          use = ["extract" "reveal"];
        }

        {
          url = "*.{gba,gb,gbc}";
          use = ["game"];
        }
        {
          url = "*.pdf";
          use = ["pdf" "document"];
        }
        {
          url = "*.epub";
          use = ["epub"];
        }
        {
          url = "*.{docx,doc,odt,rtf,pdf,txt,md,tex,wps,wpd,fodt,xlsx,xls,ods,csv,pptx,ppt,odp,odg}";
          use = ["document"];
        }
        {
          url = "*.nds";
          use = ["nds"];
        }
      ];
    };

    tasks = {
      micro_workers = 5;
      macro_workers = 10;
      bizarre_retry = 5;
      image_alloc = 536870912;
      image_bound = [0 0];
      suppress_preload = false;
    };

    plugin = {
      prepend_previewers = [
        {
          mime = "application/*zip";
          run = "ouch";
        }
        {
          mime = "application/x-tar";
          run = "ouch";
        }
        {
          mime = "application/x-bzip2";
          run = "ouch";
        }
        {
          mime = "application/x-7z-compressed";
          run = "ouch";
        }
        {
          mime = "application/x-rar";
          run = "ouch";
        }
        {
          mime = "application/vnd.rar";
          run = "ouch";
        }
        {
          mime = "application/x-xz";
          run = "ouch";
        }
        {
          mime = "application/xz";
          run = "ouch";
        }
        {
          mime = "application/x-zstd";
          run = "ouch";
        }
        {
          mime = "application/zstd";
          run = "ouch";
        }
        {
          mime = "application/java-archive";
          run = "ouch";
        }
      ];
    };
  };
}
