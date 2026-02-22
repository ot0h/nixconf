local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

keymap("n", "-", ":lua MiniFiles.open()<CR>", opts)
keymap("n", "<leader>", ":WhichKey<CR>", opts)

-- SmartSplits
local smart_splits = require("smart-splits")

keymap("n", "<C-h>", smart_splits.move_cursor_left)
keymap("n", "<C-j>", smart_splits.move_cursor_down)
keymap("n", "<C-k>", smart_splits.move_cursor_up)
keymap("n", "<C-l>", smart_splits.move_cursor_right)

-- Cambiar tamaños de paneles
keymap("n", "<M-h>", smart_splits.resize_left)
keymap("n", "<M-j>", smart_splits.resize_down)
keymap("n", "<M-k>", smart_splits.resize_up)
keymap("n", "<M-l>", smart_splits.resize_right)

-- Swap
keymap("n", "<C-M-h>", smart_splits.swap_buf_left)
keymap("n", "<C-M-j>", smart_splits.swap_buf_down)
keymap("n", "<C-M-k>", smart_splits.swap_buf_up)
keymap("n", "<C-M-l>", smart_splits.swap_buf_right)

-- Snacks
-- Snacks: Top Pickers & Explorer
keymap("n", "<leader><space>", ":lua Snacks.picker.smart()<CR>", opts)
keymap("n", "<leader>,", ":lua Snacks.picker.buffers()<CR>", opts)
keymap("n", "<leader>/", ":lua Snacks.picker.grep()<CR>", opts)
keymap("n", "<leader>:", ":lua Snacks.picker.command_history()<CR>", opts)
keymap("n", "<leader>n", ":lua Snacks.picker.notifications()<CR>", opts)

-- Snacks: Find
keymap("n", "<leader>fb", ":lua Snacks.picker.buffers()<CR>", opts)
keymap("n", "<leader>fc", ":lua Snacks.picker.files({ cwd = vim.fn.stdpath('config') })<CR>", opts)
keymap("n", "<leader>ff", ":lua Snacks.picker.files()<CR>", opts)
keymap("n", "<leader>fg", ":lua Snacks.picker.git_files()<CR>", opts)
keymap("n", "<leader>fp", ":lua Snacks.picker.projects()<CR>", opts)
keymap("n", "<leader>fr", ":lua Snacks.picker.recent()<CR>", opts)

-- Snacks: Git
keymap("n", "<leader>gb", ":lua Snacks.picker.git_branches()<CR>", opts)
keymap("n", "<leader>gl", ":lua Snacks.picker.git_log()<CR>", opts)
keymap("n", "<leader>gL", ":lua Snacks.picker.git_log_line()<CR>", opts)
keymap("n", "<leader>gs", ":lua Snacks.picker.git_status()<CR>", opts)
keymap("n", "<leader>gS", ":lua Snacks.picker.git_stash()<CR>", opts)
keymap("n", "<leader>gd", ":lua Snacks.picker.git_diff()<CR>", opts)
keymap("n", "<leader>gf", ":lua Snacks.picker.git_log_file()<CR>", opts)

-- Snacks: Search
keymap("n", '<leader>s"', ":lua Snacks.picker.registers()<CR>", opts)
keymap("n", "<leader>s/", ":lua Snacks.picker.search_history()<CR>", opts)
keymap("n", "<leader>sa", ":lua Snacks.picker.autocmds()<CR>", opts)
keymap("n", "<leader>sb", ":lua Snacks.picker.lines()<CR>", opts)
keymap("n", "<leader>sc", ":lua Snacks.picker.command_history()<CR>", opts)
keymap("n", "<leader>sC", ":lua Snacks.picker.commands()<CR>", opts)
keymap("n", "<leader>sd", ":lua Snacks.picker.diagnostics()<CR>", opts)
keymap("n", "<leader>sD", ":lua Snacks.picker.diagnostics_buffer()<CR>", opts)
keymap("n", "<leader>sh", ":lua Snacks.picker.help()<CR>", opts)
keymap("n", "<leader>sH", ":lua Snacks.picker.highlights()<CR>", opts)
keymap("n", "<leader>si", ":lua Snacks.picker.icons()<CR>", opts)
keymap("n", "<leader>sj", ":lua Snacks.picker.jumps()<CR>", opts)
keymap("n", "<leader>sk", ":lua Snacks.picker.keymaps()<CR>", opts)
keymap("n", "<leader>sl", ":lua Snacks.picker.loclist()<CR>", opts)
keymap("n", "<leader>sm", ":lua Snacks.picker.marks()<CR>", opts)
keymap("n", "<leader>sM", ":lua Snacks.picker.man()<CR>", opts)
keymap("n", "<leader>sq", ":lua Snacks.picker.qflist()<CR>", opts)
keymap("n", "<leader>sR", ":lua Snacks.picker.resume()<CR>", opts)
keymap("n", "<leader>su", ":lua Snacks.picker.undo()<CR>", opts)

