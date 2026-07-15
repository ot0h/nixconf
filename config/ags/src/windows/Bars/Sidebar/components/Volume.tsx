import { Gdk } from 'ags/gtk4'
import AstalWp from 'gi://AstalWp?version=0.1'
import { createBinding } from 'gnim'

export default function Volume() {
  const { defaultSpeaker: speaker } = AstalWp.get_default()!

  return (
    <box orientation={1}>
      <button
        onClicked={() => speaker.set_mute(!speaker.mute)}
        cursor={Gdk.Cursor.new_from_name('pointer', null)}
      >
        <image
          iconName={createBinding(speaker, 'volumeIcon')}
          focus_on_click={false}
        />
      </button>
    </box>
  )
}
