local hipatterns = require("mini.hipatterns")
hipatterns.setup({
	highlighters = {
		-- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
		fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
		hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
		todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
		note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

		-- Highlight hex color strings (`#rrggbb`) using that color
		hex_color = hipatterns.gen_highlighter.hex_color(),
	},
})

require("mini.surround").setup( -- No need to copy this inside `setup()`. Will be used automatically.
	{
		-- Add custom surroundings to be used on top of builtin ones. For more
		-- information with examples, see `:h MiniSurround.config`.
		custom_surroundings = nil,

		-- Duration (in ms) of highlight when calling `MiniSurround.highlight()`
		highlight_duration = 500,

		-- Module mappings. Use `''` (empty string) to disable one.
		mappings = {
			add = "gsa", -- Add surrounding in Normal and Visual modes
			delete = "gsd", -- Delete surrounding
			find = "gsf", -- Find surrounding (to the right)
			find_left = "gsF", -- Find surrounding (to the left)
			highlight = "gsh", -- Highlight surrounding
			replace = "gsr", -- Replace surrounding

			suffix_last = "l", -- Suffix to search with "prev" method
			suffix_next = "n", -- Suffix to search with "next" method
		},

		-- Number of lines within which surrounding is searched
		n_lines = 20,

		-- Whether to respect selection type:
		-- - Place surroundings on separate lines in linewise mode.
		-- - Place surroundings on each line in blockwise mode.
		respect_selection_type = false,

		-- How to search for surrounding (first inside current line, then inside
		-- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
		-- 'cover_or_nearest', 'next', 'prev', 'nearest'. For more details,
		-- see `:h MiniSurround.config`.
		search_method = "cover",

		-- Whether to disable showing non-error feedback
		-- This also affects (purely informational) helper messages shown after
		-- idle time if user input is required.
		silent = false,
	}
)

require("mini.pairs").setup( -- No need to copy this inside `setup()`. Will be used automatically.
	{
		-- In which modes mappings from this `config` should be created
		modes = { insert = true, command = false, terminal = false },

		-- Global mappings. Each right hand side should be a pair information, a
		-- table with at least these fields (see more in |MiniPairs.map|):
		-- - <action> - one of 'open', 'close', 'closeopen'.
		-- - <pair> - two character string for pair to be used.
		-- By default pair is not inserted after `\`, quotes are not recognized by
		-- <CR>, `'` does not insert the pair after a letter.
		-- Only parts of tables can be tweaked (others will use these defaults).
		mappings = {
			["("] = { action = "open", pair = "()", neigh_pattern = "^[^\\]" },
			["["] = { action = "open", pair = "[]", neigh_pattern = "^[^\\]" },
			["{"] = { action = "open", pair = "{}", neigh_pattern = "^[^\\]" },

			[")"] = { action = "close", pair = "()", neigh_pattern = "^[^\\]" },
			["]"] = { action = "close", pair = "[]", neigh_pattern = "^[^\\]" },
			["}"] = { action = "close", pair = "{}", neigh_pattern = "^[^\\]" },

			['"'] = { action = "closeopen", pair = '""', neigh_pattern = "^[^\\]", register = { cr = false } },
			["'"] = { action = "closeopen", pair = "''", neigh_pattern = "^[^%a\\]", register = { cr = false } },
			["`"] = { action = "closeopen", pair = "``", neigh_pattern = "^[^\\]", register = { cr = false } },
		},
	}
)

require("fastaction").setup({
	dismiss_keys = { "j", "k", "<c-c>", "q" },
	override_function = function(_) end,
	keys = "qwertyuiopasdfghlzxcvbnm",
	popup = {
		border = "rounded",
		hide_cursor = true,
		highlight = {
			action = "MoreMsg",
			divider = "FloatBorder",
			key = "MoreMsg",
			source = "Comment",
			title = "Title",
			window = "NormalFloat",
		},
		title = "Select one of:",
	},
	priority = {
		-- dart = {
		--   { pattern = "organize import", key ="o", order = 1 },
		--   { pattern = "extract method", key ="x", order = 2 },
		--   { pattern = "extract widget", key ="e", order = 3 },
		-- },
	},
	register_ui_select = false,
	format_right_section = nil,
})

require("nvim-ts-autotag").setup({
	opts = {
		enable_close = true,
		enable_rename = true,
		enable_close_on_slash = true,
	},
	per_filetype = {
		["html"] = {
			enable_close = true,
		},
	},
})
