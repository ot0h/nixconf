local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

local function map(mode, lhs, rhs, desc_or_opts)
	local current_opts = vim.tbl_extend("force", opts, {})
	local wk_icon = nil
	local wk_desc = nil

	if type(desc_or_opts) == "string" then
		current_opts.desc = desc_or_opts
	elseif type(desc_or_opts) == "table" then
		wk_icon = desc_or_opts.icon
		wk_desc = desc_or_opts.desc
		local clean_opts = vim.tbl_extend("force", desc_or_opts, {})
		clean_opts.icon = nil
		-- Si desc es función, ponemos valor inicial para keymap
		if type(clean_opts.desc) == "function" then
			clean_opts.desc = clean_opts.desc()
		end
		current_opts = vim.tbl_extend("force", current_opts, clean_opts)
	end

	keymap(mode, lhs, rhs, current_opts)

	-- Registrar en which-key si hay icon o desc dinámica
	if wk_icon or type(wk_desc) == "function" then
		require("which-key").add({
			{
				lhs,
				desc = wk_desc,
				icon = wk_icon,
				mode = type(mode) == "table" and mode or { mode },
			},
		})
	end
end

-- MiniFiles
map("n", "_", ":lua MiniFiles.open()<CR>", "Abrir MiniFiles")

-- Yazi
map({ "n", "v" }, "-", ":Yazi <CR>", "Abrir Yazi")
map("n", "<C-->", "Yazi cwd <CR>", "Abrir Yazi en Working Directory")
map("n", "<A->", ":Yazi toggle<CR>", "Abrir Yazi en la ultima session")

-- Treesitter
map({ "n", "x", "o" }, "<A-o>", function()
	if vim.treesitter.get_parser(nil, nil, { error = false }) then
		require("vim.treesitter._select").select_parent(vim.v.count1)
	else
		vim.lsp.buf.selection_range(vim.v.count1)
	end
end, { desc = "Select parent treesitter node or outer incremental lsp selections" })

map({ "n", "x", "o" }, "<A-i>", function()
	if vim.treesitter.get_parser(nil, nil, { error = false }) then
		require("vim.treesitter._select").select_child(vim.v.count1)
	else
		vim.lsp.buf.selection_range(-vim.v.count1)
	end
end, { desc = "Select child treesitter node or inner incremental lsp selections" })

-- SmartSplits
local smart_splits = require("smart-splits")
map("n", "<C-h>", smart_splits.move_cursor_left)
map("n", "<C-j>", smart_splits.move_cursor_down)
map("n", "<C-k>", smart_splits.move_cursor_up)
map("n", "<C-l>", smart_splits.move_cursor_right)
map("n", "<M-h>", smart_splits.resize_left)
map("n", "<M-j>", smart_splits.resize_down)
map("n", "<M-k>", smart_splits.resize_up)
map("n", "<M-l>", smart_splits.resize_right)
map("n", "<C-M-h>", smart_splits.swap_buf_left)
map("n", "<C-M-j>", smart_splits.swap_buf_down)
map("n", "<C-M-k>", smart_splits.swap_buf_up)
map("n", "<C-M-l>", smart_splits.swap_buf_right)

-- Cambiar entre Buffers
map("n", "L", "<cmd>bnext<CR>")
map("n", "H", "<cmd>bprevious<CR>")

-- Snacks: Pickers & Extras
map("n", "<space><space>", ":lua Snacks.picker.smart()<CR>", { desc = "Smart Picker", icon = "󱈆" })
map("n", "<space>,", ":lua Snacks.picker.buffers()<CR>", "Buffers")
map({ "n", "v", "x" }, "<space>p", ":lua Snacks.picker()<CR>", { desc = "Snacks Picker", icon = "󱥰" })
map("n", "<leader>fg", ":lua Snacks.picker.grep()<CR>", "Grep")
map("n", "<leader>fb", ":lua Snacks.picker.grep_buffers()<CR>", "Grep Buffers")
map("n", "<leader>fG", ":lua Snacks.picker.git_grep()<CR>", "Git Grep")

map("n", "<leader>gg", ":lua Snacks.lazygit()<CR>", { desc = "Lazygit", icon = "" })
map("n", "<leader>gl", ":lua Snacks.lazygit.log()<CR>", { desc = "Lazygit Log", icon = "" })
map("n", "<leader>gf", ":lua Snacks.lazygit.log_file()<CR>", { desc = "Lazygit Log File", icon = "󱁻" })

