require("mini.files").setup({
	-- Customization of shown content
	content = {
		-- Predicate for which file system entries to show
		filter = nil,
		-- Highlight group to use for a file system entry
		highlight = nil,
		-- Prefix text and highlight to show to the left of file system entry
		prefix = nil,
		-- Order in which to show file system entries
		sort = nil,
	},

	-- Module mappings created only inside explorer.
	-- Use `''` (empty string) to not create one.
	mappings = {
		close = "q",
		go_in = "l",
		go_in_plus = "L",
		go_out = "h",
		go_out_plus = "H",
		mark_goto = "'",
		mark_set = "m",
		reset = "<BS>",
		reveal_cwd = "@",
		show_help = "g?",
		synchronize = "=",
		trim_left = "<",
		trim_right = ">",
	},

	-- General options
	options = {
		-- Whether to delete permanently or move into module-specific trash
		permanent_delete = true,
		-- Whether to use for editing directories
		use_as_default_explorer = false,
	},

	-- Customization of explorer windows
	windows = {
		-- Maximum number of windows to show side by side
		max_number = math.huge,
		-- Whether to show preview of file/directory under cursor
		preview = false,
		-- Width of focused window
		width_focus = 50,
		-- Width of non-focused window
		width_nofocus = 15,
		-- Width of preview window
		width_preview = 25,
	},
})

require("smart-splits").setup({
	-- Ignored buffer types (only while resizing)
	ignored_buftypes = {
		"nofile",
		"quickfix",
		"prompt",
	},
	-- Ignored filetypes (only while resizing)
	ignored_filetypes = { "NvimTree" },
	-- the default number of lines/columns to resize by at a time
	default_amount = 3,
	-- Desired behavior when your cursor is at an edge and you
	-- are moving towards that same edge:
	-- 'wrap' => Wrap to opposite side
	-- 'split' => Create a new split in the desired direction
	-- 'stop' => Do nothing
	-- function => You handle the behavior yourself
	-- NOTE: If using a function, the function will be called with
	-- a context object with the following fields:
	-- {
	--    mux = {
	--      type:'tmux'|'wezterm'|'kitty'|'zellij'
	--      current_pane_id():number,
	--      is_in_session(): boolean
	--      current_pane_is_zoomed():boolean,
	--      -- following methods return a boolean to indicate success or failure
	--      current_pane_at_edge(direction:'left'|'right'|'up'|'down'):boolean
	--      next_pane(direction:'left'|'right'|'up'|'down'):boolean
	--      resize_pane(direction:'left'|'right'|'up'|'down'):boolean
	--      split_pane(direction:'left'|'right'|'up'|'down',size:number|nil):boolean
	--    },
	--    direction = 'left'|'right'|'up'|'down',
	--    split(), -- utility function to split current Neovim pane in the current direction
	--    wrap(), -- utility function to wrap to opposite Neovim pane
	-- }
	-- NOTE: `at_edge = 'wrap'` is not supported on Kitty terminal
	-- multiplexer, as there is no way to determine layout via the CLI
	at_edge = "wrap",
	-- Desired behavior when the current window is floating:
	-- 'previous' => Focus previous Vim window and perform action
	-- 'mux' => Always forward action to multiplexer
	float_win_behavior = "previous",
	-- when moving cursor between splits left or right,
	-- place the cursor on the same row of the *screen*
	-- regardless of line numbers. False by default.
	-- Can be overridden via function parameter, see Usage.
	move_cursor_same_row = false,
	-- whether the cursor should follow the buffer when swapping
	-- buffers by default; it can also be controlled by passing
	-- `{ move_cursor = true }` or `{ move_cursor = false }`
	-- when calling the Lua function.
	cursor_follows_swapped_bufs = false,
	-- ignore these autocmd events (via :h eventignore) while processing
	-- smart-splits.nvim computations, which involve visiting different
	-- buffers and windows. These events will be ignored during processing,
	-- and un-ignored on completed. This only applies to resize events,
	-- not cursor movement events.
	ignored_events = {
		"BufEnter",
		"WinEnter",
	},
	-- enable or disable a multiplexer integration;
	-- automatically determined, unless explicitly disabled or set,
	-- by checking the $TERM_PROGRAM environment variable,
	-- and the $KITTY_LISTEN_ON environment variable for Kitty.
	-- You can also set this value by setting `vim.g.smart_splits_multiplexer_integration`
	-- before the plugin is loaded (e.g. for lazy environments).
	multiplexer_integration = nil,
	-- disable multiplexer navigation if current multiplexer pane is zoomed
	-- NOTE: This does not work on Zellij as there is no way to determine the
	-- pane zoom state outside of the Zellij Plugin API, which does not apply here
	disable_multiplexer_nav_when_zoomed = true,
	-- Supply a Kitty remote control password if needed,
	-- or you can also set vim.g.smart_splits_kitty_password
	-- see https://sw.kovidgoyal.net/kitty/conf/#opt-kitty.remote_control_password
	kitty_password = nil,
	-- In Zellij, set this to true if you would like to move to the next *tab*
	-- when the current pane is at the edge of the zellij tab/window
	zellij_move_focus_or_tab = false,
	-- default logging level, one of: 'trace'|'debug'|'info'|'warn'|'error'|'fatal'
	log_level = "info",
})

