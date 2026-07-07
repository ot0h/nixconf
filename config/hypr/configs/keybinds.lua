local programs = require("configs.programs")

local terminal = programs.terminal
local fileManager = programs.fileManager
local menu = programs.menu
local browser = programs.browser

local mainMod = "SUPER"

---------------------
---- SUBMAPS      ----
---------------------

local function bind_exec(key, cmd)
	hl.bind(key, function()
		hl.dispatch(hl.dsp.exec_cmd(cmd))
		hl.dispatch(hl.dsp.submap("reset"))
	end)
end

hl.bind(mainMod .. " + R", hl.dsp.submap("resize"))
hl.bind(mainMod .. " + M", hl.dsp.submap("move"))
hl.bind(mainMod .. " + Return", hl.dsp.submap("launch"))

hl.define_submap("launch", function()
	hl.bind("Return", hl.dsp.exec_cmd(terminal))
	bind_exec("CONTROL+Return", terminal .. " --title=float-terminal")
	bind_exec("SHIFT+Return", terminal .. " -e tmux")
	bind_exec("v", terminal .. " --title=wiremix -e wiremix")
	bind_exec("n", terminal .. " --title=gazelle -e gazelle")
	bind_exec("b", browser)
	bind_exec("SHIFT+B", browser .. " --private-window")
	bind_exec("e", terminal .. " -e yazi")
	bind_exec("SHIFT+E", fileManager)
	bind_exec("w", "ags request toggle WallpaperPicker")
	bind_exec("m", terminal .. " -e btop")
	bind_exec("d", terminal .. " --title=bluetui -e bluetui")
	bind_exec("l", "localsend_app")
	hl.bind("Escape", hl.dsp.submap("reset"))
	hl.bind("CONTROL+C", hl.dsp.submap("reset"))
	hl.bind("Q", hl.dsp.submap("reset"))
end)

hl.define_submap("resize", function()
	local directionLayoutScrolling = hl.get_config("scrolling.direction")
	local currentLayout = hl.get_active_workspace() and hl.get_active_workspace().tiled_layout

	-- Reducir Izquierda
	hl.bind("H", function()
		if currentLayout == "scrolling" and directionLayoutScrolling == "right" then
			hl.dispatch(hl.dsp.layout("colresize -col"))
		else
			hl.dispatch(hl.dsp.window.resize({ x = -40, y = 0, relative = true }))
		end
	end, { repeating = true })

	-- Reducir Derecha
	hl.bind("L", function()
		if currentLayout == "scrolling" and directionLayoutScrolling == "right" then
			hl.dispatch(hl.dsp.layout("colresize +col"))
		else
			hl.dispatch(hl.dsp.window.resize({ x = 40, y = 0, relative = true }))
		end
	end, { repeating = true })

	--Reducir Arriba
	hl.bind("K", hl.dsp.window.resize({ x = 0, y = -40, relative = true }), { repeating = true })

	--Reducir Abajo
	hl.bind("J", hl.dsp.window.resize({ x = 0, y = 40, relative = true }), { repeating = true })

	hl.bind("M", hl.dsp.submap("move"))
	hl.bind("Escape", hl.dsp.submap("reset"))
	hl.bind("CONTROL+C", hl.dsp.submap("reset"))
	hl.bind("Q", hl.dsp.submap("reset"))
end)

hl.define_submap("move", function()
	hl.bind("H", hl.dsp.window.move({ x = -40, y = 0, relative = true }), { repeating = true })
	hl.bind("L", hl.dsp.window.move({ x = 40, y = 0, relative = true }), { repeating = true })
	hl.bind("K", hl.dsp.window.move({ x = 0, y = -40, relative = true }), { repeating = true })
	hl.bind("J", hl.dsp.window.move({ x = 0, y = 40, relative = true }), { repeating = true })
	hl.bind("R", hl.dsp.submap("resize"))
	hl.bind("Escape", hl.dsp.submap("reset"))
	hl.bind("CONTROL+C", hl.dsp.submap("reset"))
	hl.bind("Q", hl.dsp.submap("reset"))
end)

---------------------
---- GENERALES    ----
---------------------

hl.bind(mainMod .. " + Q", hl.dsp.window.close())

hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.window.kill())

hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())

hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(menu))

hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("ags request toggle Panel"))