map("n", "<leader>sd", ":lua Snacks.picker.diagnostics()<CR>", "Search Diagnostic")
map("n", "<leader>sD", ":lua Snacks.picker.diagnostics_buffer()<CR>", "Search Diagnostic in Buffer")
map("n", "<leader>st", ":lua Snacks.picker.treesitter()<CR>", "Search Treesitter")
map("n", "<leader>su", ":lua Snacks.picker.undo()<CR>", "Search Undo")
map("n", "<leader>sl", ":lua Snacks.picker.lines()<CR>", "Search Line")

map("n", "<leader>n", ":lua Snacks.picker.notifications()<CR>", { desc = "notifications", icon = "" })
map("n", "<leader>e", ":lua Snacks.picker.explorer()<CR>", { desc = "Explorer", icon = "" })

-- LSP & Search
map("n", "gd", ":lua Snacks.picker.lsp_definitions()<CR>", "Go to LSP Definition")
map("n", "gR", ":lua Snacks.picker.lsp_references()<CR>", "Go to LSP Reference")
map("n", "gI", ":lua Snacks.picker.lsp_implementations()<CR>", "Go to LSP Implementation")
map("n", "gT", ":lua Snacks.picker.lsp_type_definitions()<CR>", "Go to LSP Type Definition")
map("n", "gS", ":lua Snacks.picker.lsp_symbols()<CR>", "Go to LSP Symbols")
map("x", "<space>fw", ":lua Snacks.picker.grep_word()<CR>", "Visual Grep Word")
map("x", "<space>fi", ":lua Snacks.picker.icons()<CR>", "Search Icon")

-- Cosas de UI
map("n", "<leader>uw", function()
	vim.cmd("set wrap!")
	vim.notify(
		"Wrap: " .. (vim.wo.wrap and "ON" or "OFF"),
		vim.wo.wrap and vim.log.levels.INFO or vim.log.levels.WARN,
		{ title = "UI" }
	)
end, {
	desc = "Wrap",
	icon = function()
		return vim.wo.wrap and "󰔡" or "󰔢"
	end,
})

map("n", "<leader>ur", function()
	vim.cmd("set relativenumber!")
	vim.notify(
		"RelNumber: " .. (vim.wo.relativenumber and "ON" or "OFF"),
		vim.wo.relativenumber and vim.log.levels.INFO or vim.log.levels.WARN,
		{ title = "UI" }
	)
end, {
	desc = "Relative Number",
	icon = function()
		return vim.wo.relativenumber and "󰔡" or "󰔢"
	end,
})

map("n", "<leader>uh", function()
	local state = vim.lsp.inlay_hint.is_enabled()
	vim.lsp.inlay_hint.enable(not state)
	vim.notify(
		"Inlay Hints: " .. (not state and "ON" or "OFF"),
		not state and vim.log.levels.INFO or vim.log.levels.WARN,
		{ title = "LSP" }
	)
end, {
	desc = "Inlay Hints",
	icon = function()
		return vim.lsp.inlay_hint.is_enabled() and "󰔡" or "󰔢"
	end,
})

map("n", "<leader>ui", function()
	local cfg = require("pywal.config")
	cfg.italic_enabled = not cfg.italic_enabled
	require("pywal"):reload()
	vim.notify(
		"Italic: " .. (cfg.italic_enabled and "ON" or "OFF"),
		cfg.italic_enabled and vim.log.levels.INFO or vim.log.levels.WARN,
		{ title = "UI" }
	)
end, {
	desc = "Italic",
	icon = function()
		local ok, cfg = pcall(require, "pywal.config")
		if not ok then
			return "󰔢"
		end
		return cfg.italic_enabled and "󰔡" or "󰔢"
	end,
})

map("n", "<leader>uc", "<cmd>CopilotToggle<CR>", { desc = "Copilot", icon = "" })

-- Conform y Guardado
map("n", "<space>w", ":w<CR>", { desc = "Guardar", icon = "" })
map("n", "<C-s>", function()
	SaveFile()
end, "Guardar con Notificación")

-- LSP Attach
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		local b_opts = { buffer = ev.buf }

		map("n", "K", function()
			vim.lsp.buf.hover({ border = "single" })
		end, b_opts)

		map("n", "<space>k", function()
			vim.diagnostic.open_float({ border = "single" })
		end, b_opts)

		map("n", "<space>F", function()
			require("conform").format({ bufnr = ev.buf, lsp_fallback = true })
		end, { buffer = ev.buf, desc = "Format Code" })
	end,
})

