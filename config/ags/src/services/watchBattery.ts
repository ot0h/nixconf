import { execAsync } from 'ags/process'
import AstalBattery from 'gi://AstalBattery?version=0.1'

export default function watchBattery() {
  const bat = AstalBattery.get_default()

  let warned20: boolean = false
  let warned10: boolean = false

  const check = () => {
    const percent = Math.floor(bat.percentage * 100)

    const charging = bat.charging

    if (charging) {
      warned10 = false
      warned20 = false
      return
    }

    if (percent <= 10 && !warned10) {
      warned10 = true

      execAsync([
        'notify-send',
        '-u',
        'critical',
        '-i',
        'battery-caution',
        'Batería crítica',
        `Queda ${percent}%. Conectá el cargador ya.`,
      ]).catch(console.error)
    } else if (percent <= 20 && !warned20) {
      warned20 = true

      execAsync([
        'notify-send',
        '-u',
        'normal',
        '-i',
        'battery-low',
        'Batería baja',
        `Queda ${percent}%.`,
      ]).catch(console.error)
    }
  }

  bat.connect('notify::percentage', check)
  bat.connect('notify::charging', check)
  check()
}
