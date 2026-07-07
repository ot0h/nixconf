import app from 'ags/gtk4/app'
import { Astal, Gdk, Gtk } from 'ags/gtk4'
import Workspaces from './components/Workspaces'
import Clock from './components/Clock'
import Battery from './components/Battery'
import Monitor from './components/Monitor'
import Network from './components/Network'
import Submap from './components/Submap'
import PowerMenuMini from './components/PowerMenuMini'
import Volume from './components/Volume'
import Notification from './components/Notification'

/**
 * Un Sidebar re insano papá
 * @author qisvo
 */
export default function Sidebar(gdkmonitor: Gdk.Monitor, index: number = 0) {
  const { TOP, LEFT, BOTTOM } = Astal.WindowAnchor

  return (
    <window
      visible
      name={`Sidebar-${index}`}
      class="Sidebar"
      gdkmonitor={gdkmonitor}
      exclusivity={Astal.Exclusivity.EXCLUSIVE}
      anchor={TOP | LEFT | BOTTOM}
      application={app}
    >
      <centerbox
        cssName="centerbox"
        orientation={Gtk.Orientation.VERTICAL}
        halign={Gtk.Align.CENTER}
        valign={Gtk.Align.FILL}
        vexpand
      >
        {/* ARRIBA */}
        <box
          $type="start"
          halign={Gtk.Align.CENTER}
          orientation={Gtk.Orientation.VERTICAL}
          valign={Gtk.Align.CENTER}
          spacing={5}
        >
          <PowerMenuMini />
          <Submap />
          <Notification />
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