-- El Runner F5
local shells = { bash = true, zsh = true, fish = true, sh = true, [""] = true }
local function find_target_pane()
	local panes = vim.fn.systemlist("tmux list-panes -F '#{pane_id}:#{pane_current_command}'")
	local current = vim.fn.trim(vim.fn.system("tmux display-message -p '#{pane_id}'"))
	for _, info in ipairs(panes) do
		local pane_id, cmd = info:match("([^:]+):(.*)")
		if pane_id ~= current and shells[cmd] then
			return pane_id
		end
	end
end

map("n", "<F5>", function()
	local file = vim.fn.expand("%:p")
	if file == "" then
		return
	end

	local esc_file = vim.fn.shellescape(file)
	local name = vim.fn.expand("%:t:r")
	local esc_name = vim.fn.shellescape(name)
	local ext = vim.fn.expand("%:e")

	local commands = {
		py = function()
			return "python3 " .. esc_file
		end,
		js = function()
			return "bun run " .. esc_file
		end,
		ts = function()
			return "bun run " .. esc_file
		end,
		tsx = function()
			return "npx tsc " .. esc_file .. " --outDir /tmp --jsx react && node /tmp/" .. name .. ".js"
		end,
		c = function()
			return "gcc " .. esc_file .. " -o " .. esc_name .. " && ./" .. name
		end,
		cpp = function()
			return "g++ " .. esc_file .. " -o " .. esc_name .. " && ./" .. name
		end,
		java = function()
			return "javac " .. esc_file .. " && java " .. name
		end,
		go = function()
			return "go run " .. esc_file
		end,
		rs = function()
			return "rustc " .. esc_file .. " -o " .. esc_name .. " && ./" .. name
		end,
		lua = function()
			return "lua " .. esc_file
		end,
	}

	local builder = commands[ext]
	if not builder then
		return
	end

	local cmd = builder()
	local cwd = vim.fn.expand("%:p:h")

	if vim.env.TMUX then
		local target = find_target_pane() or vim.fn.trim(vim.fn.system("tmux split-window -v -P -F '#{pane_id}'"))
		local full_cmd = string.format("cd %s && clear && %s", vim.fn.shellescape(cwd), cmd)
		vim.fn.system({ "tmux", "send-keys", "-t", target, full_cmd, "Enter" })
	else
		vim.cmd("split | terminal " .. cmd)
	end
end, "Correr Codigo")

-- Función SaveFile
function SaveFile()
	local filename = vim.fn.expand("%:t")
	if filename == "" then
		return
	end
	if pcall(vim.cmd, "silent! write") then
		vim.notify(filename .. " ¡Cheque, guardado!")
	end
end

-- FastAction
map({ "n", "x" }, "<space>A", function()
	require("fastaction").code_action()
end, { desc = "Code Action", icon = "" })

-- Flash
map({ "n", "x", "o" }, "s", function()
	require("flash").jump()
end, "Flash Jump")

map({ "n", "x", "o" }, "S", function()
	require("flash").treesitter()
end, "Flash Treesitter")

map("o", "r", function()
	require("flash").remote()
end, { desc = "Remote Flash", icon = "" })

map({ "o", "x" }, "R", function()
	require("flash").treesitter_search()
end, "Treesitter Search")

map("c", "<c-s>", function()
	require("flash").toggle()
end, "Toggle Flash Search")

-- Sidekick (Cosas de AI)
map("n", "<tab>", function()
	if not require("sidekick").nes_jump_or_apply() then
		return "<Tab>"
	end
end, { expr = true, desc = "Goto/Apply Next Edit Suggestion" })

map({ "n", "t", "i", "x" }, "<c-.>", function()
	require("sidekick.cli").focus()
end, "Sidekick Focus")

map("n", "<leader>aa", function()
	require("sidekick.cli").toggle()
end, { desc = "Toggle Sidekick", icon = "󱜙" })

map("n", "<leader>as", function()
	require("sidekick.cli").select()
end, { desc = "Select CLI", icon = "" })

map("n", "<leader>ad", function()
	require("sidekick.cli").close()
end, "Detach a CLI Session")

map({ "x", "n" }, "<leader>at", function()
	require("sidekick.cli").send({ msg = "{this}" })
end, { desc = "Send this", icon = "󰒇" })

map("n", "<leader>af", function()
	require("sidekick.cli").send({ msg = "{file}" })
end, "Send File")

map("x", "<leader>av", function()
	require("sidekick.cli").send({ msg = "{selection}" })
end, { desc = "Send Visual Selection", icon = "󰒇" })

map({ "n", "x" }, "<leader>ap", function()
	require("sidekick.cli").prompt()
end, { desc = "Sidekick Prompt", icon = "" })

map({ "n" }, "<C-t>", function()
	require("minty.shades").open()
end)
