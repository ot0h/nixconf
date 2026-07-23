import { Gtk } from 'ags/gtk4'
import AstalBattery from 'gi://AstalBattery?version=0.1'
import { createBinding } from 'gnim'

export default function Battery() {
  const bat = AstalBattery.get_default()
  const percent = createBinding(
    bat,
    'percentage'
  )((p) => String(Math.floor(p * 100)))

  return (
    <>
      <box
        class={'Battery-Lock'}
        spacing={10}
        orientation={Gtk.Orientation.HORIZONTAL}
        valign={Gtk.Align.END}
      >
        <image iconName={createBinding(bat, 'iconName')} pixelSize={23} />
        <label label={percent} justify={Gtk.Justification.CENTER} />
      </box>
    </>
  )
}
