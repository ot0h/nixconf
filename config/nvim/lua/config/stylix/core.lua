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
		background = neovim.base00 or "#1c1c1c",
		foreground = neovim.base05 or "#dfdfdf",
		cursor = neovim.base07 or "#e4e4e4",

		color0 = neovim.base00 or "#1c1c1c",
		color1 = neovim.base08 or "#919191",
		color2 = neovim.base0B or "#919191",
		color3 = neovim.base0A or "#919191",
		color4 = neovim.base0D or "#919191",
		color5 = neovim.base0E or "#919191",
		color6 = neovim.base0C or "#919191",
		color7 = neovim.base05 or "#dfdfdf",
		color8 = neovim.base03 or "#9e9e9e",
		color9 = neovim.base08 or "#919191",
		color10 = neovim.base0B or "#919191",
		color11 = neovim.base0A or "#919191",
		color12 = neovim.base0D or "#919191",
		color13 = neovim.base0E or "#919191",
		color14 = neovim.base0C or "#919191",
		color15 = neovim.base07 or "#e4e4e4",

		red = neovim.base08 or "#919191",
		green = neovim.base0B or "#919191",
		yellow = neovim.base0A or "#919191",
		blue = neovim.base0D or "#919191",
		purple = neovim.base0E or "#919191",
		cyan = neovim.base0C or "#919191",
		orange = neovim.base09 or "#919191",
	}

	return cached_colors
end

return M
