import { Gtk, Gdk } from 'ags/gtk4'
import app from 'ags/gtk4/app'
import Astal from 'gi://Astal?version=4.0'
import AstalNotifd from 'gi://AstalNotifd'
import { createBinding, For, createState, onCleanup } from 'ags'
import GLib from 'gi://GLib'
import Notification from './Notification'

export default function NotificationCenter(
  gdkmonitor: Gdk.Monitor,
  index: number = 0
) {
  let win: Astal.Window
  const notifd = AstalNotifd.get_default()
  const [notifications, setNotifications] = createState(
    new Array<AstalNotifd.Notification>()
  )

  const dismiss = (id: number) => {
    setNotifications((ns) => ns.filter((n) => n.id !== id))
  }

  const clearAll = () => {
    setNotifications([])
  }

  const notifiedHandler = notifd.connect('notified', (_, id, replaced) => {
    const notification = notifd.get_notification(id)
    if (replaced && notifications.get().some((n) => n.id === id)) {
      setNotifications((ns) => ns.map((n) => (n.id === id ? notification : n)))
    } else {
      setNotifications((ns) => [notification, ...ns])
    }
  })

  const resolvedHandler = notifd.connect('resolved', (_, id) => {
    dismiss(id)
  })

  onCleanup(() => {
    notifd.disconnect(notifiedHandler)
    notifd.disconnect(resolvedHandler)
  })

  return (
    <window
      $={(self) => (win = self)}
      name={`Notification-${index}`}
      class="NotificationCenter"
      visible={false}
      gdkmonitor={gdkmonitor}
      exclusivity={Astal.Exclusivity.IGNORE}
      anchor={Astal.WindowAnchor.TOP | Astal.WindowAnchor.RIGHT}
      application={app}
      keymode={Astal.Keymode.ON_DEMAND}
    >
      <box
        class="notification-center"
        orientation={Gtk.Orientation.VERTICAL}
        widthRequest={380}
        heightRequest={500}
      >
        <box class="header" spacing={8}>
          <label
            label="Notificaciones"
            hexpand
            halign={Gtk.Align.START}
            class="title"
          />
          <button
            class="clear-all"
            onClicked={clearAll}
            visible={notifications((ns) => ns.length > 0)}
          >
            <label label="  Borrar todo" />
          </button>
        </box>
        <Gtk.Separator visible />
        <scrolledwindow
          hexpand
          vexpand
          class="notifications-list"
        >
          <box
            orientation={Gtk.Orientation.VERTICAL}
            class="notifications-container"
          >
            <For each={notifications}>
              {(notification) => (
                <Notification
                  notification={notification}
                  onDismiss={() => dismiss(notification.id)}
                />
              )}
            </For>
            {notifications((ns) => ns.length === 0) && (
              <box
                class="empty-state"
                halign={Gtk.Align.CENTER}
                valign={Gtk.Align.CENTER}
                vexpand
              >
                <label label="Sin notificaciones" class="empty-label" />
              </box>
            )}
          </box>
        </scrolledwindow>
      </box>
    </window>
  )
}
