{ inputs, pkgs, ... }: {
  imports = [ inputs.nvf.homeManagerModules.default ];

  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        viAlias = true;
        vimAlias = true;

        options = {
                shiftwidth = 2;
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
         whicKey = {
           enable = true;
                };
        };

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

        telescope.enable = true;
        autocomplete.nvim-cmp.enable = true;
        statusline.lualine.enable = true;
      };
    };
  };
}
