---------------
---- INPUT ----
---------------

hl.config({
	input = {
		kb_layout = "latam",
		kb_variant = "",
		kb_model = "dell",
		kb_options = "",
		kb_rules = "",
		follow_mouse = 1,
		sensitivity = 0.35,
		numlock_by_default = true,

		touchpad = {
			natural_scroll = true,
			disable_while_typing = true,
			tap_to_click = true,
		},
	},
})

-- hl.gesture({
-- 	fingers = 3,
-- 	direction = "vertical",
-- 	action = "workspace",
-- })

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
hl.device({
	name = "epic-mouse-v1",
	sensitivity = -0.5,
})
