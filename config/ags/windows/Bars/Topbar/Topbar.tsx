import { Astal, Gdk, Gtk } from 'ags/gtk4'
import app from 'ags/gtk4/app'
import { Clock } from './components'

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
      <centerbox cssName="centerbox" orientation={1} halign={Gtk.Align.CENTER}>
        {/* ARRIBA */}
        <box $type="start" orientation={1} spacing={1}></box>

        {/* CENTRO */}
        <box $type="center" orientation={1}>
          <Clock />
        </box>

        {/* ABAJO */}
        <box $type="end" orientation={1} spacing={10}></box>
      </centerbox>
    </window>
  )
}
