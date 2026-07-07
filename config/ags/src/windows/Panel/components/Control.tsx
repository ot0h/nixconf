import { Gtk } from 'ags/gtk4'
import { execAsync } from 'ags/process'
import { createPoll } from 'ags/time'
import AstalWp from 'gi://AstalWp?version=0.1'
import { createBinding, createComputed, For } from 'gnim'
import { getBrightness, MIN_BRIGHT, setBrightness } from '@utils'
import Gdk from 'gi://Gdk?version=4.0'

export default function Control() {
  const { defaultSpeaker: speaker } = AstalWp.get_default()
  const bright = createPoll(0, 200, () => getBrightness())

  const botones = createComputed(() => [
    {
      icon: '',
      action: () =>
        execAsync('ags request toggle PowerMenu').catch((e) => console.log(e)),
    },
    {
      icon: '',
      action: () =>
        execAsync('ags request toggle Screenshot').catch((e) => console.log(e)),
    },
    {
      icon: '',
      action: () =>
        execAsync('fish -c ~/scripts/hyprsunset.fish').catch((e) =>
          console.log(e)
        ),
    },
    {
      icon: '',
      action: () =>
        execAsync('ags toggle Notification').catch((e) => console.log(e)),
    },
  ])

  return (
    <box
      class="center-control"
      css_name="center-control"
      orientation={1}
      halign={Gtk.Align.CENTER}
    >
      <box $type="start" orientation={1}>
        <box class="container-volume">
          <button
            onClicked={() => speaker.set_mute(!speaker.mute)}
            cursor={Gdk.Cursor.new_from_name('pointer', null)}
          >
            <image icon_name={createBinding(speaker, 'volumeIcon')} />
          </button>
          <slider
            width_request={160}
            onChangeValue={({ value }) => speaker.set_volume(value)}
            value={createBinding(speaker, 'volume')}
          />
        </box>
        <box class="container-bright">
          <button
            onClicked={() => setBrightness(bright.get() < 0.05 ? 0.5 : 0)}
            cursor={Gdk.Cursor.new_from_name('pointer', null)}
          >
            <label
              label={bright.as((v) => {
                v = Math.max(0, Math.min(1, v))

                if (v === 0) return '󱩎'
                if (v < 0.2) return '󱩏'
                if (v < 0.4) return '󱩑'
                if (v < 0.6) return '󱩓'
                if (v < 0.8) return '󱩕'
                if (v < 0.95) return '󱩖'

                return '󰛨'
              })}
            />
          </button>
          <slider
            width_request={160}
            min={MIN_BRIGHT}
            max={1}
            value={bright}
            onChangeValue={(_, __, value) => {
              setBrightness(value)
            }}
          />
        </box>
      </box>

      <box
        $type="end"
        class="container-botones"
        spacing={0}
        halign={Gtk.Align.CENTER}
      >
        <For each={botones}>
          {(item) => (
            <button
              onClicked={item.action}
              cursor={Gdk.Cursor.new_from_name('pointer', null)}
            >
              <label label={item.icon} />
            </button>
          )}
        </For>
      </box>
    </box>
  )
}
