import { Gtk } from 'ags/gtk4'
import { createPoll } from 'ags/time'
import GLib from 'gi://GLib?version=2.0'

export default function Clock() {
  const hours = createPoll(
    '',
    1000,
    () => GLib.DateTime.new_now_local().format('%H')!
  )
  const minutes = createPoll(
    '',
    1000,
    () => GLib.DateTime.new_now_local().format('%M')!
  )
  const dayName = createPoll(
    '',
    30000,
    () => GLib.DateTime.new_now_local().format('%A')!
  )
  const dayDate = createPoll(
    '',
    30000,
    () => GLib.DateTime.new_now_local().format('%-d %B')!
  )

  return (
    <box
      orientation={Gtk.Orientation.VERTICAL}
      class="tiempo-lock"
      halign={Gtk.Align.CENTER}
      valign={Gtk.Align.CENTER}
    >
      <box>
        <label label={hours} class="time-hours" />
        <label label=":" class="time-sep" />
        <label label={minutes} class="time-minutes" />
      </box>
      <box class="separator-h" />
      <label label={dayName} class="date-dayname" />
      <label label={dayDate} class="date-daydate" />
    </box>
  )
}
