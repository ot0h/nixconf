require("sidekick").setup({
	cli = {
		mux = {
			backend = "tmux",
			enabled = true,
			fallback = "terminal",
		},
	},
})

-- Copilot: carga diferida + toggle (NO arranca al inicio)
local copilot_configured = false

vim.api.nvim_create_user_command("CopilotToggle", function()
	if not copilot_configured then
		-- Primera vez: setup y activación
		require("copilot").setup({
			suggestion = {
				enabled = true,
				auto_trigger = true,
				debounce = 75,
				keymap = {
					accept = "<M-l>",
					accept_word = "<M-w>",
					accept_line = "<M-e>",
					next = "<M-]>",
					prev = "<M-[>",
					dismiss = "<C-]>",
				},
			},
			panel = { enabled = false },
			filetypes = {
				lua = true,
				rust = true,
				go = true,
				typst = true,
				python = true,
				typescript = true,
				javascript = true,
				typescriptreact = true,
				javascriptreact = true,
				css = true,
				html = true,
				markdown = true,
				["*"] = false,
			},
			copilot_node_command = "node",
		})
		vim.cmd("Copilot enable")
		vim.g.copilot_active = true
		copilot_configured = true
		vim.notify("Copilot ON", vim.log.levels.INFO)
		return
	end

	-- Toggle on/off usando el comando nativo del plugin
	vim.cmd("Copilot toggle")
	vim.g.copilot_active = not vim.g.copilot_active
	vim.notify("Copilot " .. (vim.g.copilot_active and "ON" or "OFF"), vim.log.levels.INFO)
end, {})
