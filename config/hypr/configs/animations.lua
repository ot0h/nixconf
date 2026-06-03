------------------
---- CURVES ----
------------------

local windowtime = 1.5
local wstime = 1.8

hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })
hl.curve("easeInOutCirc", { type = "bezier", points = { { 0.85, 0 }, { 0.15, 1 } } })
hl.curve("easeInCirc", { type = "bezier", points = { { 0.55, 0 }, { 1, 0.45 } } })
hl.curve("easeOutCirc", { type = "bezier", points = { { 0, 0.55 }, { 0.45, 1 } } })

---------------------
---- ANIMATIONS ----
---------------------

hl.animation({ leaf = "global", enabled = true, speed = 2, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = windowtime * 2, bezier = "linear" })

hl.animation({ leaf = "windows", enabled = true, speed = windowtime, bezier = "quick" })
hl.animation({
	leaf = "windowsIn",
	enabled = true,
	speed = windowtime,
	bezier = "quick",
	style = "slide",
})
hl.animation({
	leaf = "windowsOut",
	enabled = true,
	speed = windowtime,
	bezier = "quick",
	style = "slide",
})

hl.animation({ leaf = "fade", enabled = true, speed = windowtime * 2, bezier = "quick" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = windowtime + 0.5, bezier = "easeInCirc" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = windowtime * 2, bezier = "easeOutCirc" })

hl.animation({ leaf = "layers", enabled = true, speed = 3, bezier = "easeOutQuint" })
hl.animation({
	leaf = "layersIn",
	enabled = true,
	speed = 2,
	bezier = "easeOutQuint",
	style = "fade",
})
hl.animation({
	leaf = "layersOut",
	enabled = true,
	speed = 1.5,
	bezier = "linear",
	style = "fade",
})

hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })

hl.animation({
	leaf = "workspaces",
	enabled = true,
	speed = wstime * 5,
	bezier = "easeInOutCirc",
	style = "slidefadevert",
})
hl.animation({
	leaf = "workspacesIn",
	enabled = true,
	speed = wstime,
	bezier = "easeInOutCirc",
	style = "slidevert",
})
hl.animation({
	leaf = "workspacesOut",
	enabled = true,
	speed = wstime,
	bezier = "easeInOutCirc",
	style = "slidevert",
})

hl.animation({
	leaf = "specialWorkspace",
	enabled = true,
	speed = wstime * 5,
	bezier = "easeInOutCirc",
	style = "fade",
})
hl.animation({
	leaf = "specialWorkspaceIn",
	enabled = true,
	speed = wstime * 2,
	bezier = "quick",
	style = "fade",
})
hl.animation({
	leaf = "specialWorkspaceOut",
	enabled = true,
	speed = wstime,
	bezier = "easeInOutCirc",
	style = "fade",
})
