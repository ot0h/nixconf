local M = {}

-- Cache para no leer el archivo en cada llamada
local cached_colors = nil

--- Obtiene los colores importando directamente el archivo neovim.lua
function M.get_colors()
	if cached_colors then
		return cached_colors
	end

	-- Ruta de la carpeta donde tenés tu neovim.lua
	local colors_dir = vim.fn.expand("~/.config/stylix-colors")

	-- Le soplamos a Lua dónde buscar el módulo
	package.path = package.path .. ";" .. colors_dir .. "/?.lua"

	local ok, base16 = pcall(require, "neovim")
	if not ok then
		vim.notify(
			"¡Pijazo de error! No se pudo encontrar o cargar neovim.lua en " .. colors_dir,
			vim.log.levels.ERROR
		)
		base16 = {} -- Tabla vacía para que no se caiga la config
	end

	-- Mapeamos las variables de tu paleta
	local base_colors = {
		background = base16.base00 or "#1c1c1c",
		foreground = base16.base05 or "#dfdfdf",
		cursor = base16.base07 or "#e4e4e4",

		-- Mapeo clásico de colores de terminal (color0 a color15)
		color0 = base16.base00 or "#1c1c1c",
		color1 = base16.base08 or "#919191",
		color2 = base16.base0B or "#919191",
		color3 = base16.base0A or "#919191",
		color4 = base16.base0D or "#929292",
		color5 = base16.base0E or "#919191",
		color6 = base16.base0C or "#909090",
		color7 = base16.base05 or "#dfdfdf",
		color8 = base16.base03 or "#9e9e9e",
		color9 = base16.base08 or "#919191",
		color10 = base16.base0B or "#919191",
		color11 = base16.base0A or "#919191",
		color12 = base16.base0D or "#929292",
		color13 = base16.base0E or "#919191",
		color14 = base16.base0C or "#909090",
		color15 = base16.base07 or "#e4e4e4",
	}

	-- Extendemos con los alias semánticos que ocupás
	cached_colors = vim.tbl_extend("force", base_colors, {
		red = base_colors.color1,
		yellow = base_colors.color3,
		green = base_colors.color2,
		blue = base_colors.color4,
		purple = base_colors.color5,
		orange = base_colors.color11,
		cyan = base_colors.color6,

		rosewater = base16.base06 or "#dddddd",
		sky = base_colors.color6,
		teal = base16.base0F or "#919191",
		overlay = base16.base02 or "#6b6b6b",
		surface = base16.base01 or "#474747",
		base = base_colors.background,
		mantle = base_colors.background,
		surface1 = base16.base01 or "#474747",
		surface2 = base16.base02 or "#6b6b6b",
	})

	return cached_colors
end

return M
