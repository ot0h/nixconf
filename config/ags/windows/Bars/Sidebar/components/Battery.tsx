import { createPoll } from 'ags/time'
import { getBatteryInfo } from '../../../../utils'

export default function Battery() {
  const battery = createPoll({ percent: 0, status: 'Unknown' }, 2000, () =>
    getBatteryInfo()
  )

  const getIcon = (b: { percent: number; status: string }): string => {
    if (b.status === 'Charging' || b.status === 'Full') return '󰂄'

    const p = b.percent
    if (p > 0 && p <= 20) return '󰁺'
    if (p >= 20 && p <= 29) return '󰁻'
    if (p >= 30 && p <= 39) return '󰁼'
    if (p >= 40 && p <= 49) return '󰁽'
    if (p >= 50 && p <= 59) return '󰁾'
    if (p >= 60 && p <= 69) return '󰁿'
    if (p >= 70 && p <= 79) return '󰂀'
    if (p >= 80 && p <= 89) return '󰂁'
    if (p >= 90 && p <= 95) return '󰂂'
    return '󰁹'
  }

  return (
    <box class="bateria" orientation={1} spacing={5}>
      <label
        label={battery.as(getIcon)}
        tooltip_text={battery.as((b) => `Bat: ${b.percent}%\n(${b.status})`)}
        // class={battery.as((b) => (b.status === "Charging" ? "charging" : ""))}
      />
    </box>
  )
}
