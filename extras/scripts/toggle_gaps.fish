#!/usr/bin/env fish

set WORKSPACE_ID (hyprctl activeworkspace -j | jq '.id')

if test "$WORKSPACE_ID" -eq 1
    notify-send -u normal -i dialog-warning -a Hyprland "¡Neles, compa!" "En el Workspace 1 no se tocan los gaps xd"
    exit 0
end

set STATE_FILE "/tmp/hypr_gaps_$WORKSPACE_ID"
set GAPS_IN 5
set GAPS_OUT 20

if test -f $STATE_FILE
    hyprctl keyword workspace "$WORKSPACE_ID, gapsin:$GAPS_IN, gapsout:$GAPS_OUT, border:true"
    rm $STATE_FILE
    echo "Gaps restaurados en W:$WORKSPACE_ID"
else
    hyprctl keyword workspace "$WORKSPACE_ID, gapsin:0, gapsout:0, border:false"
    touch $STATE_FILE
    echo "Gaps eliminados en W:$WORKSPACE_ID"
end
