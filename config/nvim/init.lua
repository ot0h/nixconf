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
	{ src = "https://github.com/saghen/blink.lib", version = "main" },
	{ src = "https://github.com/b0o/SchemaStore.nvim", version = "main" },
	{ src = "https://github.com/stevearc/conform.nvim", version = "master" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
	{ src = "https://github.com/folke/ts-comments.nvim", version = "main" },
	{ src = "https://github.com/folke/flash.nvim", version = "main" },
	{ src = "https://github.com/Chaitanyabsprip/fastaction.nvim", version = "main" },
	{ src = "https://github.com/chomosuke/typst-preview.nvim", version = "master" },
	{ src = "https://github.com/windwp/nvim-ts-autotag", version = "main" },
	{ src = "https://github.com/obsidian-nvim/obsidian.nvim", version = vim.version.range("*") },
	{ src = "https://github.com/OXY2DEV/markview.nvim", version = "main" },
	{ src = "https://github.com/folke/sidekick.nvim", version = "main" },
	{ src = "https://github.com/zbirenbaum/copilot.lua", version = "master" },
	-- { src = "https://github.com/seblyng/roslyn.nvim", version = "main" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim", version = "main" },
	{ src = "https://github.com/nvzone/minty", version = "main" },
	{ src = "https://github.com/nvzone/volt", version = "main" },
	{ src = "https://github.com/stevearc/oil.nvim", version = "master" },
	{ src = "https://github.com/ThePrimeagen/refactoring.nvim", version = "master" },
	{ src = "https://github.com/lewis6991/async.nvim", version = "main" },
	{ src = "https://github.com/nvim-mini/mini.splitjoin", version = "stable" },

	-- Dependencias
	{ src = "https://github.com/MunifTanjim/nui.nvim" },
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
	{ src = "https://github.com/xzbdmw/colorful-menu.nvim" },
	{ src = "https://github.com/onsails/lspkind.nvim" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
})

require("config.options")
require("config.autocmds")
require("config.stylix").setup()

require("plugins.nav")

require("config.keymaps")

vim.api.nvim_create_autocmd("VimEnter", {
	once = true,
	callback = function()
		require("plugins.editor")
		require("plugins.ui")
		require("plugins.lsp")
		require("plugins.treesitter")
		require("plugins.ai")
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "markdown", "typst", "typ" },
	once = true,
	callback = function()
		require("plugins.markdown")
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "typst", "typ" },
	once = true,
	callback = function()
		require("plugins.typst")
	end,
})
