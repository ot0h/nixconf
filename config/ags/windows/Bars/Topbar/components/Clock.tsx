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
    <box class="tiempo">
      <label label={hours} />
      <label label={":"} />
      <label label={minutes} />
    </box>
  )
}
