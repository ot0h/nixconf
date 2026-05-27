-- Activar Hints en los servidores declarados
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		local hint_servers = { nixd = true }

		if client and hint_servers[client.name] then
			vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })
		end
	end,
})

-- Comando para actualizar Vim Pack
vim.api.nvim_create_user_command("PackUpdate", function()
	vim.pack.update()
end, { desc = "Actualizar Plugins" })

-- Actualizar el Quickfix
vim.api.nvim_create_autocmd("DiagnosticChanged", {
	callback = function()
		-- Solo actualiza si la Quickfix ya está abierta
		local qf_exists = false
		for _, win in pairs(vim.fn.getwininfo()) do
			if win.quickfix == 1 then
				qf_exists = true
			end
		end

		if qf_exists then
			vim.diagnostic.setqflist({ open = false })
		end
	end,
})

-- Teners Folds Persistentes
vim.api.nvim_create_autocmd({ "BufWinLeave" }, {
	pattern = "*",
	callback = function()
		vim.cmd("silent! mkview")
	end,
})

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	pattern = "*",
	callback = function()
		vim.cmd("silent! loadview")
	end,
})
