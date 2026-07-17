import { Gtk, Gdk } from 'ags/gtk4'
import app from 'ags/gtk4/app'
import Astal from 'gi://Astal?version=4.0'
import AstalNotifd from 'gi://AstalNotifd'
import { For, createState, onCleanup } from 'ags'
import GLib from 'gi://GLib'
import Pango from 'gi://Pango'

function isIcon(icon?: string | null) {
  const iconTheme = Gtk.IconTheme.get_for_display(Gdk.Display.get_default()!)
  return icon && iconTheme.has_icon(icon)
}

function fileExists(path: string) {
  return GLib.file_test(path, GLib.FileTest.EXISTS)
}

function time(ts: number) {
  const now = GLib.DateTime.new_now_local().to_unix()
  const diff = now - ts
  const mins = Math.floor(diff / 60)
  const hours = Math.floor(mins / 60)
  const days = Math.floor(hours / 24)

  if (mins < 1) return 'ahora'
  if (mins < 60) return `hace ${mins}m`
  if (hours < 24) return `hace ${hours}h`
  if (days < 7) return `hace ${days}d`
  return GLib.DateTime.new_from_unix_local(ts).format('%d/%m')!
}

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

export default function NotificationCenter(
  gdkmonitor: Gdk.Monitor,
  index: number = 0
) {
  let win: Astal.Window
  let revealer: Gtk.Revealer
  const notifd = AstalNotifd.get_default()
  const [notifications, setNotifications] = createState<
    AstalNotifd.Notification[]
  >(notifd.get_notifications())

  let selectedIndex = 0
  let buttonRefs = new Map<number, Gtk.Button>()

  const dismiss = (id: number) => {
    const notification = notifications().find((n) => n.id === id)
    if (notification) notification.dismiss()
    setNotifications((ns) => ns.filter((n) => n.id !== id))
    buttonRefs.delete(id)
    const len = notifications().length
    if (selectedIndex >= len) {
      selectedIndex = Math.max(0, len - 1)
    }
  }

  const clearAll = () => {
    const ns = notifications()
    setNotifications([])
    selectedIndex = 0
    buttonRefs.clear()
    ns.forEach((n) => n.dismiss())
  }

  const focus = (i: number) => {
    const ns = notifications()
    const len = ns.length
    if (len === 0) return
    selectedIndex = (i + len) % len
    const id = ns[selectedIndex]?.id
    if (id !== undefined) buttonRefs.get(id)?.grab_focus()
  }

  function onKey(_source: Gtk.EventControllerKey, keyval: number) {
    if (keyval === Gdk.KEY_Escape || keyval === Gdk.KEY_q) {
      win.visible = false
    }
    if (keyval === Gdk.KEY_j || keyval === Gdk.KEY_Down)
      focus(selectedIndex + 1)
    if (keyval === Gdk.KEY_k || keyval === Gdk.KEY_Up) focus(selectedIndex - 1)
    if (keyval === Gdk.KEY_d || keyval === Gdk.KEY_Delete) {
      const ns = notifications()
      if (ns[selectedIndex]) dismiss(ns[selectedIndex].id)
    }
    if (keyval === Gdk.KEY_Return) {
      const ns = notifications()
      if (ns[selectedIndex]) dismiss(ns[selectedIndex].id)
    }
  }

  const notifiedHandler = notifd.connect('notified', (_, id, replaced) => {
    const notification = notifd.get_notification(id)
    if (!notification) return

    if (replaced && notifications().some((n) => n.id === id)) {
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
      anchor={
        Astal.WindowAnchor.TOP |
        Astal.WindowAnchor.BOTTOM |
        Astal.WindowAnchor.RIGHT
      }
      application={app}
      keymode={Astal.Keymode.ON_DEMAND}
      onMap={() => (revealer.revealChild = true)}
      onUnmap={() => (revealer.revealChild = false)}
    >
      <Gtk.EventControllerKey onKeyPressed={onKey} />
      <revealer
        $={(self) => (revealer = self)}
        transitionType={Gtk.RevealerTransitionType.SLIDE_LEFT}
        transitionDuration={300}
      >
        <box
          class="notification-center"
          orientation={Gtk.Orientation.VERTICAL}
          widthRequest={380}
        >
          <box class="header" spacing={8}>
            <label
              label="Notificaciones"
              hexpand
              halign={Gtk.Align.START}
              class="title"
            />
            <button
              class="close"
              onClicked={() => (win.visible = false)}
              cursor={Gdk.Cursor.new_from_name('pointer', null)}
            >
              <image iconName="close" />
            </button>
            <button
              class="clear-all"
              onClicked={clearAll}
              visible={notifications((ns) => ns.length > 0)}
              cursor={Gdk.Cursor.new_from_name('pointer', null)}
            >
              <image iconName="edit-clear-all-symbolic" />
            </button>
          </box>
          <Gtk.Separator visible />
          <scrolledwindow hexpand vexpand class="notifications-list">
            <box
              orientation={Gtk.Orientation.VERTICAL}
              class="notifications-container"
            >
              <For each={notifications}>
                {(notification) => (
                  <button
                    $={(self) => {
                      buttonRefs.set(notification.id, self)
                    }}
                    class="notif-btn"
                    onClicked={() => dismiss(notification.id)}
                    cursor={Gdk.Cursor.new_from_name('pointer', null)}
                  >
                    <box
                      class={`Notification ${urgency(notification)}`}
                      orientation={Gtk.Orientation.VERTICAL}
                    >
                      <box class="header">
                        {(notification.appIcon ||
                          isIcon(notification.desktopEntry)) && (
                          <image
                            class="app-icon"
                            visible={Boolean(
                              notification.appIcon || notification.desktopEntry
                            )}
                            iconName={
                              notification.appIcon || notification.desktopEntry
                            }
                          />
                        )}
                        <label
                          class="app-name"
                          halign={Gtk.Align.START}
                          hexpand
                          ellipsize={Pango.EllipsizeMode.END}
                          label={notification.appName || 'Unknown'}
                        />
                        <label class="time" label={time(notification.time)} />
                      </box>
                      <box class="content">
                        {notification.image &&
                          fileExists(notification.image) && (
                            <image
                              valign={Gtk.Align.START}
                              class="image"
                              file={notification.image}
                            />
                          )}
                        {notification.image && isIcon(notification.image) && (
                          <box valign={Gtk.Align.START} class="icon-image">
                            <image
                              iconName={notification.image}
                              halign={Gtk.Align.CENTER}
                              valign={Gtk.Align.CENTER}
                            />
                          </box>
                        )}
                        <box orientation={Gtk.Orientation.VERTICAL} hexpand>
                          <label
                            class="summary"
                            halign={Gtk.Align.START}
                            xalign={0}
                            label={notification.summary}
                            ellipsize={Pango.EllipsizeMode.END}
                          />
                          {notification.body && (
                            <label
                              class="body"
                              wrap
                              useMarkup
                              halign={Gtk.Align.START}
                              xalign={0}
                              label={notification.body}
                            />
                          )}
                        </box>
                      </box>
                      <box class="actions" spacing={6}>
                        <button
                          class="action-btn delete-btn"
                          onClicked={() => dismiss(notification.id)}
                          cursor={Gdk.Cursor.new_from_name('pointer', null)}
                        >
                          <image iconName="user-trash-symbolic" />
                        </button>
                      </box>
                      {notification.actions.length > 0 && (
                        <box class="notif-actions">
                          {notification.actions.map(({ label, id }) => (
                            <button
                              hexpand
                              onClicked={() => notification.invoke(id)}
                              cursor={Gdk.Cursor.new_from_name('pointer', null)}
                            >
                              <label
                                label={label}
                                halign={Gtk.Align.CENTER}
                                hexpand
                              />
                            </button>
                          ))}
                        </box>
                      )}
                    </box>
                  </button>
                )}
              </For>
              <box
                visible={notifications((ns) => ns.length === 0)}
                valign={Gtk.Align.CENTER}
                halign={Gtk.Align.CENTER}
                orientation={Gtk.Orientation.VERTICAL}
                hexpand
                vexpand
                class="empty-info-noti"
              >
                <label class="empty-icon" label="󰂛" />
                <label class="empty-info" label="Sin Notificaciones" />
              </box>
            </box>
          </scrolledwindow>
        </box>
      </revealer>
    </window>
  )
}
