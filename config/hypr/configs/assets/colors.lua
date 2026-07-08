-- ~/.config/hypr/colors.lua

local M = {}

local palette = dofile(os.getenv("HOME") .. "/.config/stylix-colors/palette.lua")

M[0] = palette.base00
M[1] = palette.base08
M[2] = palette.base0B
M[3] = palette.base0A
M[4] = palette.base0D
M[5] = palette.base0E
M[6] = palette.base0C
M[7] = palette.base05
M[8] = palette.base03
M[9] = palette.base08
M[10] = palette.base0B
M[11] = palette.base0A
M[12] = palette.base0D
M[13] = palette.base0E
M[14] = palette.base0C
M[15] = palette.base07

function M.gradient(a, b, angle)
	return {
		colors = {
			"rgb(" .. M[a]:sub(2) .. ")",
			"rgb(" .. M[b]:sub(2) .. ")",
			"rgb(" .. M[a]:sub(2) .. ")",
		},
		angle = angle or 45,
	}
end

function M.with_alpha(idx, alpha)
	return "rgba(" .. M[idx]:sub(2) .. alpha .. ")"
end

return M
