import { Gtk } from 'ags/gtk4'
import { createState, createEffect, With, type Accessor } from 'ags'
import app from 'ags/gtk4/app'
import AstalAuth from 'gi://AstalAuth?version=0.1'

export default function Input({
  windowName,
  showInput,
  setShowInput,
  resetKey,
}: {
  windowName: string
  showInput: Accessor<boolean>
  setShowInput: (v: boolean) => void
  resetKey: Accessor<number>
}) {
  const [error, setError] = createState('')
  let entryRef: Gtk.Entry
  let revealerRef: Gtk.Revealer

  createEffect(() => {
    resetKey.get()
    setError('')
    if (entryRef) entryRef.set_text('')
    if (revealerRef && revealerRef.get_reveal_child()) revealerRef.set_reveal_child(false)
  })

  function onActivate(self: Gtk.Entry) {
    const password = self.get_text()
    if (!password) return

    AstalAuth.Pam.authenticate(password, (_source, res) => {
      const result = AstalAuth.Pam.authenticate_finish(res)
      if (result === 0) {
        app.get_monitors().forEach((_, i) => {
          const win = app.get_window(`LockScreen-${i}`)
          if (win) win.visible = false
        })
        self.set_text('')
      } else {
        setError('Contraseña incorrecta')
        self.set_text('')
        setTimeout(() => setShowInput(false), 1500)
      }
    })
  }

  return (
    <revealer
      revealChild={showInput}
      transitionType={Gtk.RevealerTransitionType.SLIDE_DOWN}
      transitionDuration={200}
      $={(self) => {
        revealerRef = self
        self.connect('notify::reveal-child', () => {
          if (self.get_reveal_child() && entryRef) {
            entryRef.grab_focus()
          } else {
            setError('')
            if (entryRef) entryRef.set_text('')
          }
        })
      }}
    >
      <box
        orientation={Gtk.Orientation.VERTICAL}
        halign={Gtk.Align.CENTER}
        spacing={8}
      >
        <entry
          class="lockscreen-entry"
          placeholder_text="Contraseña"
          visibility={false}
          onActivate={onActivate}
          canFocus
          $={(self) => {
            entryRef = self
          }}
        />
        <With value={error}>
          {(err) => err && <label label={err} class="auth-error" />}
        </With>
      </box>
    </revealer>
  )
}
