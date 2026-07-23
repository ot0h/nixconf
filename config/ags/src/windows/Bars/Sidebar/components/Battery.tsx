import AstalBattery from 'gi://AstalBattery?version=0.1'
import { createBinding } from 'gnim'
import { Gtk } from 'ags/gtk4'

export default function Battery() {
  const battery = AstalBattery.get_default()
  const percent = createBinding(
    battery,
    'percentage'
  )((p) => `Bat: ${Math.floor(p * 100)}%`)

  return (
    <>
      <image
        class="bateria"
        tooltip_text={percent}
        iconName={createBinding(battery, 'iconName')}
        valign={Gtk.Align.CENTER}
        halign={Gtk.Align.CENTER}
      />
    </>
  )
}
