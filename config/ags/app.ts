import app from 'ags/gtk4/app'
import styles from './styles.scss'
import { execAsync } from 'ags/process'
import {
  AppLauncher,
  Clock,
  HyprlandLayoutsSwitcher,
  NotificationCenter,
  NotificationPopups,
  Panel,
  PowerMenu,
  ScreenShots,
  WallpaperPicker,
  Sidebar,
  Tobpar,
} from '@windows'

async function toggleOnActiveMonitor(windowBaseName: string) {
  const out = await execAsync(['hyprctl', 'activeworkspace', '-j'])
  const ws = JSON.parse(out)
  const monitorIndex: number = ws.monitorID ?? 0
  const win = app.get_window(`${windowBaseName}-${monitorIndex}`)
  if (win) win.visible = !win.visible
}

app.start({
  css: styles,
  main() {
    NotificationPopups()
    app.get_monitors().forEach((monitor, i) => {
      AppLauncher(monitor, i)
      Sidebar(monitor, i)
      // Tobpar(monitor, i)
      Panel(monitor, i)
      PowerMenu(monitor, i)
      ScreenShots(monitor, i)
      NotificationCenter(monitor, i)
      HyprlandLayoutsSwitcher(monitor, i)
    })
  },
  requestHandler(argv: string[], res: (r: unknown) => void) {
    const [cmd, ...args] = argv
    if (cmd === 'toggle') {
      toggleOnActiveMonitor(args[0]).then(() => res('ok'))
    } else if (cmd === 'toggle-all') {
      Promise.all(args.map(toggleOnActiveMonitor)).then(() => res('ok'))
    } else if (cmd === 'reload') {
      Promise.all([execAsync('hyprctl reload')])
        .then(() => res('ok'))
        .catch(() => res('error'))
    } else {
      res('unknown command')
    }
  },
})