-- Snacks: LSP
keymap("n", "gd", ":lua Snacks.picker.lsp_definitions()<CR>", opts)
keymap("n", "gD", ":lua Snacks.picker.lsp_declarations()<CR>", opts)
keymap("n", "gr", ":lua Snacks.picker.lsp_references()<CR>", opts)
keymap("n", "gI", ":lua Snacks.picker.lsp_implementations()<CR>", opts)
keymap("n", "gy", ":lua Snacks.picker.lsp_type_definitions()<CR>", opts)
keymap("n", "gai", ":lua Snacks.picker.lsp_incoming_calls()<CR>", opts)
keymap("n", "gao", ":lua Snacks.picker.lsp_outgoing_calls()<CR>", opts)
keymap("n", "<leader>ss", ":lua Snacks.picker.lsp_symbols()<CR>", opts)
keymap("n", "<leader>sS", ":lua Snacks.picker.lsp_workspace_symbols()<CR>", opts)

-- Snacks: Extras & Utils
keymap("n", "<leader>z", ":lua Snacks.zen()<CR>", opts)
keymap("n", "<leader>Z", ":lua Snacks.zen.zoom()<CR>", opts)
keymap("n", "<leader>.", ":lua Snacks.scratch()<CR>", opts)
keymap("n", "<leader>S", ":lua Snacks.scratch.select()<CR>", opts)
keymap("n", "<leader>bd", ":lua Snacks.bufdelete()<CR>", opts)
keymap("n", "<leader>cR", ":lua Snacks.rename.rename_file()<CR>", opts)
keymap("n", "<leader>gg", ":lua Snacks.lazygit()<CR>", opts)
keymap("n", "<leader>un", ":lua Snacks.notifier.hide()<CR>", opts)
keymap("n", "<c-/>", ":lua Snacks.terminal()<CR>", opts)

-- Visual Mode para Grep Word
keymap("x", "<leader>sw", ":lua Snacks.picker.grep_word()<CR>", opts)

-- Conform
keymap("n", "<leader>w", ":w<CR>", { desc = "Guardar archivo" })

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- 'ev.buf' es el número del buffer que acaba de conectar el LSP

		-- Atajos básicos
		keymap("n", "gd", vim.lsp.buf.definition, opts)
		keymap("n", "K", vim.lsp.buf.hover, opts)
		keymap("n", "<leader>k", vim.diagnostic.open_float, opts)

		-- Formateo con Conform
		keymap("n", "<leader>F", function()
			require("conform").format({ bufnr = ev.buf, lsp_fallback = true })
		end, opts)
	end,
})

-- Ejecutar Código con F5
local shells = {
	bash = true,
	zsh = true,
	fish = true,
	sh = true,
	[""] = true,
}

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

keymap("n", "<F5>", function()
	local file = vim.fn.expand("%:p")
	if file == "" then
		vim.notify("No file to run", vim.log.levels.ERROR)
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
			return "clang++ " .. esc_file .. " -o " .. esc_name .. " && ./" .. name
		end,
		java = function()
			return "javac " .. esc_file .. " && java " .. name
		end,
	}

	local builder = commands[ext]
	if not builder then
		vim.notify("No runner configured for ." .. ext, vim.log.levels.ERROR)
		return
	end

	local cmd = builder()
	local cwd = vim.fn.expand("%:p:h")

	if vim.env.TMUX then
		local target = find_target_pane()

		if not target then
			target = vim.fn.trim(vim.fn.system("tmux split-window -v -P -F '#{pane_id}'"))
			vim.wait(100)
		end

		if target and target ~= "" then
			local full_cmd = string.format("cd %s && clear && %s", vim.fn.shellescape(cwd), cmd)

			vim.fn.system({
				"tmux",
				"send-keys",
				"-t",
				target,
				full_cmd,
				"Enter",
			})
		else
			vim.notify("Failed to execute in tmux", vim.log.levels.ERROR)
		end
	else
		vim.cmd("belowright 15split")
		vim.cmd("terminal " .. cmd)
	end
end, { desc = "Run current file" })

-- Redefine Ctrl+s to save with the custom function
vim.api.nvim_set_keymap("n", "<C-s>", ":lua SaveFile()<CR>", { noremap = true, silent = true })

-- Custom save function
function SaveFile()
	-- Check if a buffer with a file is open
	if vim.fn.empty(vim.fn.expand("%:t")) == 1 then
		vim.notify("No file to save", vim.log.levels.WARN)
		return
	end

	local filename = vim.fn.expand("%:t") -- Get only the filename
	local success, err = pcall(function()
		vim.cmd("silent! write") -- Try to save the file without showing the default message
	end)

	if success then
		vim.notify(filename .. " Saved!") -- Show only the custom message if successful
	else
		vim.notify("Error: " .. err, vim.log.levels.ERROR) -- Show the error message if it fails
	end
end
