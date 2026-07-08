-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function()
	hl.exec_cmd("hyprpaper & clipse -listen & hypridle")

	hl.exec_cmd([[
		sh -c 'watchexec -r \
		--watch ~/.config/ags \
		--watch ~/.cache/wal/colors.css \
		-- "ags quit; ags run & ags request reload; hyprctl reload"'
	]])
end)
