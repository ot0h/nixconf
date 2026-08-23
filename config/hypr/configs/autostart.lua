-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function()
	hl.exec_cmd("hyprpaper & clipse -listen & hypridle")

	hl.exec_cmd([[
		sh -c 'watchexec -r \
		--watch ~/.config/ags \
		--watch ~/.config/stylix \
		-- "ags quit; ags run & ags request reload; hyprctl reload"'
	]])

	hl.exec_cmd("systemctl --user start hyprland-session.target")
end)

hl.on("hyprland.shutdown", function()
	os.execute("systemctl --user stop graphical-session.target")
end)
