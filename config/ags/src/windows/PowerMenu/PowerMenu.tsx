import { Gtk, Gdk } from 'ags/gtk4'
import { execAsync } from 'ags/process'
import Astal from 'gi://Astal?version=4.0'
import app from 'ags/gtk4/app'

export default function PowerMenu(gdkmonitor: Gdk.Monitor, index: number = 0) {
  let buttonRefs: Gtk.Button[] = []
  let win: Astal.Window

  const botones = [
    {
      icon: '󰐥',
      action: () => execAsync('systemctl poweroff').catch(console.log),
    },
    {
      icon: '󰜉',
      action: () => execAsync('systemctl reboot').catch(console.log),
    },
    {
      icon: '󰌾',
      action: () => execAsync('ags request lock').catch(console.log),
    },
    {
      icon: '󰍃',
      action: () => {
        execAsync('hyprctl dispatch exit').catch(console.log)
        execAsync('pkill ags').catch(console.log)
      },
    },
    {
      icon: '󰤄',
      action: () => execAsync('systemctl suspend').catch(console.log),
    },
  ]

  let middleIndex = Math.floor(botones.length / 2)
  let selectedIndex = middleIndex

  const focus = (index: number) => {
    selectedIndex = (index + botones.length) % botones.length
    buttonRefs[selectedIndex]?.grab_focus()
  }

  function onKey(_source: Gtk.EventControllerKey, keyval: number) {
    if (keyval === Gdk.KEY_Right || keyval === Gdk.KEY_l)
      focus(selectedIndex + 1)
    if (keyval === Gdk.KEY_Left || keyval === Gdk.KEY_h)
      focus(selectedIndex - 1)
    if (keyval === Gdk.KEY_Return) botones[selectedIndex]?.action()
    if (keyval === Gdk.KEY_Escape || keyval === Gdk.KEY_q) {
      win.visible = false
      focus(selectedIndex)
    }
  }

  return (
    <window
      $={(self) => (win = self)}
      name={`PowerMenu-${index}`}
      class="PowerMenuW"
      gdkmonitor={gdkmonitor}
      exclusivity={Astal.Exclusivity.IGNORE}
      application={app}
      keymode={Astal.Keymode.EXCLUSIVE}
      widthRequest={200}
      heightRequest={120}
      onMap={() => focus(selectedIndex)}
    >
      <Gtk.EventControllerKey onKeyPressed={onKey} />
      <Gtk.EventControllerScroll
        flags={Gtk.EventControllerScrollFlags.BOTH_AXES}
        onScroll={(_self, dx, dy) => {
          if (dy > 0 || dx > 0) focus(selectedIndex + 1)
          if (dy < 0 || dx < 0) focus(selectedIndex - 1)
        }}
      />
      <revealer
        onMap={(self) => (self.revealChild = true)}
        onUnmap={(self) => (self.revealChild = false)}
        transitionType={Gtk.RevealerTransitionType.CROSSFADE}
        transitionDuration={200}
      >
        <box
          halign={Gtk.Align.CENTER}
          valign={Gtk.Align.CENTER}
          hexpand
          vexpand
        >
          <box
            class="container-box"
            orientation={Gtk.Orientation.HORIZONTAL}
            spacing={40}
            halign={Gtk.Align.CENTER}
          >
            {botones.map(({ icon, action }, i) => (
              <button
                cursor={Gdk.Cursor.new_from_name('pointer', null)}
                $={(self) => {
                  buttonRefs[i] = self
                  if (i === middleIndex) self.grab_focus()
                }}
                onClicked={action}
                halign={Gtk.Align.CENTER}
                heightRequest={120}
              >
                <Gtk.EventControllerMotion onEnter={() => focus(i)} />
                <label
                  label={icon}
                  halign={Gtk.Align.CENTER}
                  valign={Gtk.Align.CENTER}
                />
              </button>
            ))}
          </box>
        </box>
      </revealer>
    </window>
  )
}
