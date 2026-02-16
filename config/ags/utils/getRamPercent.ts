import GLib from "gi://GLib?version=2.0"

export function getRamPercent(): number {
  const [, contents] = GLib.file_get_contents("/proc/meminfo")
  const text = new TextDecoder().decode(contents)

  const total = Number(text.match(/MemTotal:\s+(\d+)/)?.[1])
  const available = Number(text.match(/MemAvailable:\s+(\d+)/)?.[1])

  return Math.round(((total - available) / total) * 100)
}
