import app from "ags/gtk4/app"
import { Astal, Gdk } from "ags/gtk4"

const { TOP, BOTTOM, LEFT, RIGHT } = Astal.WindowAnchor

function Corner(
  place: string,
  anchor: number,
  gdkmonitor: Gdk.Monitor,
  index: number,
) {
  return (
    <window
      visible
      name={`Marco-${place}-${index}`}
      class={`Marco ${place}`}
      gdkmonitor={gdkmonitor}
      application={app}
      layer={Astal.Layer.TOP}
      anchor={anchor}
    >
      <box class="corner" />
    </window>
  )
}

export default function Marco(monitor: Gdk.Monitor, index: number = 0) {
  Corner("margen-arriba", TOP | LEFT | RIGHT, monitor, index)
  Corner("margen-abajo", BOTTOM | LEFT | RIGHT, monitor, index)
  Corner("margen-derecho", TOP | BOTTOM | RIGHT, monitor, index)
}
