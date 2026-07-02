import { createPoll } from 'ags/time'

function iconFor(name: string): string {
  switch (name) {
    case 'resize':
      return '󰩨 '
    case 'move':
      return '󰆾 '
    case 'launch':
      return '󱓞 '
    case 'zoom':
      return ' '
    default:
      return ' '
  }
}

export const getSubmapHyprland = createPoll(
  { raw: 'default', icon: '' },
  300,
  'hyprctl submap',
  (out) => {
    const raw = out.replace('submap:', '').trim()

    if (raw === 'default') {
      return { raw, icon: '' }
    }

    return {
      raw,
      icon: iconFor(raw),
    }
  },
)
