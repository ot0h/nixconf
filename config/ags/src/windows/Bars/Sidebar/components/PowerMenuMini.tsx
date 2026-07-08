import { Gdk, Gtk } from 'ags/gtk4'
import { execAsync } from 'ags/process'
import { createState, createComputed, For } from 'gnim'

export default function PowerMenuMini() {
  const [revelarBotones, setRevelarBotones] = createState(false)
  const toggle = () => setRevelarBotones((v) => !v)

  const botones = createComputed(() => [
    {
      icon: '󰐥',
      action: () => execAsync('systemctl poweroff').catch(console.log),
    },
    {
      icon: '󰜉',
      action: () => execAsync('systemctl reboot').catch(console.log),
    },
    {
      icon: '󰍃',
      action: () => {
        execAsync('hyprctl dispatch exit').catch(console.log)
        execAsync('ags quit').catch(console.log)
        toggle()
      },
    },
    {
      icon: '󰤄',
      action: () => {
        execAsync('systemctl suspend').catch(console.log)
        toggle()
      },
    },
  ])

  const setupClickGestures = (self: Gtk.Button) => {
    const gesture = new Gtk.GestureClick({ button: 0 })

    gesture.connect('released', (gesture) => {
      const boton = gesture.get_current_button()

      if (boton === Gdk.BUTTON_PRIMARY) {
        toggle()
      } else {
        execAsync('ags request toggle AppLauncher')
      }
    })

    self.add_controller(gesture)
  }

  return (
    <box orientation={1} class="powermenumini">
      <button
        onClicked={toggle}
        cursor={Gdk.Cursor.new_from_name('pointer', null)}
        $={setupClickGestures}
      >
        <label class="icon-iso" label="" hexpand halign={Gtk.Align.CENTER} />
      </button>

      <revealer
        revealChild={revelarBotones}
        transitionType={Gtk.RevealerTransitionType.SWING_DOWN}
        transitionDuration={350}
      >
        <box orientation={1} class="container-powermenumini">
          <For each={botones}>
            {(item) => (
              <button
                cursor={Gdk.Cursor.new_from_name('pointer', null)}
                onClicked={item.action}
              >
                <label label={item.icon} />
              </button>
            )}
          </For>
        </box>
      </revealer>
    </box>
  )
}
