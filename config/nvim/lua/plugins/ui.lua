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

-- Plugin: lewis6991/gitsigns.nvim
-- URL: https://github.com/lewis6991/gitsigns.nvim
-- description: Git integration for buffers
require("gitsigns").setup()

-- Plugin: b0o/incline.nvim
-- URL: https://github.com/b0o/incline.nvim
-- description: Floating statuslines for Neovim
require("incline").setup({
	window = { margin = { vertical = 0, horizontal = 0 } },
	hide = {
		cursorline = "smart",
	},
	render = function(props)
		local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
		if filename == "" then
			filename = "[No Name]"
		end
		local ft_icon = require("nvim-web-devicons").get_icon_color(filename)

		local function get_git_diff()
			local icons = { removed = " ", changed = " ", added = " " }
			local signs = vim.b[props.buf].gitsigns_status_dict
			local labels = {}
			if signs == nil then
				return labels
			end
			for name, icon in pairs(icons) do
				if tonumber(signs[name]) and signs[name] > 0 then
					table.insert(
						labels,
						{ icon .. signs[name] .. " ", group = "GitSigns" .. name:gsub("^%l", string.upper) }
					)
				end
			end
			if #labels > 0 then
				table.insert(labels, { "┊ " })
			end
			return labels
		end

		local function get_diagnostic_label()
			local icons = { error = " ", warn = " ", info = " ", hint = " " }
			local label = {}
			for severity, icon in pairs(icons) do
				local n = #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity[string.upper(severity)] })
				if n > 0 then
					table.insert(
						label,
						{ icon .. n .. " ", group = "Diagnostic" .. severity:gsub("^%l", string.upper) }
					)
				end
			end
			if #label > 0 then
				table.insert(label, { "┊ " })
			end
			return label
		end

		local c = require("config.stylix.core").get_colors()
		return {
			{ get_diagnostic_label() },
			{ get_git_diff() },
			{ (ft_icon or "") .. " ", guifg = c.foreground, guibg = "none" },
			{ filename .. " ", gui = vim.bo[props.buf].modified and "bold,italic" or "bold" },
		}
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
	local c = require("config.stylix.core").get_colors()
	return macro_blink_on and { fg = c.background, gui = "bold" } or { fg = c.color11, gui = "bold" }
end

-- Plugin: nvim-lualine/lualine.nvim
-- URL: https://github.com/nvim-lualine/lualine.nvim
-- description: A blazing fast and easy to configure neovim statusline plugin written in pure lua.
require("lualine").setup({
	options = {
		theme = "stylix",
		icons_enabled = true,
		globalstatus = true,
		refresh = { statusline = 50 },
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
	},
	sections = {
		lualine_a = {
			{ "mode", icon = "" },
			{ show_macro_recording, color = macro_blink_color },
		},
		lualine_b = {
			{
				"branch",
				icon = "",
			},
			{
				"diff",
				symbols = { added = " ", modified = " ", removed = " " },
				color = function()
					local c = require("config.stylix.core").get_colors()
					return { fg = c.color0 }
				end,
				diff_color = {
					added = function()
						local c = require("config.stylix.core").get_colors()
						return { fg = c.color0 }
					end,
					modified = function()
						local c = require("config.stylix.core").get_colors()
						return { fg = c.color0 }
					end,
					removed = function()
						local c = require("config.stylix.core").get_colors()
						return { fg = c.color0 }
					end,
				},
			},
			{
				"filename",
				file_status = true,
				path = 1,
			},
		},
		lualine_c = {},
		lualine_x = {
			{
				require("noice").api.status.search.get,
				cond = require("noice").api.status.search.has,
				color = function()
					local c = require("config.stylix.core").get_colors()
					return { fg = c.cyan, bg = c.background }
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
					local c = require("config.stylix.core").get_colors()
					local colors = {
						Normal = { fg = c.green },
						InProgress = { fg = c.yellow },
						Warning = { fg = c.red },
					}
					return colors[status.status] or {}
				end,
			},
			{
				"diagnostics",
				sources = { "nvim_diagnostic" },
				symbols = { error = " ", warn = " ", info = " ", hint = " " },
				color = function()
					local c = require("config.stylix.core").get_colors()
					return { fg = c.color7, bg = c.color0 }
				end,
				diagnostics_color = {
					error = function()
						local c = require("config.stylix.core").get_colors()
						return { fg = c.red }
					end,
					warn = function()
						local c = require("config.stylix.core").get_colors()
						return { fg = c.yellow }
					end,
					info = function()
						local c = require("config.stylix.core").get_colors()
						return { fg = c.blue }
					end,
					hint = function()
						local c = require("config.stylix.core").get_colors()
						return { fg = c.cyan }
					end,
				},
			},
		},
		lualine_y = {
			{
				"filetype",
				color = function()
					local c = require("config.stylix.core").get_colors()
					return { fg = c.foreground }
				end,
				icons_enabled = true,
			},
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
						icon = "",
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
			smart = {
				layout = {
					preset = "telescope",
				},
			},
			explorer = {
				title = "",
				auto_close = false,
				layout = {
					-- auto_hide = { "input" },
					preset = "sidebar",
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
