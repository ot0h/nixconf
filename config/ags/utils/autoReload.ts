import { exec, execAsync } from "ags/process"
import Gio from "gi://Gio"
import GLib from "gi://GLib"

const home = GLib.get_home_dir()
const walCss = `${home}/.cache/wal/colors.css`
const agsDir = `${home}/.config/ags`

let restarting = false

function debounce(cb: () => void, delay = 150) {
  let id: number | null = null
  return () => {
    if (id) GLib.source_remove(id)
    id = GLib.timeout_add(GLib.PRIORITY_DEFAULT, delay, () => {
      cb()
      id = null
      return GLib.SOURCE_REMOVE
    })
  }
}

function watch(path: string) {
  const file = Gio.File.new_for_path(path)

  const monitor =
    file.query_file_type(Gio.FileQueryInfoFlags.NONE, null) ===
    Gio.FileType.DIRECTORY
      ? file.monitor_directory(Gio.FileMonitorFlags.NONE, null)
      : file.monitor(Gio.FileMonitorFlags.NONE, null)

  const trigger = debounce(() => {
    if (restarting) return
    restarting = true

    print("🔄 Cambio detectado → reiniciando AGS")

    exec(["ags quit; sleep 2 ags run &"])
  })

  monitor.connect("changed", trigger)
}

// 🔥 Se activa solo al importar
watch(walCss)
watch(agsDir)

print("👀 AutoReload activo")
