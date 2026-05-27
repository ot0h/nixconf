import { Gtk } from "ags/gtk4"
import { createPoll } from "ags/time"
import GLib from "gi://GLib?version=2.0"

export default function Clock() {
  const hours = createPoll("", 1000, () => {
    return GLib.DateTime.new_now_local().format("%H")!
  })

  const minutes = createPoll("", 1000, () => {
    return GLib.DateTime.new_now_local().format("%M")!
  })

  return (
    <box class="tiempo" orientation={1}>
      <label label={hours} halign={Gtk.Align.CENTER} hexpand />
      <label label={minutes} halign={Gtk.Align.CENTER} hexpand />
    </box>
  )
}
