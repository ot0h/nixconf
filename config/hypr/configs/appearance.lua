-----------------------
---- LOOK AND FEEL ----
-----------------------
local c = require("configs.assets.colors")

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
	general = {
		gaps_in = 5,
		gaps_out = 5,

		border_size = 1,

		col = {
			active_border = { colors = { c[11], c[13], c[11] }, angle = 10 },
			inactive_border = c[0],
		},

		-- Set to true to enable resizing windows by clicking and dragging on borders and gaps
		resize_on_border = false,

		-- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
		allow_tearing = false,

		layout = "dwindle",
	},

	decoration = {
		rounding = 0,
		rounding_power = 3,

		active_opacity = 1.0,
		inactive_opacity = 0.9,

		shadow = {
			enabled = true,
			range = 10,
			render_power = 10,
			color = c[0],
		},

		blur = {
			enabled = true,
			size = 1,
			passes = 0,
			contrast = true,
			-- vibrancy = 0.1696,
		},
	},

	animations = {
		enabled = true,
	},
})
