local M = {}
local config = require('pywal.config')

-- Cache para evitar re-aplicar highlights innecesariamente
local applied = false

-- Transformar properties basado en configuración (LEE directamente de config cada vez)
local function apply_config(group, props)
  -- LEER la config directamente cada vez que se aplica
  local cfg_italic = config.italic_enabled
  local cfg_bold_override = config.bold_override or {}

  local result = vim.deepcopy(props)

  -- No alterar si no tiene italic configurado originalmente
  if not props.italic then
    return result
  end

  -- Si está en bold_override, usar bold en vez de italic (solo cuando italic deshabilitado)
  local is_bold_override = false
  for _, v in ipairs(cfg_bold_override) do
    if group == v then
      is_bold_override = true
      break
    end
  end

  if cfg_italic == false then
    -- Italic DESHABILITADO: perder italic
    result.italic = false
    -- Los de bold_override usan bold, los demás no
    result.bold = is_bold_override
  else
    -- Italic HABILITADO: TODO el mundo usa italic
    result.italic = true
    result.bold = false
  end

  return result
end

function M.highlight_all(colors)
  if applied then return end

  local base_highlights = config.highlights_base(colors)
  for group, properties in pairs(base_highlights) do
    local transformed = apply_config(group, properties)
    vim.api.nvim_set_hl(0, group, transformed)
  end

  applied = true
end

-- Force reapply highlights (useful after pywal reload)
function M.refresh(colors)
  applied = false
  M.highlight_all(colors)
end

return M
