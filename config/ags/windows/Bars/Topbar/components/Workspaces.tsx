import { Gdk, Gtk } from 'ags/gtk4'
import { execAsync } from 'ags/process'
import Hyprland from 'gi://AstalHyprland'
import { createBinding, For, With } from 'gnim'

export default function Workspaces() {
  const hypr = Hyprland.get_default()

  const focusWorkspaces = createBinding(hypr, 'focusedWorkspace')

  const workspaces = createBinding(hypr, 'workspaces').as(
    (ws: Hyprland.Workspace[]) => ws.sort((a, b) => a.id - b.id)
  )

  return (
    <box class="Topbar-Workspaces" orientation={Gtk.Orientation.HORIZONTAL}>
      <With value={focusWorkspaces}>
        {(fw) => (
          <box
            class="Topbar-workspaces"
            orientation={Gtk.Orientation.HORIZONTAL}
          >
            <For each={workspaces}>
              {(w: Hyprland.Workspace) => {
                const isActive = fw.id === w.id

                let classNames = ' wButton'
                if (isActive) classNames += ' aButton'

                function onClick() {
                  execAsync([
                    'hyprctl',
                    'eval',
                    `hl.dispatch(hl.dsp.focus({workspace = ${w.id}}))`,
                  ])
                }

                return (
                  <button
                    cursor={Gdk.Cursor.new_from_name('pointer', null)}
                    class={focusWorkspaces.as((fw) =>
                      fw.id === w.id ? 'wButton aButton' : 'wButton'
                    )}
                    onClicked={onClick}
                    focusOnClick={false}
                    halign={Gtk.Align.CENTER}
                  />
                )
              }}
            </For>
          </box>
        )}
      </With>
    </box>
  )
}
