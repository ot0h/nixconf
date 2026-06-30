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
	lsp = {
		hover = {
			opts = { border = "single" },
		},
	},
	cmdline = {
		view = "cmdline",
	},
	presets = {
		bottom_search = true,
		command_palette = true,
		long_message_to_split = true,
	},
	-- Mostrar comandos pendientes (showcmd) en la cmdline
	showcmd = {
		enabled = true,
		format = {
			cmdline = " %s",
		},
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
	window = { margin = { vertical = 0, horizontal = 0 } }, -- Set the window margin
	hide = {
		cursorline = "smart", -- Hide the incline window when the cursorline is active
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

-- Macro recording: parpadea alternando colores de fondo
local macro_blink_on = true
vim.fn.timer_start(500, function()
	macro_blink_on = not macro_blink_on
end, { ["repeat"] = -1 })

local function show_macro_recording()
	local recording_register = vim.fn.reg_recording()
	if recording_register == "" then
		return ""
	end
	return "󰨜 Recording @" .. recording_register
end

local function macro_blink_color()
	local recording = vim.fn.reg_recording()
	if recording == "" then
		return {}
	end
	local wal = require("pywal.core").get_colors()
	return macro_blink_on and { fg = wal.background, gui = "bold" } or { fg = wal.color11, gui = "bold" }
end

-- Plugin: nvim-lualine/lualine.nvim
-- URL: https://github.com/nvim-lualine/lualine.nvim
-- description: A blazing fast and easy to configure neovim statusline plugin written in pure lua.
require("lualine").setup({
	options = {
		theme = "pywal",
		icons_enabled = true,
		globalstatus = true,
		refresh = { statusline = 50 },
	},
	sections = {
		lualine_a = {
			{ "mode", icon = "" },
			{ show_macro_recording, color = macro_blink_color },
		},
		lualine_b = {
			-- Branch de git
			{
				"branch",
				icon = "",
			},
			-- Diagnósticos del LSP
			{
				"diagnostics",
				sources = { "nvim_diagnostic" },
				symbols = { error = " ", warn = " ", info = " ", hint = " " },
			},
		},
		lualine_c = {
			{
				"filename",
				file_status = true,
				path = 1,
			},
		},
		lualine_x = {
			-- Noice: mensajes pendientes (showcmd, comandos, búsqueda)
			{
				require("noice").api.status.search.get,
				cond = require("noice").api.status.search.has,
				color = function()
					local wal = require("pywal.core").get_colors()
					return { fg = wal.color3 }
				end,
			},
			{
				require("noice").api.status.command.get,
				cond = require("noice").api.status.command.has,
				color = function()
					local wal = require("pywal.core").get_colors()
					return { fg = wal.color3 }
				end,
			},
			{
				function()
					if not vim.g.copilot_active then
						return ""
					end
					local ok, copilot = pcall(require, "copilot.api")
					if not ok then
						return ""
					end
					local status = copilot.status.data
					local icons = { Normal = " ", InProgress = "󰔟 ", Warning = " " }
					return icons[status.status] or ""
				end,
				color = function()
					if not vim.g.copilot_active then
						return {}
					end
					local ok, copilot = pcall(require, "copilot.api")
					if not ok then
						return {}
					end
					local status = copilot.status.data
					local wal = require("pywal.core").get_colors()
					local colors = {
						Normal = { fg = wal.color2 },
						InProgress = { fg = wal.color3 },
						Warning = { fg = wal.color1 },
					}
					return colors[status.status] or {}
				end,
			},
		},
		lualine_y = {
			{ "filetype" },
			{ "encoding" },
		},
		lualine_z = {
			{ "location" },
			{ "progress" },
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
	explorer = {
		enabled = true,

		---@class snacks.explorer.Config
		{
			replace_netrw = false, -- Replace netrw with the snacks explorer
			trash = true, -- Use the system trash when deleting files
		},
	},
	picker = {
		enabled = true,
		sources = {
			explorer = {
				title = "",
				auto_close = true,
				layout = {
					-- auto_hide = { "input" },
					layout = {
						position = "right",
					},
				},
			},
			grep = {
				layout = "ivy_split",
				regex = true,
			},
			buffers = {
				finder = "buffers",
				format = "buffer",
				current = true,
				sort_lastused = true,
				layout = "ivy",
			},
			git_branches = {
				layout = "select",
			},
		},
	},
	quickfile = { enabled = true },
	lazygit = { enabled = true },
	indent = { enabled = true },
	bigfile = { enabled = true },
	input = { enabled = true },
	scope = { enabled = true },
	scroll = { enabled = true },
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
