import { Astal, Gtk, Gdk } from "ags/gtk4"
import app from "ags/gtk4/app"
import { For, createState } from "ags"
import AstalApps from "gi://AstalApps"
import Graphene from "gi://Graphene"
import GLib from "gi://GLib"
import { execAsync } from "ags/process"

const { TOP, BOTTOM, LEFT, RIGHT } = Astal.WindowAnchor

const TERMINAL_APPS = ["nvim", "vim", "btop", "yazi", "ncspot", "hx"]
const TERMINALS = ["kitty", "alacritty", "foot", "wezterm", "ghostty"]

export default function AppLauncher(
  gdkmonitor: Gdk.Monitor,
  index: number = 0,
) {
  let contentbox: Gtk.Box
  let searchentry: Gtk.Entry
  let win: Astal.Window
  let scrollRef: Gtk.ScrolledWindow
  let buttonRefs: Gtk.Button[] = []

  const apps = new AstalApps.Apps()
  const [list, setList] = createState(new Array<AstalApps.Application>())
  const [selected, setSelected] = createState(0)

  const terminal = GLib.getenv("TERMINAL") ?? "kitty"

  const cleanExec = (exec: string) =>
    exec.replace(/%[uUfFdDnNickvm]/g, "").trim()

  const isTerminalApp = (a: AstalApps.Application) =>
    TERMINAL_APPS.some((t) => a.executable?.includes(t)) ||
    a.categories?.includes("TerminalEmulator") ||
    false

  const isTerminalEmulator = (exec: string) =>
    TERMINALS.some((t) => exec.includes(t))

  const scrollToSelected = (i: number) => {
    const btn = buttonRefs[i]
    if (!btn || !scrollRef) return
    const adj = scrollRef.vadjustment
    const alloc = btn.get_allocation()
    const btnTop = alloc.y
    const btnBottom = alloc.y + alloc.height
    const viewTop = adj.value
    const viewBottom = adj.value + adj.page_size

    if (btnTop < viewTop) adj.value = btnTop
    else if (btnBottom > viewBottom) adj.value = btnBottom - adj.page_size
  }

  const showAll = async () => {
    apps.reload()
    buttonRefs = []
    setList(apps.fuzzy_query(""))
    setSelected(0)
  }

  const launch = (a?: AstalApps.Application) => {
    if (!a) return
    win.hide()

    const exec = cleanExec(a.executable)

    if (isTerminalEmulator(exec)) {
      execAsync(["bash", "-c", `cd ~ && ${exec}`]).catch((e) =>
        execAsync([
          "notify-send",
          "-u",
          "critical",
          `Error al lanzar ${a.name}`,
          String(e),
        ]),
      )
    } else if (isTerminalApp(a)) {
      execAsync(["bash", "-c", `cd ~ && ${terminal} ${exec}`]).catch((e) =>
        execAsync([
          "notify-send",
          "-u",
          "critical",
          `Error al lanzar ${a.name}`,
          String(e),
        ]),
      )
    } else {
      a.launch()
    }
  }

  function onKey(
    _e: Gtk.EventControllerKey,
    keyval: number,
    _: number,
    mod: number,
  ) {
    const isAlt = mod === Gdk.ModifierType.ALT_MASK

    if (keyval === Gdk.KEY_Escape) {
      win.visible = false
      return
    }
    if (keyval === Gdk.KEY_Return) {
      launch(list.get()[selected.get()])
      return
    }

    if (isAlt) {
      for (const i of [1, 2, 3, 4, 5, 6, 7, 8, 9] as const) {
        if (keyval === Gdk[`KEY_${i}`]) return launch(list.get()[i - 1])
      }
    }
  }

  function onClick(_e: Gtk.GestureClick, _: number, x: number, y: number) {
    const [, rect] = contentbox.compute_bounds(win)
    const position = new Graphene.Point({ x, y })
    if (!rect.contains_point(position)) {
      win.visible = false
      return true
    }
  }

  return (
    <window
      $={(self) => (win = self)}
      name={`AppLauncher-${index}`}
      class="AppLauncher"
      visible={false}
      gdkmonitor={gdkmonitor}
      anchor={TOP | BOTTOM | LEFT | RIGHT}
      exclusivity={Astal.Exclusivity.IGNORE}
      keymode={Astal.Keymode.EXCLUSIVE}
      application={app}
    >
      <Gtk.EventControllerKey onKeyPressed={onKey} />
      <Gtk.GestureClick onPressed={onClick} />
      <Gtk.EventControllerScroll
        flags={Gtk.EventControllerScrollFlags.VERTICAL}
        onScroll={(_self, _dx, dy) => {
          setSelected((s) => {
            const next =
              dy > 0
                ? Math.min(s + 1, list.get().length - 1)
                : Math.max(s - 1, 0)
            scrollToSelected(next)
            return next
          })
        }}
      />
      <box
        $={(self) => (contentbox = self)}
        class="launcher-container"
        valign={Gtk.Align.CENTER}
        halign={Gtk.Align.CENTER}
        orientation={Gtk.Orientation.VERTICAL}
        spacing={8}
      >
        <entry
          $={(self) => {
            searchentry = self

            app.connect("window-toggled", async (_, w) => {
              if (w.name === "AppLauncher" && w.visible) {
                apps.reload()
                buttonRefs = []
                setList([])
                self.set_text("")
                self.grab_focus()
              }
            })

            const controller = new Gtk.EventControllerKey()
            controller.connect(
              "key-pressed",
              (
                _e: Gtk.EventControllerKey,
                keyval: number,
                _k: number,
                mod: number,
              ) => {
                const isCtrl = mod === Gdk.ModifierType.CONTROL_MASK

                if (keyval === Gdk.KEY_Tab) {
                  showAll()
                  return true
                }
                if (keyval === Gdk.KEY_Return || keyval === Gdk.KEY_KP_Enter) {
                  launch(list.get()[selected.get()])
                  return true
                }
                if (keyval === Gdk.KEY_Escape) {
                  win.visible = false
                  return true
                }

                if (isCtrl && (keyval === Gdk.KEY_n || keyval === Gdk.KEY_j)) {
                  setSelected((s) => {
                    const next = Math.min(s + 1, list.get().length - 1)
                    scrollToSelected(next)
                    return next
                  })
                  return true
                }
                if (isCtrl && (keyval === Gdk.KEY_p || keyval === Gdk.KEY_k)) {
                  setSelected((s) => {
                    const prev = Math.max(s - 1, 0)
                    scrollToSelected(prev)
                    return prev
                  })
                  return true
                }

                return false
              },
            )
            self.add_controller(controller)
          }}
          class="launcher-search"
          placeholderText="Buscar app... (Tab: todas | Ctrl+Enter: abrir)"
          hexpand
          onNotifyText={async ({ text }) => {
            apps.reload()
            buttonRefs = []
            if (text === "") setList([])
            else setList(apps.fuzzy_query(text))
            setSelected(0)
          }}
        />

        <Gtk.Separator visible={list((l) => l.length > 0)} />

        <scrolledwindow
          $={(self) => (scrollRef = self)}
          vscrollbarPolicy={Gtk.PolicyType.AUTOMATIC}
          hscrollbarPolicy={Gtk.PolicyType.NEVER}
          heightRequest={list((l) => (l.length > 0 ? 600 : 0))}
          visible={list((l) => l.length > 0)}
        >
          <box orientation={Gtk.Orientation.VERTICAL} class="launcher-list">
            <For each={list}>
              {(a, index) => (
                <button
                  $={(self) => (buttonRefs[index.get()] = self)}
                  class={selected(
                    (s) =>
                      `launcher-item ${s === index.get() ? "selected" : ""}`,
                  )}
                  cursor={Gdk.Cursor.new_from_name("pointer", null)}
                  onClicked={() => launch(a)}
                >
                  <Gtk.EventControllerMotion
                    onEnter={() => setSelected(index.get())}
                  />
                  <box spacing={12}>
                    <image iconName={a.iconName} pixelSize={32} />
                    <label
                      label={a.name}
                      halign={Gtk.Align.START}
                      hexpand
                      maxWidthChars={40}
                      wrap
                    />
                    <label
                      class="launcher-shortcut"
                      halign={Gtk.Align.END}
                      label={index((i) => `${i + 1}`)}
                    />
                  </box>
                </button>
              )}
            </For>
          </box>
        </scrolledwindow>
      </box>
    </window>
  )
}
