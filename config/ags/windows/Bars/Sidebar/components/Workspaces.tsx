import { Gtk } from "ags/gtk4"
import Hyprland from "gi://AstalHyprland?version=0.1"
import { createBinding, For, With } from "gnim"

export default function Workspaces() {
  const hypr = Hyprland.get_default()
  const focusWorkspaces = createBinding(hypr, "focusedWorkspace")

  const workspaces = createBinding(hypr, "workspaces").as(
    (ws: Hyprland.Workspace[]) => ws.sort((a, b) => a.id - b.id),
  )
  return (
    <box class="workspaces-container">
      <With value={focusWorkspaces}>
        {(fw) => (
          <box class="workspaces" orientation={1}>
            <For each={workspaces}>
              {(w: Hyprland.Workspace) => {
                const isActive = fw.id === w.id

                let classNames = " wButton"
                if (isActive) classNames += " aButton"

                function onClick() {
                  hypr.dispatch("workspace", w.id.toString())
                }

                return (
                  <button
                    class={classNames}
                    onClicked={onClick}
                    focusOnClick={false}
                    hexpand
                    valign={Gtk.Align.CENTER}
                  >
                    <label label={String(w.id)} />
                  </button>
                )
              }}
            </For>
          </box>
        )}
      </With>
    </box>
  )
}
