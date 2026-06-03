import { Astal, Gdk, Gtk } from "ags/gtk4"
import { createPoll } from "ags/time"
import GLib from "gi://GLib?version=2.0"
import app from "ags/gtk4/app"

const WAL_COLORS = `${GLib.get_home_dir()}/.cache/wal/colors.json`

function getWallpaperClass(): string {
  try {
    const [ok, bytes] = GLib.file_get_contents(WAL_COLORS)
    if (!ok || !bytes) return ""
    const { wallpaper } = JSON.parse(new TextDecoder().decode(bytes))
    if (!wallpaper) return ""
    const name = (wallpaper as string).split("/").pop() ?? ""
    return `ClockW-${name.replace(/\.[^.]+$/, "")}`
  } catch {
    return ""
  }
}

const WALLPAPER_CLASS = getWallpaperClass()
const WALLPAPER_NAME = WALLPAPER_CLASS.replace("ClockW-", "")
const VISIBLE_WALLPAPERS = ["11", "4", "1"]
const IS_CLOCK_VISIBLE = VISIBLE_WALLPAPERS.includes(WALLPAPER_NAME)

export default function Clock(monitor: Gdk.Monitor, index: number = 0) {
  const dayStr = createPoll("", 1000, () => {
    return GLib.DateTime.new_now_local().format("%A")?.toLocaleUpperCase()!
  })

  const timeStr = createPoll("", 1000, () => {
    return GLib.DateTime.new_now_local().format("%H:%M")!
  })

  const dateStr = createPoll("", 1000, () => {
    return GLib.DateTime.new_now_local().format("%d/%m/%Y")!
  })

  return (
    <window
      name={`ClockW-${index}`}
      class={`ClockW ${WALLPAPER_CLASS}`}
      layer={Astal.Layer.BOTTOM}
      exclusivity={Astal.Exclusivity.IGNORE}
      halign={Gtk.Align.CENTER}
      valign={Gtk.Align.CENTER}
      gdkmonitor={monitor}
      application={app}
      $={(self) => {
        self.visible = IS_CLOCK_VISIBLE
      }}
    >
      <box
        class={"caja"}
        orientation={Gtk.Orientation.VERTICAL}
        spacing={4}
        halign={Gtk.Align.CENTER}
      >
        <label class="day" label={dayStr} />
        <label class="time" label={timeStr} />
        <label class="date" label={dateStr} />
      </box>
    </window>
  )
}
