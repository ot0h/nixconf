import { createBinding, createState, onCleanup } from 'ags'
import app from 'ags/gtk4/app'
import { timeout } from 'ags/time'
import AstalWp from 'gi://AstalWp'

export default function VolumeOsd() {
  const speaker = AstalWp.get_default()!.audio.defaultSpeaker
  const volume = createBinding(speaker, 'volume')
  const icon = createBinding(speaker, 'volumeIcon')

  const [visible, setVisible] = createState(false)
  let hideTimer: ReturnType<typeof timeout> | null = null

  function show() {
    const panel = app.get_windows().find((w) => w.name.startsWith('Panel'))
    const lockScreen = app
      .get_windows()
      .find((w) => w.name.startsWith('LockScreen'))

    if (panel?.is_visible() || lockScreen?.is_visible()) return

    setVisible(true)
    hideTimer?.cancel()
    hideTimer = timeout(1500, () => setVisible(false))
  }

  const volId = speaker.connect('notify::volume', show)
  const muteId = speaker.connect('notify::mute', show)

  onCleanup(() => {
    speaker.disconnect(volId)
    speaker.disconnect(muteId)
    hideTimer?.cancel()
  })

  return (
    <window name="volume-osd" visible={visible} class="osd-box">
      <box spacing={8}>
        <image iconName={icon} pixelSize={25} />
        <levelbar value={volume} widthRequest={180} />
      </box>
    </window>
  )
}
