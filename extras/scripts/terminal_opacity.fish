#!/usr/bin/env fish

set OPACITY_FILE "/tmp/kitty-opacity.conf"
set ACTIVE_CLASS (hyprctl activewindow -j | jq -r '.class')

if test "$ACTIVE_CLASS" = kitty
    if test -f "$OPACITY_FILE" && grep -q "1.0" "$OPACITY_FILE"
        echo "background_opacity 0.8" >$OPACITY_FILE
    else
        echo "background_opacity 1.0" >$OPACITY_FILE
    end
    pkill -SIGUSR1 kitty
end
