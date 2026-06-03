local M = {}

-- Cache for colors to avoid re-sourcing the wal file on every call
local cached_colors = nil

--- Get colors from pywal cache
--- Only sources the wal file once, then returns cached values
function M.get_colors()
  if cached_colors then
    return cached_colors
  end

  -- Ensure wal colors are loaded
  -- Note: pywal saves to ~/.cache/wal, not nvim's cache directory
  local wal_file = vim.fn.expand("~/.cache/wal/colors-wal.vim")
  if vim.fn.filereadable(wal_file) == 1 then
    vim.cmd("source " .. wal_file)
  end

  local base_colors = {
    background = vim.g.background,
    foreground = vim.g.foreground,
    cursor = vim.g.cursor,
    color0 = vim.g.color0,
    color1 = vim.g.color1,
    color2 = vim.g.color2,
    color3 = vim.g.color3,
    color4 = vim.g.color4,
    color5 = vim.g.color5,
    color6 = vim.g.color6,
    color7 = vim.g.color7,
    color8 = vim.g.color8,
    color9 = vim.g.color9,
    color10 = vim.g.color10,
    color11 = vim.g.color11,
    color12 = vim.g.color12,
    color13 = vim.g.color13,
    color14 = vim.g.color14,
    color15 = vim.g.color15,
  }

  -- Add computed colors that don't exist in pywal but are used in config.lua
  cached_colors = vim.tbl_extend("force", base_colors, {
    -- Aliases for common pywal colors
    red = base_colors.color1,      -- often used for errors
    yellow = base_colors.color3,  -- often used for warnings
    green = base_colors.color2,   -- often used for success
    blue = base_colors.color4,   -- often used for info
    purple = base_colors.color5, -- often used for hints
    orange = base_colors.color11,
    cyan = base_colors.color6,
    -- Additional semantic colors commonly used
    rosewater = base_colors.color7,
    sky = base_colors.color6,
    teal = base_colors.color5,
    overlay = base_colors.color8,
    surface = base_colors.background,
    base = base_colors.background,
    mantle = base_colors.background,
    surface1 = base_colors.color0,
    surface2 = base_colors.color8,
  })

  return cached_colors
end

--- Force reload colors (useful when pywal regenerates the theme)
function M.reload()
  cached_colors = nil
  return M.get_colors()
end

return M