hl.bind(mainMod .. " + CONTROL + SPACE", hl.dsp.exec_cmd("ags request toggle HyprlandLayoutsSwitcher"))

hl.bind(mainMod .. " + SHIFT + M", hl.dsp.exec_cmd("ags request toggle PowerMenu"))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("ags request toggle Notification"))

hl.bind(mainMod .. " + C", hl.dsp.exec_cmd(terminal .. " --title=clipse -e clipse"))

hl.bind(mainMod .. " + S", function()
	local currentLayout = hl.get_active_workspace() and hl.get_active_workspace().tiled_layout

	if currentLayout == "scrolling" then
		hl.dispatch(hl.dsp.layout("fit all"))
	else
		hl.dispatch(hl.dsp.layout("togglesplit"))
	end
end)

hl.bind(
	mainMod .. " + W",
	hl.dsp.exec_cmd("ags request toggle-all Sidebar Marco-margen-arriba Marco-margen-abajo Marco-margen-derecho")
)

hl.bind("Print", hl.dsp.exec_cmd("ags request toggle Screenshot"))

hl.bind(mainMod .. " + SPACE", function()
	local currentLayout = hl.get_active_workspace() and hl.get_active_workspace().tiled_layout

	if currentLayout == "scrolling" then
		hl.dispatch(hl.dsp.layout("consume_or_expel next"))
	else
		hl.dispatch(hl.dsp.window.float())
	end
end)

hl.bind(mainMod .. " + SHIFT + SPACE", function()
	local currentLayout = hl.get_active_workspace() and hl.get_active_workspace().tiled_layout

	if currentLayout == "scrolling" then
		hl.dispatch(hl.dsp.layout("fit visible"))
	end
end)

hl.bind(mainMod .. " + A", function()
	local estado = hl.get_config("animations.enabled")
	local nuevoEstado = not estado

	hl.config({ animations = { enabled = nuevoEstado } })

	hl.dispatch(
		hl.dsp.exec_cmd(
			string.format(
				"notify-send -u normal -i dialog-information -a Hyprland 'Animaciones: %s'",
				nuevoEstado and "ON" or "OFF"
			)
		)
	)
end)

---------------------
---- FOCUS        ----
---------------------

-- Focs Derecha
hl.bind(mainMod .. " + L", function()
	local currentLayout = hl.get_active_workspace().tiled_layout

	if currentLayout == "monocle" then
		hl.dispatch(hl.dsp.layout("cyclenext"))
	elseif currentLayout == "scrolling" then
		hl.dispatch(hl.dsp.layout("focus r"))
	else
		hl.dispatch(hl.dsp.focus({ direction = "right" }))
	end
end)

-- Focus Izquierda
hl.bind(mainMod .. " + H", function()
	local currentLayout = hl.get_active_workspace().tiled_layout

	if currentLayout == "monocle" then
		hl.dispatch(hl.dsp.layout("cycleprev"))
	elseif currentLayout == "scrolling" then
		hl.dispatch(hl.dsp.layout("focus l"))
	else
		hl.dispatch(hl.dsp.focus({ direction = "left" }))
	end
end)

-- Focus Arriba
hl.bind(mainMod .. " + K", function()
	local currentLayout = hl.get_active_workspace().tiled_layout
	if currentLayout == "scrolling" then
		hl.dispatch(hl.dsp.layout("focus u"))
	else
		hl.dispatch(hl.dsp.focus({ direction = "up" }))
	end
end)

-- Focus Abajo
hl.bind(mainMod .. " + J", function()
	local currentLayout = hl.get_active_workspace().tiled_layout
	if currentLayout == "scrolling" then
		hl.dispatch(hl.dsp.layout("focus d"))
	else
		hl.dispatch(hl.dsp.focus({ direction = "down" }))
	end
end)

---------------------
---- SWAP         ----
---------------------

hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.swap({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.swap({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.swap({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.swap({ direction = "down" }))

---------------------
---- WORKSPACES   ----
---------------------

for i = 1, 10 do
	local key = i % 10
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

---------------------
---- MOUSE        ----
---------------------

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

---------------------
---- MEDIA        ----
---------------------

hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

---------------------
---- SCRIPTS      ----
---------------------

hl.bind(mainMod .. " + SHIFT + I", hl.dsp.exec_cmd("fish -c ~/scripts/terminal_opacity.fish"))
