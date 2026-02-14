{ inputs, pkgs, ... }: {
  # Importamos el módulo desde los inputs del flake
  imports = [ inputs.nvf.homeManagerModules.default ];

  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        viAlias = true;
        vimAlias = true;
        
        # Estética de miedo
        theme = {
          enable = true;
          name = "base16";
		transparent = true;
        };

        # Pa' que programés tranquilo
        languages = {
          enableLSP = true;
          enableTreesitter = true;
          nix.enable = true;
          ts.enable = true;
          typst.enable = true;
        };

	utility ={
		oil-nvim ={
			enable = true;
		};
	};

        # Herramientas útiles
        telescope.enable = true;
        autocomplete.nvim-cmp.enable = true;
        statusline.lualine.enable = true;
      };
    };
  };
}
