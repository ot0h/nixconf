import app from "ags/gtk4/app"
import { Astal, Gdk, Gtk } from "ags/gtk4"
import Workspaces from "./components/Workspaces"
import Clock from "./components/Clock"
import Battery from "./components/Battery"
import Monitor from "./components/Monitor"
import Network from "./components/Network"
import Submap from "./components/Submap"
import Volume from "./components/Volume"
import PowerMenu from "./components/PowerMenu"

/**
 * Un Sidebar re insano papá
 * @author Otoh
 */
export default function Sidebar(gdkmonitor: Gdk.Monitor) {
  const { TOP, LEFT, BOTTOM } = Astal.WindowAnchor

  return (
    <window
      visible
      name="Sidebar"
      class="Sidebar"
      gdkmonitor={gdkmonitor}
      exclusivity={Astal.Exclusivity.EXCLUSIVE}
      anchor={TOP | LEFT | BOTTOM}
      application={app}
    >
      <centerbox
        cssName="centerbox"
        orientation={1}
        halign={Gtk.Align.CENTER}
        vexpand
      >
        {/* ARRIBA */}
        <box $type="start" orientation={1} spacing={1}>
          <PowerMenu />
          <Submap />
        </box>

        {/* CENTRO */}
        <box $type="center" orientation={1}>
          <Workspaces />
        </box>

        {/* ABAJO */}
        <box $type="end" orientation={1} spacing={10}>
          <Network />
          <Volume />
          <Battery />
          <Monitor />
          <Clock />
        </box>
      </centerbox>
    </window>
  )
}
