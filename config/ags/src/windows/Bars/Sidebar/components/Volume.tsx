import AstalWp from 'gi://AstalWp?version=0.1'
import { createBinding } from 'gnim'

export default function Volume() {
  const { defaultSpeaker: speaker } = AstalWp.get_default()!

  return (
    <box orientation={1}>
      <image
        iconName={createBinding(speaker, 'volumeIcon')}
        focus_on_click={false}
      />
    </box>
  )
}
