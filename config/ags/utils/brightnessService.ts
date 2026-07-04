import AstalBrightness from 'gi://AstalBrightness?version=0.1'
export const MIN_BRIGHT: number = 0.15

const brillo = AstalBrightness.get_default()

export async function getBrightness(): Promise<number> {
  return brillo.screen.brightness
}

export async function setBrightness(v: number) {
  brillo.screen.brightness = v
}
