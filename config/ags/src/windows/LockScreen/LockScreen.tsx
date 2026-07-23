import { createState, With } from 'ags'
import { readFileAsync } from 'ags/file'
import { Astal, Gdk, Gtk } from 'ags/gtk4'
import app from 'ags/gtk4/app'
import Gio from 'gi://Gio?version=2.0'
import GLib from 'gi://GLib?version=2.0'
import { Battery, Clock, Input, Media } from './components'

export default function LockScreen(monitor: Gdk.Monitor, index: number) {
  const { TOP, BOTTOM, RIGHT, LEFT } = Astal.WindowAnchor
  const HOME: string = GLib.get_home_dir()

  const stylixPath = `${HOME}/nixconf/modules/home/themes/stylix.nix`
  const stylixDir = Gio.File.new_for_path(stylixPath).get_parent()!

  const [imageFile, setImageFile] = createState<Gio.File | null>(null)
  const [showInput, setShowInput] = createState(false)
  const [resetKey, setResetKey] = createState(0)
  let showGuard = false

  readFileAsync(stylixPath).then((content) => {
    const match = content.match(/imagen\s*=\s*([^;]+);/)
    if (match) {
      const resolved = stylixDir.resolve_relative_path(match[1].trim())
      if (resolved) setImageFile(resolved)
    }
  })

  return (
    <window
      name={`LockScreen-${index}`}
      class="LockScreen"
      application={app}
      gdkmonitor={monitor}
      anchor={TOP | BOTTOM | RIGHT | LEFT}
      exclusivity={Astal.Exclusivity.IGNORE}
      vexpand
      hexpand
      cursor={Gdk.Cursor.new_from_name('none', null)}
      keymode={Astal.Keymode.EXCLUSIVE}
      $={(self) => {
        self.connect('notify::visible', () => {
          if (self.visible) {
            showGuard = true
            setTimeout(() => {
              showGuard = false
            }, 500)
            setResetKey((k) => k + 1)
            setShowInput(false)
          }
        })
      }}
    >
      <overlay vexpand hexpand valign={Gtk.Align.CENTER}>
        <With value={imageFile}>
          {(file) =>
            file && (
              <Gtk.Picture file={file} contentFit={Gtk.ContentFit.COVER} />
            )
          }
        </With>

        <box $type="overlay" class="dark-overlay" />

        <centerbox
          $type="overlay"
          vexpand
          hexpand
          orientation={Gtk.Orientation.VERTICAL}
          class="centerbox-lock"
          focusable={true}
          $={(self) => {
            self.grab_focus()

            let lastX = -1
            let lastY = -1
            const motion = new Gtk.EventControllerMotion()
            motion.connect('motion', (_controller, x, y) => {
              if (x !== lastX || y !== lastY) {
                lastX = x
                lastY = y
                if (!showInput.get() && !showGuard) setShowInput(true)
              }
            })
            self.add_controller(motion)

            const keys = new Gtk.EventControllerKey()
            keys.set_propagation_phase(Gtk.PropagationPhase.CAPTURE)
            keys.connect('key-pressed', () => {
              if (!showInput.get() && !showGuard) setShowInput(true)
              return false
            })
            self.add_controller(keys)
          }}
        >
          <box
            orientation={Gtk.Orientation.VERTICAL}
            $type="center"
            halign={Gtk.Align.CENTER}
            valign={Gtk.Align.BASELINE}
            spacing={60}
          >
            <Clock />
            <Input
              windowName={`LockScreen-${index}`}
              showInput={showInput}
              setShowInput={setShowInput}
              resetKey={resetKey}
            />
          </box>

          <box $type="end" orientation={Gtk.Orientation.HORIZONTAL}>
            <Battery />
            <box hexpand />
            <Media />
          </box>
        </centerbox>
      </overlay>
    </window>
  )
}
