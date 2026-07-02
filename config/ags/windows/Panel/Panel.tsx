import { Astal, Gdk, Gtk } from 'ags/gtk4'
import app from 'ags/gtk4/app'
import Control from './components/Control'
import MediaPlayer from './components/MediaPlayer'
import Calendar from './components/Calendar'

export default function Panel(gdkmonitor: Gdk.Monitor, index: number = 0) {
  const { TOP, RIGHT } = Astal.WindowAnchor

  return (
    <window
      name={`Panel-${index}`}
      class="Panel"
      gdkmonitor={gdkmonitor}
      exclusivity={Astal.Exclusivity.IGNORE}
      anchor={TOP | RIGHT}
      application={app}
    >
      <box
        orientation={Gtk.Orientation.VERTICAL}
        vexpand={false}
        valign={Gtk.Align.START}
      >
        <box class="container-box" orientation={Gtk.Orientation.VERTICAL}>
          <Control />
        </box>
        <box class="container-box">
          <MediaPlayer />
        </box>
        <box class="container-box">
          <Calendar />
        </box>
      </box>
    </window>
  )
}
