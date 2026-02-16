import AstalBattery from "gi://AstalBattery?version=0.1"
import { createBinding } from "gnim"

export default function Battery() {
  const battery = AstalBattery.get_default()

  const percent = createBinding(
    battery,
    "percentage",
  )((p) => `${Math.floor(p * 100)}%`)

  return (
    <box class="bateria" orientation={1}>
      <image
        iconName={createBinding(battery, "iconName")}
        tooltip_text={percent}
      />
    </box>
  )
}
