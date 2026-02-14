import { execAsync } from "ags/process"
export const MIN_BRIGHT: number = 0.15

export async function getBrightness(): Promise<number> {
  const cur = await execAsync("brightnessctl g")
  const max = await execAsync("brightnessctl m")
  return Number(cur) / Number(max) // 0–1
}

export async function setBrightness(v: number) {
  v = Math.max(MIN_BRIGHT, Math.min(1, v))
  await execAsync(`brightnessctl set ${Math.floor(v * 100)}%`)
}
