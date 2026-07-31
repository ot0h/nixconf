import { createBinding, createState, onCleanup } from 'ags'
import app from 'ags/gtk4/app'
import { timeout } from 'ags/time'
import AstalBrightness from 'gi://AstalBrightness?version=0.1'

export default function BrightnessOsd() {
  const brightness = AstalBrightness.get_default()
  const screen = brightness.screen
  const value = createBinding(screen, 'brightness')

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

  const brightnessID = screen.connect('notify::brightness', show)

  onCleanup(() => {
    screen.disconnect(brightnessID)
    hideTimer?.cancel()
  })

  return (
    <window name="brightness-osd" visible={visible} class="osd-box">
      <box spacing={8}>
        <image iconName="display-brightness-symbolic" pixelSize={25} />
        <levelbar value={value} widthRequest={180} />
      </box>
    </window>
  )
}
