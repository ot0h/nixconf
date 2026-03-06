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
