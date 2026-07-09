local colors = require("config.stylix.core").get_colors()

local stylix = {
	normal = {
		a = { bg = colors.color4, fg = colors.background, gui = "bold" },
		b = { bg = colors.color8, fg = colors.foreground },
		c = { bg = colors.background, fg = colors.foreground },
		x = { bg = colors.color8, fg = colors.foreground },
		y = { bg = colors.color0, fg = colors.color7 },
		z = { bg = colors.color4, fg = colors.background, gui = "bold" },
	},
	insert = {
		a = { bg = colors.color2, fg = colors.background, gui = "bold" },
		b = { bg = colors.color8, fg = colors.foreground },
		c = { bg = colors.background, fg = colors.foreground },
		x = { bg = colors.color8, fg = colors.foreground },
		y = { bg = colors.color0, fg = colors.color7 },
		z = { bg = colors.color2, fg = colors.background, gui = "bold" },
	},
	command = {
		a = { bg = colors.color5, fg = colors.background, gui = "bold" },
		b = { bg = colors.color8, fg = colors.foreground },
		c = { bg = colors.background, fg = colors.foreground },
		x = { bg = colors.color8, fg = colors.foreground },
		y = { bg = colors.color0, fg = colors.color7 },
		z = { bg = colors.color5, fg = colors.background, gui = "bold" },
	},
	visual = {
		a = { bg = colors.color6, fg = colors.background, gui = "bold" },
		b = { bg = colors.color8, fg = colors.foreground },
		c = { bg = colors.background, fg = colors.foreground },
		x = { bg = colors.color8, fg = colors.foreground },
		y = { bg = colors.color0, fg = colors.color7 },
		z = { bg = colors.color6, fg = colors.background, gui = "bold" },
	},
	replace = {
		a = { bg = colors.color11, fg = colors.background, gui = "bold" },
		b = { bg = colors.color8, fg = colors.foreground },
		c = { bg = colors.background, fg = colors.foreground },
		x = { bg = colors.color8, fg = colors.foreground },
		y = { bg = colors.color0, fg = colors.color7 },
		z = { bg = colors.color11, fg = colors.background, gui = "bold" },
	},
	terminal = {
		a = { bg = colors.color2, fg = colors.background, gui = "bold" },
		b = { bg = colors.color8, fg = colors.foreground },
		c = { bg = colors.background, fg = colors.foreground },
		x = { bg = colors.color8, fg = colors.foreground },
		y = { bg = colors.color0, fg = colors.color7 },
		z = { bg = colors.color2, fg = colors.background, gui = "bold" },
	},
	inactive = {
		a = { bg = colors.color0, fg = colors.color8 },
		b = { bg = colors.color0, fg = colors.color8 },
		c = { bg = colors.color0, fg = colors.color7 },
		x = { bg = colors.color0, fg = colors.color7 },
		y = { bg = colors.color0, fg = colors.color8 },
		z = { bg = colors.color0, fg = colors.color7 },
	},
}

return stylix
