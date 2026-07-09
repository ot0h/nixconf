local colors = require("config.stylix.core").get_colors()

local stylix = {
	normal = {
		a = { bg = colors.blue, fg = colors.background, gui = "bold" },
		b = { bg = colors.color3, fg = colors.foreground },
		c = { bg = colors.background, fg = colors.foreground },
		x = { bg = colors.color3, fg = colors.foreground },
		y = { bg = colors.color2, fg = colors.color7 },
		z = { bg = colors.blue, fg = colors.background, gui = "bold" },
	},
	insert = {
		a = { bg = colors.green, fg = colors.background, gui = "bold" },
		b = { bg = colors.color4, fg = colors.foreground },
		c = { bg = colors.background, fg = colors.foreground },
		x = { bg = colors.color4, fg = colors.foreground },
		y = { bg = colors.color2, fg = colors.color7 },
		z = { bg = colors.green, fg = colors.background, gui = "bold" },
	},
	command = {
		a = { bg = colors.purple, fg = colors.background, gui = "bold" },
		b = { bg = colors.green, fg = colors.background },
		c = { bg = colors.background, fg = colors.foreground },
		x = { bg = colors.green, fg = colors.background },
		y = { bg = colors.color2, fg = colors.color7 },
		z = { bg = colors.purple, fg = colors.background, gui = "bold" },
	},
	visual = {
		a = { bg = colors.cyan, fg = colors.background, gui = "bold" },
		b = { bg = colors.purple, fg = colors.background },
		c = { bg = colors.background, fg = colors.foreground },
		x = { bg = colors.purple, fg = colors.background },
		y = { bg = colors.color2, fg = colors.color7 },
		z = { bg = colors.cyan, fg = colors.background, gui = "bold" },
	},
	replace = {
		a = { bg = colors.yellow, fg = colors.background, gui = "bold" },
		b = { bg = colors.red, fg = colors.background },
		c = { bg = colors.background, fg = colors.foreground },
		x = { bg = colors.red, fg = colors.background },
		y = { bg = colors.color2, fg = colors.color7 },
		z = { bg = colors.yellow, fg = colors.background, gui = "bold" },
	},
	terminal = {
		a = { bg = colors.orange, fg = colors.background, gui = "bold" },
		b = { bg = colors.cyan, fg = colors.background },
		c = { bg = colors.background, fg = colors.foreground },
		x = { bg = colors.cyan, fg = colors.background },
		y = { bg = colors.color2, fg = colors.color7 },
		z = { bg = colors.orange, fg = colors.background, gui = "bold" },
	},
	inactive = {
		a = { bg = colors.color1, fg = colors.color3 },
		b = { bg = colors.color1, fg = colors.color3 },
		c = { bg = colors.background, fg = colors.color3 },
		x = { bg = colors.background, fg = colors.color3 },
		y = { bg = colors.color1, fg = colors.color3 },
		z = { bg = colors.color1, fg = colors.color3 },
	},
}

return stylix
