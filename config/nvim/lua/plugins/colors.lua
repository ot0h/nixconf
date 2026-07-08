local palette = dofile(vim.fn.expand("~/.config/stylix-colors/palette.lua"))

require("mini.base16").setup({
	palette = palette,
	use_cterm = true,
	plugins = { default = true },
})
