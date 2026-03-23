-- Plugin: folke/which-key.nvim
-- URL: https://github.com/folke/which-key.nvim
-- description: plugin to show a popup with available keybindings.
require("which-key").setup({
	preset = "modern",
	win = { border = "single" },
})

-- Plugin: folke/noice.nvim
-- URL: https://github.com/folke/noice.nvim
-- description: Highly experimental plugin that completely replaces the UI for messages, cmdline and the popupmenu.
require("noice").setup({
	cmdline = {
		view = "cmdline",
	},
})

-- Plugin: nvim-tree/nvim-web-devicons
-- URL: https://github.com/nvim-tree/nvim-web-devicons
-- description: Provides Nerd Font icons (glyphs) for use by neovim plugins
require("nvim-web-devicons").setup({
	color_icons = false,
	default = true,
	strict = true,
})

-- Plugin: b0o/incline.nvim
-- URL: https://github.com/b0o/incline.nvim
-- description: Floating statuslines for Neovim
require("incline").setup({
	window = { margin = { vertical = 0, horizontal = 1 } }, -- Set the window margin
	hide = {
		cursorline = true, -- Hide the incline window when the cursorline is active
	},
	render = function(props)
		local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t") -- Get the filename
		if vim.bo[props.buf].modified then
			filename = "[+] " .. filename -- Indicate if the file is modified
		end

		local icon, color = require("nvim-web-devicons").get_icon_color(filename) -- Get the icon and color for the file
		return { { icon, guifg = color }, { " " }, { filename } } -- Return the rendered content
	end,
})

local function show_macro_recording()
	local recording_register = vim.fn.reg_recording()
	if recording_register == "" then
		return ""
	else
		return "󰑊 Recording @" .. recording_register
	end
end

-- Plugin: nvim-lualine/lualine.nvim
-- URL: https://github.com/nvim-lualine/lualine.nvim
-- description: A blazing fast and easy to configure neovim statusline plugin written in pure lua.
require("lualine").setup({
	options = {
		theme = "pywal", -- Set the theme for lualine
		icons_enabled = true, -- Enable icons in the statusline
	},
	sections = {
		lualine_a = {
			{
				"mode", -- Display the current mode
				icon = "", -- Set the icon for the mode
			},
			{
				show_macro_recording,
				color = { gui = "bold" },
			},
		},
		lualine_z = {
			{
				function()
					return "󱎫 " .. os.date("%-H:%02M")
				end,
			},
		},
	},
	extensions = {
		"quickfix",
		{
			filetypes = { "oil" },
			sections = {
				lualine_a = {
					{
						"mode",
						icon = " ", -- Set the icon for the mode
					},
				},
				lualine_b = {
					function()
						local ok, oil = pcall(require, "oil")
						if not ok then
							return ""
						end

						---@diagnostic disable-next-line: param-type-mismatch
						local path = vim.fn.fnamemodify(oil.get_current_dir(), ":~")
						return path .. " %m"
					end,
				},
			},
		},
	},
})

-- Plugin: folke/snacks.nvim
-- URL: https://github.com/folke/snacks.nvim
-- description: A collection of QoL plugins for Neovim
require("snacks").setup({
	notifier = { enabled = true },
	picker = { enabled = true },
	quickfile = { enabled = true },
	indent = { enabled = true },
	bigfile = { enabled = true },
	explorer = { enabled = true },
	input = { enabled = true },
	scope = { enabled = true },
	scroll = { enabled = true },
	statuscolumn = { enabled = true },
	words = { enabled = true },
	image = {
		enabled = true,
		doc = {
			enabled = true,
			inline = true,
			float = false,
		},
		icon = {
			image = "󰥶 ",
		},
	},
	dashboard = {
		enabled = false,

		formats = {
			footer = { "%s", align = "center" },
		},
		hide = {
			statusline = false,
		},
		sections = {
			{ section = "header" },
			{ section = "keys" },
		},
		preset = {
			header = [[
	        ████ ██████           █████      ██                     
	       ███████████             █████                             
	       █████████ ███████████████████ ███   ███████████   
	      █████████  ███    █████████████ █████ ██████████████   
	     █████████ ██████████ █████████ █████ █████ ████ █████   
	   ███████████ ███    ███ █████████ █████ █████ ████ █████  
	  ██████  █████████████████████ ████ █████ █████ ████ ██████ 
	 ]],
		},

		---@type snacks.dashboard.Item[]
		keys = {
			{ icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
			-- { icon = " ", key = "o", desc = "Obsidian", action = ":Oil ~/Documents/Notas/" },
			{ icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
			{ icon = " ", key = "p", desc = "Projects", action = ":lua Snacks.dashboard.pick('projects')" },
			{ icon = " ", key = "t", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
			{
				icon = " ",
				key = "c",
				desc = "Config",
				action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
			},
			{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
		},
	},
})
