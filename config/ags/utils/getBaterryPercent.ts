import GLib from 'gi://GLib?version=2.0'

export function getBatteryPercent(): number {
  try {
    const [, contents] = GLib.file_get_contents(
      '/sys/class/power_supply/BAT0/capacity'
    )
    const text = new TextDecoder().decode(contents)

    return Number(text.trim())
  } catch (e) {
    console.error('No se pudo leer la batería:', e)
    return 0
  }
}

export function getBatteryInfo() {
  try {
    const base = '/sys/class/power_supply/BAT0'
    const [, cap] = GLib.file_get_contents(`${base}/capacity`)
    const [, stat] = GLib.file_get_contents(`${base}/status`)

    return {
      percent: Math.round(Number(new TextDecoder().decode(cap).trim())),
      status: new TextDecoder().decode(stat).trim(),
    }
  } catch (e) {
    return { percent: 0, status: 'Unknown' }
  }
}
