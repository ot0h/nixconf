import { Astal, Gdk, Gtk } from 'ags/gtk4'
import app from 'ags/gtk4/app'
import { Clock, Workspaces } from './components'

export default function Topbar(monitor: Gdk.Monitor, index: number = 0) {
  const { TOP, LEFT, RIGHT } = Astal.WindowAnchor

  return (
    <window
      visible
      name={`Topbar-${index}`}
      class="Topbar"
      gdkmonitor={monitor}
      exclusivity={Astal.Exclusivity.EXCLUSIVE}
      anchor={TOP | LEFT | RIGHT}
      application={app}
    >
      <centerbox
        cssName="centerbox"
        orientation={Gtk.Orientation.HORIZONTAL}
        halign={Gtk.Align.CENTER}
      >
        {/* IZQUIERDA */}
        <box $type="start" orientation={Gtk.Orientation.HORIZONTAL}>
          <Workspaces />
        </box>

        {/* CENTRO */}
        <box $type="center" orientation={Gtk.Orientation.HORIZONTAL}>
          <Clock />
        </box>

        {/* DERECHA */}
        <box
          $type="end"
          orientation={Gtk.Orientation.HORIZONTAL}
          spacing={10}
        ></box>
      </centerbox>
    </window>
  )
}
