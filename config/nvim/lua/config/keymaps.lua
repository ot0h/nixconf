local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

local function map(mode, lhs, rhs, desc_or_opts)
	local current_opts = vim.tbl_extend("force", opts, {})

	if type(desc_or_opts) == "string" then
		current_opts.desc = desc_or_opts
	elseif type(desc_or_opts) == "table" then
		current_opts = vim.tbl_extend("force", current_opts, desc_or_opts)
	end

	keymap(mode, lhs, rhs, current_opts)
end

map("n", "-", ":Oil<CR>", "Abrir Oil")
map("n", "_", ":lua MiniFiles.open()<CR>", "Abrir MiniFiles")
map("n", "<leader>", ":WhichKey<CR>", "WhichKey")

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

-- Snacks: Pickers & Extras
map("n", "<leader><space>", ":lua Snacks.picker.smart()<CR>", "Smart Picker")
map("n", "<leader>,", ":lua Snacks.picker.buffers()<CR>", "Buffers")
map("n", "<leader>/", ":lua Snacks.picker.grep()<CR>", "Grep")
map("n", "<leader>fb", ":lua Snacks.picker.buffers()<CR>", "Find Buffers")
map("n", "<leader>ff", ":lua Snacks.picker.files()<CR>", "Find Files")
map("n", "<leader>gg", ":lua Snacks.lazygit()<CR>", "LazyGit")
map("n", "<leader>z", ":lua Snacks.zen()<CR>", "Zen Mode")
map("n", "<leader>bd", ":lua Snacks.bufdelete()<CR>", "Delete Buffer")
map("n", "<c-/>", ":lua Snacks.terminal()<CR>", "Terminal")

-- LSP & Search
map("n", "gd", ":lua Snacks.picker.lsp_definitions()<CR>", "Definición")
map("n", "gr", ":lua Snacks.picker.lsp_references()<CR>", "Referencias")
map("x", "<leader>sw", ":lua Snacks.picker.grep_word()<CR>", "Visual Grep Word")
map("x", "<leader>si", ":lua Snacks.picker.icons()<CR>", "Visual Grep Word")

-- Conform y Guardado
map("n", "<leader>w", ":w<CR>", "Guardar")
map("n", "<C-s>", function()
	SaveFile()
end, "Guardar con Notificación")

-- 3. LSP Attach
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		local b_opts = { buffer = ev.buf }
		map("n", "K", vim.lsp.buf.hover, b_opts)
		map("n", "<leader>k", vim.diagnostic.open_float, b_opts)
		map("n", "<leader>F", function()
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

--  Flash
map({ "n", "x" }, "<leader>a", function()
	require("fastaction").code_action()
end, "Code Actions")

-- Flash
map({ "n", "x", "o" }, "s", function()
	require("flash").jump()
end, "Flash Jump")

map({ "n", "x", "o" }, "S", function()
	require("flash").treesitter()
end, "Flash Treesitter")

map("o", "r", function()
	require("flash").remote()
end, "Remote Flash")

map({ "o", "x" }, "R", function()
	require("flash").treesitter_search()
end, "Treesitter Search")

map("c", "<c-s>", function()
	require("flash").toggle()
end, "Toggle Flash Search")
