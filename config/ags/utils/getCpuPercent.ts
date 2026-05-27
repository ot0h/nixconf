import GLib from "gi://GLib"

let prevIdle = 0
let prevTotal = 0

export function getCpuPercent(): number {
  const [, contents] = GLib.file_get_contents("/proc/stat")
  const line = new TextDecoder().decode(contents).split("\n")[0]
  const values = line.trim().split(/\s+/).slice(1).map(Number)

  const idle = values[3] + values[4] // idle + iowait
  const total = values.reduce((a, b) => a + b, 0)

  const diffIdle = idle - prevIdle
  const diffTotal = total - prevTotal

  prevIdle = idle
  prevTotal = total

  if (diffTotal === 0) return 0

  const usage = 1 - diffIdle / diffTotal
  return Math.round(usage * 100)
}
