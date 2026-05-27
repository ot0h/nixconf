require("obsidian").setup({
	legacy_commands = false,
	workspaces = {
		{
			name = "personal",
			path = "~/Documents/Notas",
		},
	},
})

require("markview").setup({
	---@type markview.config
	html = { enable = false },
	---@type markview.config
	typst = { enable = false },
})
