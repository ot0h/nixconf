import { Gdk } from 'ags/gtk4'
import { execAsync } from 'ags/process'
import { createPoll } from 'ags/time'

const pointerCursor = Gdk.Cursor.new_from_name('pointer', null)

export default function Hypridle() {
  type HypridleIcon = '󰅶' | '󰾪'

  const icon = createPoll<HypridleIcon>('󰅶', 1000, () =>
    execAsync('pgrep hypridle')
      .then(() => '󰅶' as HypridleIcon)
      .catch(() => '󰾪' as HypridleIcon)
  )

  async function toggle() {
    try {
      if (icon.get() === '󰅶') {
        await execAsync('pkill hypridle')
        await execAsync(
          'notify-send -u normal -i dialog-information -a AGS Hypridle OFF'
        )
      } else {
        await execAsync(['fish', '-c', 'setsid hypridle > /dev/null 2>&1 &'])
        await execAsync(
          'notify-send -u normal -i dialog-information -a AGS Hypridle ON'
        )
      }
    } catch (e) {
      await execAsync([
        'notify-send',
        '-u',
        'critical',
        '-a',
        'AGS',
        String(e),
      ]).catch(() => {})
    }
  }

  return (
    <>
      <button class="HypridleIcon" onClicked={toggle} cursor={pointerCursor}>
        <label label={icon} />
      </button>
    </>
  )
}
