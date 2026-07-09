local M = {}

local cached_colors = nil

function M.get_colors()
	if cached_colors then
		return cached_colors
	end

	local colors_dir = vim.fn.expand("~/.config/stylix-colors")
	package.path = package.path .. ";" .. colors_dir .. "/?.lua"

	local ok, neovim = pcall(require, "neovim")
	if not ok then
		vim.notify("No se pudo cargar stylix-colors/neovim.lua", vim.log.levels.ERROR)
		neovim = {}
	end

	cached_colors = {
		background = neovim.color0 or "#1c1c1c",
		foreground = neovim.color5 or "#dfdfdf",
		cursor = neovim.color7 or "#e4e4e4",

		color0 = neovim.color0 or "#1c1c1c",
		color1 = neovim.color1 or "#919191",
		color2 = neovim.color2 or "#919191",
		color3 = neovim.color3 or "#919191",
		color4 = neovim.color4 or "#919191",
		color5 = neovim.color5 or "#dfdfdf",
		color6 = neovim.color6 or "#919191",
		color7 = neovim.color7 or "#e4e4e4",
		color8 = neovim.color8 or "#919191",
		color9 = neovim.color9 or "#919191",
		color10 = neovim.color10 or "#919191",
		color11 = neovim.color11 or "#919191",
		color12 = neovim.color12 or "#919191",
		color13 = neovim.color13 or "#919191",
		color14 = neovim.color14 or "#919191",

		red = neovim.color8 or "#919191",
		green = neovim.color10 or "#919191",
		yellow = neovim.color11 or "#919191",
		blue = neovim.color12 or "#919191",
		purple = neovim.color13 or "#919191",
		cyan = neovim.color14 or "#919191",
		orange = neovim.color9 or "#919191",
	}

	return cached_colors
end

return M
