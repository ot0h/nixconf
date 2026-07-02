import { createPoll } from 'ags/time'
import { getCpuPercent, getRamPercent } from '../../../../utils'

export default function Monitor() {
  const ramPercent = createPoll(0, 2000, () => getRamPercent())
  const cpuPercent = createPoll(0, 2000, () => getCpuPercent())

  const icon = (ram: number): string => {
    if (ram > 0 && ram <= 10) return '󰪞'
    if (ram > 10 && ram <= 25) return '󰪟'
    if (ram > 25 && ram <= 40) return '󰪠'
    if (ram > 40 && ram <= 55) return '󰪡'
    if (ram > 55 && ram <= 70) return '󰪢'
    if (ram > 70 && ram <= 80) return '󰪣'
    if (ram > 80 && ram <= 90) return '󰪤'
    return '󰪥'
  }

  return (
    <box orientation={1} class="monitor" spacing={5}>
      <label
        label={ramPercent.as(icon)}
        tooltip_text={ramPercent.as((v) => `RAM: ${v}%`)}
      />

      <label
        label={cpuPercent.as(icon)}
        tooltip_text={cpuPercent.as((v) => `CPU: ${v}%`)}
      />
    </box>
  )
}
