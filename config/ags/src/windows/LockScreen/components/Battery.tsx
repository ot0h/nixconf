import AstalBattery from 'gi://AstalBattery?version=0.1'
import { createBinding } from 'gnim'

export default function Battery() {
  const bat = AstalBattery.get_default()
  return (
    <>
      <box>
        {/* <label label={batIcon} /> */}
        <label label={String(bat.get_percentage() * 100)} />
      </box>
    </>
  )
}
