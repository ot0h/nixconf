--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful

local suppressMaximizeRule = hl.window_rule({
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

-- Hyprland-run windowrule
hl.window_rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },

	move = "20 monitor_h-120",
	float = true,
})

hl.window_rule({
	name = "windowrule-1",
	match = { class = ".*" },
	suppress_event = "maximize",
})

hl.window_rule({
	name = "windowrule-2",
	match = { class = "^$", title = "^$", xwayland = true, float = true, fullscreen = false, pin = false },
	no_focus = true,
})

hl.window_rule({ name = "windowrule-3", match = { title = "^YaziSelector$" }, float = true })
hl.window_rule({
	name = "windowrule-4",
	match = { class = "^(kitty)$", title = "^(YaziSelector)$" },
	size = "(monitor_w*0.8) (monitor_h*0.9)",
})

-- hl.window_rule({ name = "windowrule-7", match = { class = "^(Spotify)$" }, opacity = "0.85 0.85" })

-- Authentication dialog
hl.window_rule({
	name = "windowrule-14",
	match = { title = "^(Authentication Required)$" },
	float = true,
	center = true,
})

-- VSCodium popups
hl.window_rule({
	name = "windowrule-15",
	match = { class = "(codium|codium-url-handler|VSCodium)", title = "negative:(.*codium.*|.*VSCodium.*)" },
	float = true,
})

-- Heroic popups
hl.window_rule({
	name = "windowrule-16",
	match = { class = "^(com.heroicgameslauncher.hgl)$", title = "negative:(Heroic Games Launcher)" },
	float = true,
})

-- Steam popups
hl.window_rule({
	name = "windowrule-17",
	match = { class = "^([Ss]team)$", title = "negative:^([Ss]team)$" },
	float = true,
})

-- Thunar popups
hl.window_rule({
	name = "windowrule-18",
	match = { class = "([Tt]hunar)", title = "negative:(.*[Tt]hunar.*)" },
	float = true,
})

-- File dialogs
hl.window_rule({
	name = "windowrule-19",
	match = { title = "^(Add Folder to Workspace)$" },
	float = true,
	size = "(monitor_w*0.7) (monitor_h*0.6)",
	center = true,
})
hl.window_rule({
	name = "windowrule-20",
	match = { title = "^(Save As)$" },
	float = true,
	size = "(monitor_w*0.7) (monitor_h*0.6)",
	center = true,
})
hl.window_rule({
	name = "windowrule-21",
	match = { initial_title = "(Open Files)" },
	float = true,
	size = "(monitor_w*0.7) (monitor_h*0.6)",
})

-- NetBeans
hl.window_rule({
	name = "windowrule-22",
	match = { class = "^Apache NetBeans IDE.*$" },
	float = true,
	center = true,
	no_initial_focus = true,
})

-- TUI apps (wiremix, gazelle, bluetui, wallpaper-switcher)
hl.window_rule({
	name = "windowrule-23",
	match = { title = "^(wiremix)" },
	float = true,
	center = true,
	size = "(monitor_w*0.7) (monitor_h*0.6)",
})

hl.window_rule({
	name = "windowrule-12",
	match = { title = "^(YaziFloat)" },
	size = "(monitor_w*0.7) (monitor_h*0.8)",
	center = true,
	float = true,
})

hl.window_rule({
	name = "clipse",
	match = { title = "^(clipse)" },
	size = "(monitor_w*0.7) (monitor_h*0.8)",
	center = true,
	float = true,
})

hl.window_rule({
	name = "windowrule-13",
	match = { class = "^(localsend_app)" },
	size = "(monitor_w*0.7) (monitor_h*0.6)",
	float = true,
	center = true,
})

hl.window_rule({
	name = "gazelle",
	match = { title = "^(gazelle)" },
	float = true,
	center = true,
	size = "(monitor_w*0.6) (monitor_h*0.8)",
})

hl.window_rule({
	name = "bluetui",
	match = { title = "^(bluetui)" },
	float = true,
	center = true,
	size = "(monitor_w*0.5) (monitor_h*0.5)",
})

hl.window_rule({
	name = "wallpaper",
	match = { title = "^(wallpaper-switcher)" },
	float = true,
	center = true,
	size = "(monitor_w*0.4) (monitor_h*0.4)",
})

-- termfilechooser
hl.window_rule({
	name = "termfilechooser",
	match = { title = "^(termfilechooser)$" },
	float = true,
	size = "(monitor_w*0.7) (monitor_h*0.6)",
	center = true,
	opacity = "1.0",
})

-- JetBrains / Android Studio
hl.window_rule({ name = "Jetbrains", match = { class = "^(jetbrains-studio)$" }, float = true, center = true })
hl.window_rule({ name = "AndroidStudio", match = { title = "^(.*Android Studio.*)$" }, float = false })

-- fix-xwayland-drags (duplicado explícito de windowrule-2)
hl.window_rule({
	name = "fix-xwayland-drags",
	match = { class = "^$", title = "^$", xwayland = true, float = true, fullscreen = false, pin = false },
	no_focus = true,
})

-- float-terminal
hl.window_rule({
	name = "float-terminal",
	match = { title = "^(float-terminal)" },
	float = true,
	size = "(monitor_w*0.7) (monitor_h*0.7)",
})

-- graphito
hl.window_rule({ name = "graphito", match = { title = "^(graphito)" }, float = true, center = true })
