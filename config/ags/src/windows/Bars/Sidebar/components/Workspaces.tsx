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
    <box class="workspaces-container">
      <With value={focusWorkspaces}>
        {(fw) => (
          <box class="workspaces" orientation={1}>
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
