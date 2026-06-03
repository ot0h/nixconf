-- =============================================================================
-- colors.lua — Carga dinámica de colores generados por pywal16
-- Lugar: ~/.config/hypr/colors.lua
--
-- Uso en hyprland.lua:
--   local c = require("colors")
--   col.active_border = { colors = { c[11], c[13], c[11] }, angle = 45 }
-- =============================================================================

local M = {}

-- Ruta del archivo generado por pywal16
-- pywal escribe: $color0=rgba(xxxxxxee)
local PYWAL_FILE = os.getenv("HOME") .. "/.cache/wal/colors-hyprland.conf"

-- ------------------------------------------------------------------ --
-- Parsea el archivo y devuelve una tabla indexada 0..15              --
-- Cada valor es una cadena lista para usar en hl.config()            --
-- Ejemplo: c[0] = "rgba(1a1a2eee)"                                   --
-- ------------------------------------------------------------------ --
local function parse_pywal(path)
	local colors = {}

	local file, err = io.open(path, "r")
	if not file then
		-- Si pywal aún no corrió, usamos fallback neutro para no romper Hyprland
		hl.notification({
			text = "[colors.lua] No se encontró " .. path .. " — usando colores de fallback.\n" .. (err or ""),
			timeout = 5000,
			color = "rgba(ff5555ee)",
		})
		return nil
	end

	for line in file:lines() do
		-- Formato pywal: $color0=rgba(1a1a2eee)
		local idx, value = line:match("%$color(%d+)%s*=%s*(.+)")
		if idx and value then
			colors[tonumber(idx)] = value:gsub("%s+", "") -- quitar espacios extras
		end
	end

	file:close()
	return colors
end

-- ------------------------------------------------------------------ --
-- Fallback: paleta oscura neutra si pywal no existe todavía          --
-- ------------------------------------------------------------------ --
local FALLBACK = {
	[0] = "rgba(1e1e2eee)",
	[1] = "rgba(f38ba8ee)",
	[2] = "rgba(a6e3a1ee)",
	[3] = "rgba(f9e2afee)",
	[4] = "rgba(89b4faee)",
	[5] = "rgba(cba4f7ee)",
	[6] = "rgba(89dcebee)",
	[7] = "rgba(cdd6f4ee)",
	[8] = "rgba(585b70ee)",
	[9] = "rgba(f38ba8ee)",
	[10] = "rgba(a6e3a1ee)",
	[11] = "rgba(f9e2afee)",
	[12] = "rgba(89b4faee)",
	[13] = "rgba(cba4f7ee)",
	[14] = "rgba(89dcebee)",
	[15] = "rgba(ffffffff)",
}

-- ------------------------------------------------------------------ --
-- Carga inicial                                                        --
-- ------------------------------------------------------------------ --
local parsed = parse_pywal(PYWAL_FILE)
local colors = parsed or FALLBACK

-- Exponer indexado por número (0–15)
for i = 0, 15 do
	M[i] = colors[i] or FALLBACK[i]
end

-- ------------------------------------------------------------------ --
-- Recarga en vivo cuando pywal regenera los colores                  --
-- Escucha el evento config.reloaded para volver a parsear            --
-- ------------------------------------------------------------------ --
hl.on("config.reloaded", function()
	local fresh = parse_pywal(PYWAL_FILE)
	if fresh then
		for i = 0, 15 do
			M[i] = fresh[i] or FALLBACK[i]
		end
	end
end)

-- ------------------------------------------------------------------ --
-- Helpers de conveniencia                                             --
-- ------------------------------------------------------------------ --

--- Devuelve el color como gradient de dos stops para active_border
--- @param a number índice del color principal
--- @param b number índice del color secundario
--- @param angle? number ángulo en grados (default 45)
function M.gradient(a, b, angle)
	return { colors = { M[a], M[b], M[a] }, angle = angle or 45 }
end

--- Devuelve el color con opacidad personalizada (sobreescribe el alpha)
--- @param idx number índice 0–15
--- @param alpha string dos hex chars, ej. "ff", "aa", "55"
function M.with_alpha(idx, alpha)
	-- El formato de pywal es rgba(rrggbbaa), reemplazamos los últimos 2 chars antes del ')'
	local base = M[idx]
	-- Reemplaza los últimos dos chars hex antes del cierre de paréntesis
	return base:gsub("(%x%x)%)$", alpha .. ")")
end

return M
