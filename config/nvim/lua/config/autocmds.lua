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
