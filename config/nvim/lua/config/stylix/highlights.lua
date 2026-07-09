local M = {}
local config = require("config.stylix.config")

local applied = false

local function apply_config(group, props)
	local cfg_italic = config.italic_enabled
	local cfg_bold_override = config.bold_override or {}

	local result = vim.deepcopy(props)

	if not props.italic then
		return result
	end

	local is_bold_override = false
	for _, v in ipairs(cfg_bold_override) do
		if group == v then
			is_bold_override = true
			break
		end
	end

	if cfg_italic == false then
		result.italic = false
		result.bold = is_bold_override
	else
		result.italic = true
		result.bold = false
	end

	return result
end

function M.highlight_all(colors)
	if applied then
		return
	end

	local base_highlights = config.highlights_base(colors)
	for group, properties in pairs(base_highlights) do
		local transformed = apply_config(group, properties)
		vim.api.nvim_set_hl(0, group, transformed)
	end

	applied = true
end

function M.refresh(colors)
	applied = false
	M.highlight_all(colors)
end

return M
