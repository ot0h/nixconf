import app from 'ags/gtk4/app'
import { Astal, Gtk } from 'ags/gtk4'
import AstalNotifd from 'gi://AstalNotifd'
import GLib from 'gi://GLib'
import Notification from './Notification'
import { createBinding, For, createState, onCleanup } from 'ags'

function urgency(n: AstalNotifd.Notification) {
  const { LOW, NORMAL, CRITICAL } = AstalNotifd.Urgency
  switch (n.urgency) {
    case LOW:
      return 'low'
    case CRITICAL:
      return 'critical'
    case NORMAL:
    default:
      return 'normal'
  }
}

const TIMEOUT = {
  low: 3000,
  normal: 5000,
  critical: 10000,
}

export default function NotificationPopups() {
  const monitors = createBinding(app, 'monitors')
  const notifd = AstalNotifd.get_default()
  const [notifications, setNotifications] = createState(
    new Array<AstalNotifd.Notification>()
  )
  const revealerRefs = new Map<number, Gtk.Revealer>()

  const dismiss = (id: number) => {
    const revealer = revealerRefs.get(id)
    if (revealer) {
      revealer.revealChild = false
      GLib.timeout_add(GLib.PRIORITY_DEFAULT, 300, () => {
        setNotifications((ns) => ns.filter((n) => n.id !== id))
        revealerRefs.delete(id)
        return GLib.SOURCE_REMOVE
      })
    } else {
      setNotifications((ns) => ns.filter((n) => n.id !== id))
    }
  }

  const notifiedHandler = notifd.connect('notified', (_, id, replaced) => {
    const notification = notifd.get_notification(id)
    if (replaced && notifications.get().some((n) => n.id === id)) {
      setNotifications((ns) => ns.map((n) => (n.id === id ? notification : n)))
    } else {
      setNotifications((ns) => [notification, ...ns])
    }

    const u = urgency(notification) as keyof typeof TIMEOUT
    GLib.timeout_add(GLib.PRIORITY_DEFAULT, TIMEOUT[u], () => {
      dismiss(id)
      return GLib.SOURCE_REMOVE
    })
  })

  const resolvedHandler = notifd.connect('resolved', (_, id) => {
    dismiss(id)
  })

  onCleanup(() => {
    notifd.disconnect(notifiedHandler)
    notifd.disconnect(resolvedHandler)
  })

  return (
    <For each={monitors}>
      {(monitor) => (
        <window
          $={(self) => onCleanup(() => self.destroy())}
          class="NotificationPopups"
          gdkmonitor={monitor}
          visible={notifications((ns) => ns.length > 0)}
          anchor={Astal.WindowAnchor.TOP | Astal.WindowAnchor.RIGHT}
        >
          <box class="notis-box" orientation={Gtk.Orientation.VERTICAL}>
            <For each={notifications}>
              {(notification) => (
                <revealer
                  $={(self) => {
                    revealerRefs.set(notification.id, self)
                    self.revealChild = false
                    GLib.timeout_add(GLib.PRIORITY_DEFAULT, 10, () => {
                      self.revealChild = true
                      return GLib.SOURCE_REMOVE
                    })
                  }}
                  transitionType={Gtk.RevealerTransitionType.SLIDE_DOWN}
                  transitionDuration={300}
                >
                  <Notification
                    notification={notification}
                    onDismiss={() => dismiss(notification.id)}
                  />
                </revealer>
              )}
            </For>
          </box>
        </window>
      )}
    </For>
  )
}
