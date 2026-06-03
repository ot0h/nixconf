local M = {}
local core = require('pywal.core')
local highlights = require('pywal.highlights')
local config = require('pywal.config')

-- Lazy load colors on first use to avoid sourcing wal file at startup
local colors_loaded = false

-- Expose config for user customization
-- Usage in init.lua:
--   require('pywal').italic_enabled = false
--   require('pywal').bold_override = { "Comment", "String" }
M.italic_enabled = config.italic_enabled
M.bold_override = config.bold_override
M.font_custom = config.font_custom

function M.setup()
  -- Load colors lazily on setup
  local colors = core.get_colors()
  vim.opt.termguicolors = true
  highlights.highlight_all(colors)
  colors_loaded = true

  -- Re-apply highlights after plugins load (treesitter, etc)
  vim.defer_fn(function()
    local c = core.get_colors()
    highlights.refresh(c)
  end, 200)
end

-- Expose reload for when pywal regenerates
function M.reload()
  core.reload()
  local colors = core.get_colors()
  highlights.refresh(colors)
end

-- Re-apply highlights when entering a buffer (covers treesitter highlighting)
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    vim.defer_fn(function()
      local colors = core.get_colors()
      highlights.refresh(colors)
    end, 50)
  end,
})

return M
