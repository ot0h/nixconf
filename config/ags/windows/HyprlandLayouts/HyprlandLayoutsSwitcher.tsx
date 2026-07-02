import { Astal, Gtk, Gdk } from 'ags/gtk4'
import app from 'ags/gtk4/app'
import { execAsync } from 'ags/process'
import { createState } from 'ags'

const { TOP, BOTTOM, LEFT, RIGHT } = Astal.WindowAnchor

type ScrollDir = 'right' | 'down'

export default function HyprlandLayoutsSwitcher(
  gdkmonitor: Gdk.Monitor,
  index: number = 0
) {
  let win: Astal.Window

  const [scrollDir, setScrollDir] = createState<ScrollDir>('right')
  const toggleScrollDir = () =>
    setScrollDir((d) => (d === 'right' ? 'down' : 'right'))

  const getActiveWorkspace = async (): Promise<{
    id: number
    name: string
  }> => {
    try {
      const specialRaw = await execAsync([
        'hyprctl',
        '-j',
        'activespecialworkspace',
      ])
      if (
        specialRaw &&
        specialRaw.trim() !== '' &&
        specialRaw.trim() !== '{}'
      ) {
        const special = JSON.parse(specialRaw)
        if (special && special.id && special.id !== 0) {
          return special
        }
      }
    } catch (_) {
      // no special workspace activo, ignorar
    }

    const normalRaw = await execAsync(['hyprctl', '-j', 'activeworkspace'])
    return JSON.parse(normalRaw)
  }

  const switchLayout = async (layout: string) => {
    win.visible = false
    try {
      const ws = await getActiveWorkspace()

      const rule =
        layout === 'scrolling'
          ? `hl.workspace_rule({ workspace = "${ws.id}", layout = "scrolling", layout_opts = { direction = "${scrollDir.get()}" } })`
          : `hl.workspace_rule({ workspace = "${ws.id}", layout = "${layout}" })`

      await execAsync(['hyprctl', 'eval', rule])

      await execAsync([
        'notify-send',
        '-u',
        'normal',
        '-i',
        'dialog-information',
        '-a',
        'AGS',
        `Layout: ${layout}${layout === 'scrolling' ? ` (${scrollDir.get()})` : ''}`,
        `Workspace: ${ws.name ?? ws.id}`,
      ])
    } catch (e) {
      execAsync(['notify-send', '-u', 'critical', 'Error layout', String(e)])
    }
  }

  const layouts = [
    {
      icon: '󰕴',
      label: 'Dwindle',
      action: () => switchLayout('dwindle'),
      isScrolling: false,
    },
    {
      icon: '󰖯',
      label: 'Master',
      action: () => switchLayout('master'),
      isScrolling: false,
    },
    {
      icon: '',
      label: 'Scrolling',
      action: () => switchLayout('scrolling'),
      isScrolling: true,
    },
    {
      icon: '󱂬',
      label: 'Monocle',
      action: () => switchLayout('monocle'),
      isScrolling: false,
    },
  ]

  let selectedIndex = 0
  let buttonRefs: Gtk.Button[] = []

  const focus = (i: number) => {
    selectedIndex = (i + layouts.length) % layouts.length
    buttonRefs[selectedIndex]?.grab_focus()
  }

  function onKey(_e: Gtk.EventControllerKey, keyval: number): boolean {
    if (keyval === Gdk.KEY_Right || keyval === Gdk.KEY_l) {
      focus(selectedIndex + 1)
      return true
    }
    if (keyval === Gdk.KEY_Left || keyval === Gdk.KEY_h) {
      focus(selectedIndex - 1)
      return true
    }
    if (keyval === Gdk.KEY_Return) {
      layouts[selectedIndex]?.action()
      return true
    }
    if (keyval === Gdk.KEY_Tab && layouts[selectedIndex]?.isScrolling) {
      toggleScrollDir()
      return true
    }
    if (keyval === Gdk.KEY_Escape || keyval === Gdk.KEY_q) {
      win.visible = false
      return true
    }
    return false
  }

  return (
    <window
      $={(self) => (win = self)}
      name={`HyprlandLayoutsSwitcher-${index}`}
      class="HyprlandLayoutsSwitcher"
      visible={false}
      gdkmonitor={gdkmonitor}
      exclusivity={Astal.Exclusivity.IGNORE}
      anchor={TOP | BOTTOM | LEFT | RIGHT}
      application={app}
      keymode={Astal.Keymode.EXCLUSIVE}
      onMap={() => focus(0)}
    >
      <Gtk.EventControllerKey onKeyPressed={onKey} />
      <box halign={Gtk.Align.CENTER} valign={Gtk.Align.CENTER} hexpand vexpand>
        <box
          class="layout-container"
          orientation={Gtk.Orientation.VERTICAL}
          spacing={24}
          halign={Gtk.Align.CENTER}
        >
          <label
            label="LAYOUT SWITCHER"
            class="layout-title"
            halign={Gtk.Align.CENTER}
          />
          <box
            orientation={Gtk.Orientation.HORIZONTAL}
            spacing={24}
            halign={Gtk.Align.CENTER}
          >
            {layouts.map(({ icon, label, action, isScrolling }, i) => (
              <box
                orientation={Gtk.Orientation.VERTICAL}
                spacing={8}
                halign={Gtk.Align.CENTER}
              >
                <button
                  $={(self) => {
                    buttonRefs[i] = self
                  }}
                  onClicked={action}
                  halign={Gtk.Align.CENTER}
                  cursor={Gdk.Cursor.new_from_name('pointer', null)}
                >
                  <Gtk.EventControllerMotion onEnter={() => focus(i)} />
                  <box
                    orientation={Gtk.Orientation.VERTICAL}
                    spacing={8}
                    halign={Gtk.Align.CENTER}
                  >
                    <overlay
                      halign={Gtk.Align.CENTER}
                      valign={Gtk.Align.CENTER}
                    >
                      <label
                        label={icon}
                        class="layout-icon"
                        halign={Gtk.Align.CENTER}
                        valign={Gtk.Align.CENTER}
                      />
                      {isScrolling && (
                        <label
                          $type="overlay"
                          class="scroll-dir-arrow"
                          label={scrollDir((d) =>
                            d === 'right' ? ' 󰜴' : ' 󰜮'
                          )}
                          halign={Gtk.Align.CENTER}
                          valign={Gtk.Align.CENTER}
                        />
                      )}
                    </overlay>
                    <label
                      label={label}
                      class="layout-label"
                      halign={Gtk.Align.CENTER}
                    />
                  </box>
                </button>
              </box>
            ))}
          </box>
        </box>
      </box>
    </window>
  )
}
