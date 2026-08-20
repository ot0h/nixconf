{...}: {
  programs.yazi.keymap = {
    mgr = {
      prepend_keymap = [
        # ── Custom Keymaps ──────────────────────────────────────────
        {
          on = ["A"];
          run = "create --dir";
          desc = "Create a Directory";
        }
        {
          on = ["g" "t"];
          run = "cd ~/.local/share/Trash/files";
          desc = "Go to Trash";
        }

        # ── Plugin: GVFS ────────────────────────────────────────────
        {
          on = ["M" "m"];
          run = "plugin gvfs -- select-then-mount";
          desc = "Select device to mount and jump to its mount point";
        }
        {
          on = ["M" "R"];
          run = "plugin gvfs -- remount-current-cwd-device";
          desc = "Remount device under cwd";
        }
        {
          on = ["M" "u"];
          run = "plugin gvfs -- select-then-unmount";
          desc = "Select device then unmount";
        }
        {
          on = ["M" "U"];
          run = "plugin gvfs -- select-then-unmount --eject --force";
          desc = "Select device then force to eject/unmount";
        }
        {
          on = ["M" "a"];
          run = "plugin gvfs -- add-mount";
          desc = "Add a GVFS mount URI";
        }
        {
          on = ["M" "e"];
          run = "plugin gvfs -- edit-mount";
          desc = "Edit a GVFS mount URI";
        }
        {
          on = ["M" "r"];
          run = "plugin gvfs -- remove-mount";
          desc = "Remove a GVFS mount URI";
        }
        {
          on = ["g" "m"];
          run = "plugin gvfs -- jump-to-device";
          desc = "Select device then jump to its mount point";
        }
        {
          on = ["\`" "\`"];
          run = "plugin gvfs -- jump-back-prev-cwd";
          desc = "Jump back to the position before jumped to device";
        }

        # ── Copy to Clipboard ───────────────────────────────────────
        {
          on = ["y"];
          run = [
            ''shell -- for path in %s; do echo "file://$path"; done | wl-copy -t text/uri-list''
            "yank"
          ];
          desc = "Copy";
        }

        # ── Disk Manager (gdu) ──────────────────────────────────────
        {
          on = ["M" "G"];
          run = ''shell --block -- fish -ic "exec gdu -d /"'';
          desc = "Disk Manager for Root";
        }
        {
          on = ["M" "g"];
          run = ''shell --block -- fish -ic "exec gdu -d ~"'';
          desc = "Disk Manager for Home";
        }
        {
          on = ["M" "h"];
          run = ''shell --block -- fish -ic "exec gdu -d /home"'';
          desc = "Disk Manager for Home Directory";
        }
        {
          on = ["M" "D"];
          run = ''shell --block -- fish -ic "exec gdu -d "'';
          desc = "Disk Manager for All mounted";
        }
        {
          on = ["M" "d"];
          run = ''shell --block -- fish -ic "exec gdu"'';
          desc = "Disk Manager";
        }

        # ── LazyGit ─────────────────────────────────────────────────
        {
          on = ["g" "i"];
          run = "plugin lazygit";
          desc = "LazyGit";
        }

        # ── Bookmarks (tipo Vim) ────────────────────────────────────
        {
          on = ["b" "a"];
          run = "plugin bookmarks save";
          desc = "Save current position as a bookmark";
        }
        {
          on = ["'"];
          run = "plugin bookmarks jump";
          desc = "Jump to a bookmark";
        }
        {
          on = ["b" "d"];
          run = "plugin bookmarks delete";
          desc = "Delete a bookmark";
        }
        {
          on = ["b" "D"];
          run = "plugin bookmarks delete_all";
          desc = "Delete all bookmarks";
        }

        # ── Abrir en otro File Manager ──────────────────────────────
        {
          on = ["E"];
          run = ''shell -- thunar "$PWD"'';
          desc = "Open CWD in Thunar";
        }

        # ── Ouch (comprimir) ────────────────────────────────────────
        {
          on = ["C"];
          run = "plugin ouch";
          desc = "Comprimir con ouch";
        }

        # ── Toggle Pane ─────────────────────────────────────────────
        {
          on = ["T"];
          run = "plugin toggle-pane max-preview";
          desc = "Maximize or restore the preview pane";
        }

        # ── Sudo ────────────────────────────────────────────────────
        {
          on = ["<C-t>"];
          run = "plugin sudo-demo";
        }

        # ── Projects ────────────────────────────────────────────────
        {
          on = ["P" "s"];
          run = "plugin projects save";
          desc = "Save current project";
        }
        {
          on = ["P" "l"];
          run = "plugin projects load";
          desc = "Load project";
        }
        {
          on = ["P" "P"];
          run = "plugin projects load_last";
          desc = "Load last project";
        }
        {
          on = ["P" "d"];
          run = "plugin projects delete";
          desc = "Delete project";
        }
        {
          on = ["P" "D"];
          run = "plugin projects delete_all";
          desc = "Delete all projects";
        }
        {
          on = ["P" "m"];
          run = "plugin projects 'merge current'";
          desc = "Merge current tab to other projects";
        }
        {
          on = ["P" "M"];
          run = "plugin projects 'merge all'";
          desc = "Merge current project to other projects";
        }
        {
          on = ["P" "p"];
          run = "plugin projects 'load SomeProject'";
          desc = "Load the 'SomeProject' project";
        }

        # ── Drag & Drop (ripdrag) ───────────────────────────────────
        {
          on = ["<C-n>"];
          run = "shell -- ripdrag %s -x 2>/dev/null &";
          desc = "Drag y Drop via ripdrag";
        }

        # ── Yafg (Fuzzy find & grep) ────────────────────────────────
        {
          on = ["F" "G"];
          run = "plugin yafg";
          desc = "Plugin yafg";
        }

        {
          on = ["!"];
          for = "unix";
          run = ''shell "$SHELL" --block'';
          desc = "Open $SHELL here";
        }
      ];
    };
  };
}
