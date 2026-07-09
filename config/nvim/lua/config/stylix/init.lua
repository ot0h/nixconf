local M = {}
local core = require("config.stylix.core")
local highlights = require("config.stylix.highlights")
local config = require("config.stylix.config")

M.italic_enabled = config.italic_enabled
M.bold_override = config.bold_override

function M.setup()
	local colors = core.get_colors()
	vim.opt.termguicolors = true
	highlights.highlight_all(colors)

	vim.defer_fn(function()
		local c = core.get_colors()
		highlights.refresh(c)
	end, 200)
end

function M.reload()
	local colors = core.get_colors()
	highlights.refresh(colors)
end

vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		vim.defer_fn(function()
			local colors = core.get_colors()
			highlights.refresh(colors)
		end, 50)
	end,
})

return M
