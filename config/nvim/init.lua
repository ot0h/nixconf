vim.pack.add({
	{ src = "https://github.com/nvim-mini/mini.files", version = "main" },
	{ src = "https://github.com/nvim-mini/mini.hipatterns", version = "main" },
	{ src = "https://github.com/nvim-mini/mini.surround", version = "main" },
	{ src = "https://github.com/nvim-mini/mini.pairs", version = "main" },
	{ src = "https://github.com/mrjones2014/smart-splits.nvim", version = "master" },
	{ src = "https://github.com/b0o/incline.nvim", version = "main" },
	{ src = "https://github.com/nvim-lualine/lualine.nvim", version = "master" },
	{ src = "https://github.com/folke/which-key.nvim", version = "main" },
	{ src = "https://github.com/folke/noice.nvim", version = "main" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons", version = "master" },
	{ src = "https://github.com/folke/snacks.nvim", version = "main" },
	{ src = "https://github.com/saghen/blink.cmp", version = "main" },
	{ src = "https://github.com/b0o/SchemaStore.nvim", version = "main" },
	{ src = "https://github.com/stevearc/conform.nvim", version = "master" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
	{ src = "https://github.com/folke/ts-comments.nvim", version = "main" },
	{ src = "https://github.com/folke/flash.nvim", version = "main" },
	{ src = "https://github.com/Chaitanyabsprip/fastaction.nvim", version = "main" },
	{ src = "https://github.com/chomosuke/typst-preview.nvim", version = "master" },
	{ src = "https://github.com/windwp/nvim-ts-autotag", version = "main" },
	{ src = "https://github.com/stevearc/oil.nvim", version = "master" },
	{ src = "https://github.com/obsidian-nvim/obsidian.nvim", version = vim.version.range("*") },
	{ src = "https://github.com/OXY2DEV/markview.nvim", version = "main" },

	-- Dependencias
	{ src = "https://github.com/MunifTanjim/nui.nvim" },
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
	{ src = "https://github.com/xzbdmw/colorful-menu.nvim" },
	{ src = "https://github.com/onsails/lspkind.nvim" },
})

require("config.options")
require("config.keymaps")

require("plugins.nav")
require("plugins.editor")
require("plugins.ui")
require("plugins.lsp")
require("plugins.markdown")
require("plugins.typst")
require("plugins.treesitter")

vim.opt.runtimepath:append(vim.fn.stdpath("config") .. "/lua/config/assets/pywal")
vim.cmd.colorscheme("pywal")
