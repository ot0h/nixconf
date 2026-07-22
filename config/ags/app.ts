import app from 'ags/gtk4/app'
import styles from './styles.scss'
import { execAsync } from 'ags/process'
import {
  AppLauncher,
  HyprlandLayoutsSwitcher,
  LockScreen,
  NotificationCenter,
  NotificationPopups,
  Panel,
  PowerMenu,
  ScreenShots,
  Sidebar,
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
      Panel(monitor, i)
      PowerMenu(monitor, i)
      ScreenShots(monitor, i)
      NotificationCenter(monitor, i)
      HyprlandLayoutsSwitcher(monitor, i)
      LockScreen(monitor, i)
    })
  },
  requestHandler(argv: string[], res: (r: unknown) => void) {
    const [cmd, ...args] = argv

    if (cmd === 'lock') {
      app.get_monitors().forEach((_, i) => {
        const win = app.get_window(`LockScreen-${i}`)
        if (win && !win.visible) win.visible = true
      })
      res('ok')
      return
    }

    for (let i = 0; i < app.get_monitors().length; i++) {
      if (app.get_window(`LockScreen-${i}`)?.visible) {
        res('locked')
        return
      }
    }

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
