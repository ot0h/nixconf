local ok, obs_or_err = pcall(require, "obsidian")
if not ok then
	vim.notify("obsidian.nvim not available: " .. tostring(obs_or_err), vim.log.levels.WARN)
else
	local setup_ok, setup_err = pcall(obs_or_err.setup, {
		legacy_commands = false,
		workspaces = {
			{
				name = "personal",
				path = "~/Documents/Notas",
			},
		},
	})
	if not setup_ok then
		vim.schedule(function()
			vim.notify(
				"obsidian.nvim skipped: " .. tostring(setup_err),
				vim.log.levels.WARN,
				{ title = "obsidian.nvim" }
			)
		end)
	end
end

require("markview").setup({
	typst = {
		enable = false,
	},
})
