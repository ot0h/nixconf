import { Astal, Gdk } from "ags/gtk4"
import app from "ags/gtk4/app"
import Control from "./components/Control"
import MediaPlayer from "./components/MediaPlayer"

export default function Panel(gdkmonitor: Gdk.Monitor) {
  const { TOP, RIGHT } = Astal.WindowAnchor

  return (
    <window
      name="Panel"
      class="Panel"
      gdkmonitor={gdkmonitor}
      exclusivity={Astal.Exclusivity.IGNORE}
      anchor={TOP | RIGHT}
      application={app}
    >
      <centerbox css_name={"centerbox"} orientation={1}>
        <box $type="start" orientation={1} class="container-box">
          <Control />
        </box>
        <box $type="center" class="container-box">
          <MediaPlayer />
        </box>

        <box $type="end" class="container-box"></box>
      </centerbox>
    </window>
  )
}