-- Plugin: mikavilpas/yazi.nvim
-- URL: https://github.com/mikavilpas/yazi.nvim
-- description: A Neovim Plugin for the yazi terminal file manager
-- require("yazi").setup({
-- 	open_for_directories = true,
-- 	floating_window_scaling_factor = 1.0,
-- 	integrations = {
-- 		grep_in_directory = "snacks.picker",
-- 		grep_in_selected_files = "snacks.picker",
-- 	},
-- })

-- Plugin: stevearc/oil.nvim
-- URL: https://github.com/stevearc/oil.nvim
-- description: Neovim file explorer: edit your filesystem like a buffer
require("oil").setup({
	-- Oil will take over directory buffers (e.g. `vim .` or `:e src/`)
	-- Set to false if you want some other plugin (e.g. netrw) to open when you edit directories.
	default_file_explorer = true,
	-- Id is automatically added at the beginning, and name at the end
	-- See :help oil-columns
	columns = {
		"icon",
		-- "permissions",
		-- "size",
		-- "mtime",
	},
	-- Buffer-local options to use for oil buffers
	buf_options = {
		buflisted = false,
		bufhidden = "hide",
	},
	-- Window-local options to use for oil buffers
	win_options = {
		wrap = false,
		signcolumn = "no",
		cursorcolumn = false,
		foldcolumn = "0",
		spell = false,
		list = false,
		conceallevel = 3,
		concealcursor = "nvic",
	},
	-- Send deleted files to the trash instead of permanently deleting them (:help oil-trash)
	delete_to_trash = false,
	-- Skip the confirmation popup for simple operations (:help oil.skip_confirm_for_simple_edits)
	skip_confirm_for_simple_edits = false,
	-- Selecting a new/moved/renamed file or directory will prompt you to save changes first
	-- (:help prompt_save_on_select_new_entry)
	prompt_save_on_select_new_entry = true,
	-- Oil will automatically delete hidden buffers after this delay
	-- You can set the delay to false to disable cleanup entirely
	-- Note that the cleanup process only starts when none of the oil buffers are currently displayed
	cleanup_delay_ms = 2000,
	lsp_file_methods = {
		-- Enable or disable LSP file operations
		enabled = true,
		-- Time to wait for LSP file operations to complete before skipping
		timeout_ms = 1000,
		-- Set to true to autosave buffers that are updated with LSP willRenameFiles
		-- Set to "unmodified" to only save unmodified buffers
		autosave_changes = false,
	},
	-- Constrain the cursor to the editable parts of the oil buffer
	-- Set to `false` to disable, or "name" to keep it on the file names
	constrain_cursor = "editable",
	-- Set to true to watch the filesystem for changes and reload oil
	watch_for_changes = false,
	-- Keymaps in oil buffer. Can be any value that `vim.keymap.set` accepts OR a table of keymap
	-- options with a `callback` (e.g. { callback = function() ... end, desc = "", mode = "n" })
	-- Additionally, if it is a string that matches "actions.<name>",
	-- it will use the mapping at require("oil.actions").<name>
	-- Set to `false` to remove a keymap
	-- See :help oil-actions for a list of all available actions
	keymaps = {
		["g?"] = { "actions.show_help", mode = "n" },
		["<SPACE>"] = "actions.select",
		["<C-v>"] = { "actions.select", opts = { vertical = true } },
		["<C-s>"] = { "actions.select", opts = { horizontal = true } },
		["<C-t>"] = { "actions.select", opts = { tab = true } },
		["<C-p>"] = "actions.preview",
		["<C-q>"] = { "actions.close", mode = "n" },
		["<C-r>"] = "actions.refresh",
		["<TAB>"] = { "actions.parent", mode = "n" },
		["c"] = { "actions.open_cwd", mode = "n" },
		["<C-c>"] = { "actions.cd", mode = "n" },
		["g~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
		["gs"] = { "actions.change_sort", mode = "n" },
		["gx"] = "actions.open_external",
		["g."] = { "actions.toggle_hidden", mode = "n" },
		["g\\"] = { "actions.toggle_trash", mode = "n" },
	},
	-- Set to false to disable all of the above keymaps
	use_default_keymaps = true,
	view_options = {
		-- Show files and directories that start with "."
		show_hidden = false,
		-- This function defines what is considered a "hidden" file
		is_hidden_file = function(name, bufnr)
			local m = name:match("^%.")
			return m ~= nil
		end,
		-- This function defines what will never be shown, even when `show_hidden` is set
		is_always_hidden = function(name, bufnr)
			return false
		end,
		-- Sort file names with numbers in a more intuitive order for humans.
		-- Can be "fast", true, or false. "fast" will turn it off for large directories.
		natural_order = "fast",
		-- Sort file and directory names case insensitive
		case_insensitive = false,
		sort = {
			-- sort order can be "asc" or "desc"
			-- see :help oil-columns to see which columns are sortable
			{ "type", "asc" },
			{ "name", "asc" },
		},
		-- Customize the highlight group for the file name
		highlight_filename = function(entry, is_hidden, is_link_target, is_link_orphan)
			return nil
		end,
	},
	-- Extra arguments to pass to SCP when moving/copying files over SSH
	extra_scp_args = {},
	-- Extra arguments to pass to aws s3 when creating/deleting/moving/copying files using aws s3
	extra_s3_args = {},
	-- EXPERIMENTAL support for performing file operations with git
	git = {
		-- Return true to automatically git add/mv/rm files
		add = function(path)
			return false
		end,
		mv = function(src_path, dest_path)
			return false
		end,
		rm = function(path)
			return false
		end,
	},
	-- Configuration for the floating window in oil.open_float
	float = {
		-- Padding around the floating window
		padding = 2,
		-- max_width and max_height can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
		max_width = 0,
		max_height = 0,
		border = nil,
		win_options = {
			winblend = 0,
		},
		-- optionally override the oil buffers window title with custom function: fun(winid: integer): string
		get_win_title = nil,
		-- preview_split: Split direction: "auto", "left", "right", "above", "below".
		preview_split = "auto",
		-- This is the config that will be passed to nvim_open_win.
		-- Change values here to customize the layout
		override = function(conf)
			return conf
		end,
	},
	-- Configuration for the file preview window
	preview_win = {
		-- Whether the preview window is automatically updated when the cursor is moved
		update_on_cursor_moved = true,
		-- How to open the preview window "load"|"scratch"|"fast_scratch"
		preview_method = "fast_scratch",
		-- A function that returns true to disable preview on a file e.g. to avoid lag
		disable_preview = function(filename)
			return false
		end,
		-- Window-local options to use for preview window buffers
		win_options = {},
	},
	-- Configuration for the floating action confirmation window
	confirmation = {
		-- Width dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
		-- min_width and max_width can be a single value or a list of mixed integer/float types.
		-- max_width = {100, 0.8} means "the lesser of 100 columns or 80% of total"
		max_width = 0.9,
		-- min_width = {40, 0.4} means "the greater of 40 columns or 40% of total"
		min_width = { 40, 0.4 },
		-- optionally define an integer/float for the exact width of the preview window
		width = nil,
		-- Height dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
		-- min_height and max_height can be a single value or a list of mixed integer/float types.
		-- max_height = {80, 0.9} means "the lesser of 80 columns or 90% of total"
		max_height = 0.9,
		-- min_height = {5, 0.1} means "the greater of 5 columns or 10% of total"
		min_height = { 5, 0.1 },
		-- optionally define an integer/float for the exact height of the preview window
		height = nil,
		border = nil,
		win_options = {
			winblend = 0,
		},
	},
	-- Configuration for the floating progress window
	progress = {
		max_width = 0.9,
		min_width = { 40, 0.4 },
		width = nil,
		max_height = { 10, 0.9 },
		min_height = { 5, 0.1 },
		height = nil,
		border = nil,
		minimized_border = "none",
		win_options = {
			winblend = 0,
		},
	},
	-- Configuration for the floating SSH window
	ssh = {
		border = nil,
	},
	-- Configuration for the floating keymaps help window
	keymaps_help = {
		border = nil,
	},
})
