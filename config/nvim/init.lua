vim.pack.add({

	{
		-- MiniFiles
		src = "https://github.com/nvim-mini/mini.files",
		version = "main",
	},
	{
		-- MiniHipatterns
		src = "https://github.com/nvim-mini/mini.hipatterns",
		version = "main",
	},

	{
		-- Smart-Splits
		src = "https://github.com/mrjones2014/smart-splits.nvim",
		version = "master",
	},

	{
		-- Incline
		src = "https://github.com/b0o/incline.nvim",
		version = "main",
	},

	{
		-- Lualine
		src = "https://github.com/nvim-lualine/lualine.nvim",
		version = "master",
	},

	{
		-- which-key
		src = "https://github.com/folke/which-key.nvim",
		version = "main",
	},

	{
		-- Noice
		src = "https://github.com/folke/noice.nvim",
		version = "main",
	},

	{
		-- nvim-web-devicons
		src = "https://github.com/nvim-tree/nvim-web-devicons",
		version = "master",
	},

	{
		-- Snacks
		src = "https://github.com/folke/snacks.nvim",
		version = "main",
	},

	{
		-- BlinckCMP
		src = "https://github.com/saghen/blink.cmp",
		version = "main",
	},

	{
		-- SchemaStore
		src = "https://github.com/b0o/SchemaStore.nvim",
		version = "main",
	},

	{
		-- Conform
		src = "https://github.com/stevearc/conform.nvim",
		version = "master",
	},

	{
		-- Treesitter
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		version = "main",
	},

	{
		src = "https://github.com/neovim/nvim-lspconfig",
		version = "master",
	},

	{
		src = "https://github.com/folke/ts-comments.nvim",
		version = "main",
	},

	-- dependencias
	"https://github.com/MunifTanjim/nui.nvim",
	"https://github.com/rafamadriz/friendly-snippets",
	"https://github.com/xzbdmw/colorful-menu.nvim",
	"https://github.com/onsails/lspkind.nvim",
})

require("config.options")
require("config.keymaps")

require("plugins.nav")
require("plugins.editor")
require("plugins.ui")
require("plugins.lsp")
require("plugins.treesitter")

vim.opt.runtimepath:append(vim.fn.stdpath("config") .. "/lua/config/assets/pywal")
vim.cmd.colorscheme("pywal")
