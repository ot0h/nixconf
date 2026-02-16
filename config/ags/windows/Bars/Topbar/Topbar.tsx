import { Gdk } from "ags/gtk4"
import app from "ags/gtk4/app"
import Astal from "gi://Astal?version=4.0"
import Clock from "./components/Clock"
import Submap from "./components/Submap"

export default function Topbar(gdkmonitor: Gdk.Monitor) {
  const { TOP, LEFT, RIGHT } = Astal.WindowAnchor

  return (
    <window
      visible
      name="Topbar"
      class="Topbar"
      gdkmonitor={gdkmonitor}
      exclusivity={Astal.Exclusivity.EXCLUSIVE}
      anchor={TOP | LEFT | RIGHT}
      application={app}
    >
      <centerbox class="centerbox">
        <box $type="start">
          <Submap />
        </box>
        <box $type="center">
          <Clock />
        </box>
        <box $type="end"></box>
      </centerbox>
    </window>
  )
}
