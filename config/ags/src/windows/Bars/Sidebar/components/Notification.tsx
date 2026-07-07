import { Gdk } from 'ags/gtk4'
import { execAsync } from 'ags/process'
import { createPoll } from 'ags/time'
import AstalNotifd from 'gi://AstalNotifd?version=0.1'

export default function Notification() {
  const notifd = AstalNotifd.get_default()
  const notificationIcon = createPoll('', 2000, () =>
    notifd.get_notifications().length > 0 ? '󱅫' : '󰂚'
  )

  return (
    <button
      class="NotificationIcon"
      cursor={Gdk.Cursor.new_from_name('pointer', null)}
      onClicked={() => execAsync('ags request toggle Notification')}
    >
      <label label={notificationIcon} />
    </button>
  )
}
