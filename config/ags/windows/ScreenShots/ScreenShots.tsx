import { Astal, Gtk, Gdk } from "ags/gtk4"
import app from "ags/gtk4/app"
import { execAsync } from "ags/process"
import { createState } from "ags"
import GLib from "gi://GLib"

const { TOP, BOTTOM, LEFT, RIGHT } = Astal.WindowAnchor
const SCREENSHOT_DIR = `${GLib.get_home_dir()}/Pictures/Screenshots`

type Mode = "normal" | "clipboard"
type PickerFormat = "hex" | "rgb"

export default function ScreenShots(
  gdkmonitor: Gdk.Monitor,
  index: number = 0,
) {
  let win: Astal.Window
  const [mode, setMode] = createState<Mode>("normal")
  const [pickerFormat, setPickerFormat] = createState<PickerFormat>("hex")

  const toggleMode = () =>
    setMode((m) => (m === "normal" ? "clipboard" : "normal"))
  const togglePickerFormat = () =>
    setPickerFormat((f) => (f === "hex" ? "rgb" : "hex"))

  const botonesNormal = [
    {
      icon: "",
      label: "  Full",
      action: () => {
        win.visible = false
        execAsync(["hyprshot", "-m", "output", "-o", SCREENSHOT_DIR]).catch(
          console.log,
        )
      },
    },
    {
      icon: "󰩬",
      label: "Región",
      action: () => {
        win.visible = false
        execAsync(["hyprshot", "-m", "region", "-o", SCREENSHOT_DIR]).catch(
          console.log,
        )
      },
    },
    {
      icon: "󰖯",
      label: "Ventana",
      action: () => {
        win.visible = false
        execAsync(["hyprshot", "-m", "window", "-o", SCREENSHOT_DIR]).catch(
          console.log,
        )
      },
    },
  ]

  const botonesClipboard = [
    {
      icon: "",
      label: "  Full",
      action: () => {
        win.visible = false
        execAsync(["hyprshot", "-m", "output", "--clipboard-only"]).catch(
          console.log,
        )
      },
    },
    {
      icon: "󰩬",
      label: "Región",
      action: () => {
        win.visible = false
        execAsync(["hyprshot", "-m", "region", "--clipboard-only"]).catch(
          console.log,
        )
      },
    },
    {
      icon: "󰖯",
      label: "Ventana",
      action: () => {
        win.visible = false
        execAsync(["hyprshot", "-m", "window", "--clipboard-only"]).catch(
          console.log,
        )
      },
    },
    {
      icon: "",
      label: pickerFormat((f) => `Picker: (${f.toUpperCase()})`),
      action: () => {
        win.visible = false
        GLib.timeout_add(GLib.PRIORITY_DEFAULT, 1000, () => {
          execAsync([
            "hyprpicker",
            "--autocopy",
            `--format=${pickerFormat.get()}`,
            "--notify",
          ]).catch(console.log)
          return GLib.SOURCE_REMOVE
        })
      },
    },
  ]

  let selectedIndex = 1
  let buttonRefsNormal: Gtk.Button[] = []
  let buttonRefsClipboard: Gtk.Button[] = []

  const getBotones = () =>
    mode.get() === "normal" ? botonesNormal : botonesClipboard

  const focus = (index: number) => {
    const list = getBotones()
    const refs =
      mode.get() === "normal" ? buttonRefsNormal : buttonRefsClipboard
    selectedIndex = (index + list.length) % list.length
    refs[selectedIndex]?.grab_focus()
  }

  function onKey(_e: Gtk.EventControllerKey, keyval: number) {
    if (keyval === Gdk.KEY_Right || keyval === Gdk.KEY_l)
      focus(selectedIndex + 1)
    if (keyval === Gdk.KEY_Left || keyval === Gdk.KEY_h)
      focus(selectedIndex - 1)
    if (keyval === Gdk.KEY_Return) getBotones()[selectedIndex]?.action()
    if (keyval === Gdk.KEY_Tab) {
      toggleMode()
      selectedIndex = 1
      GLib.timeout_add(GLib.PRIORITY_DEFAULT, 10, () => {
        focus(1)
        return GLib.SOURCE_REMOVE
      })
    }
    if (
      keyval === Gdk.KEY_space &&
      mode.get() === "clipboard" &&
      selectedIndex === botonesClipboard.length - 1
    )
      togglePickerFormat()
    if (keyval === Gdk.KEY_Escape || keyval === Gdk.KEY_q) win.visible = false
  }

  return (
    <window
      $={(self) => (win = self)}
      name={`Screenshot-${index}`}
      class="Screenshot"
      visible={false}
      gdkmonitor={gdkmonitor}
      exclusivity={Astal.Exclusivity.IGNORE}
      anchor={TOP | BOTTOM | LEFT | RIGHT}
      application={app}
      keymode={Astal.Keymode.EXCLUSIVE}
      onMap={() => focus(1)}
    >
      <Gtk.EventControllerKey onKeyPressed={onKey} />
      <box halign={Gtk.Align.CENTER} valign={Gtk.Align.CENTER} hexpand vexpand>
        <box
          class="screenshot-container"
          orientation={Gtk.Orientation.VERTICAL}
          spacing={24}
          halign={Gtk.Align.CENTER}
        >
          {/* indicador de modo */}
          <box spacing={8} halign={Gtk.Align.CENTER}>
            <button
              class={mode(
                (m) => `mode-indicator ${m === "normal" ? "active" : ""}`,
              )}
              cursor={Gdk.Cursor.new_from_name("pointer", null)}
              onClicked={() => setMode("normal")}
            >
              <label label="󰉉 Guardar" />
            </button>
            <label label="|" class="mode-separator" />
            <button
              class={mode(
                (m) => `mode-indicator ${m === "clipboard" ? "active" : ""}`,
              )}
              cursor={Gdk.Cursor.new_from_name("pointer", null)}
              onClicked={() => setMode("clipboard")}
            >
              <label label="󰅍 Clipboard" />
            </button>
            <label label="(Tab)" class="mode-hint" />
          </box>

          {/* botones modo normal */}
          <box
            visible={mode((m) => m === "normal")}
            orientation={Gtk.Orientation.HORIZONTAL}
            spacing={24}
            halign={Gtk.Align.CENTER}
          >
            {botonesNormal.map(({ icon, label, action }, i) => (
              <button
                $={(self) => {
                  buttonRefsNormal[i] = self
                }}
                onClicked={action}
                halign={Gtk.Align.CENTER}
                cursor={Gdk.Cursor.new_from_name("pointer", null)}
              >
                <Gtk.EventControllerMotion onEnter={() => focus(i)} />
                <box
                  orientation={Gtk.Orientation.VERTICAL}
                  spacing={8}
                  halign={Gtk.Align.CENTER}
                >
                  <label
                    label={icon}
                    class="screenshot-icon"
                    halign={Gtk.Align.CENTER}
                  />
                  <label
                    label={label}
                    class="screenshot-label"
                    halign={Gtk.Align.CENTER}
                  />
                </box>
              </button>
            ))}
          </box>

          {/* botones modo clipboard */}
          <box
            visible={mode((m) => m === "clipboard")}
            orientation={Gtk.Orientation.HORIZONTAL}
            spacing={24}
            halign={Gtk.Align.CENTER}
          >
            {botonesClipboard.map(({ icon, label, action }, i) => (
              <button
                $={(self) => {
                  buttonRefsClipboard[i] = self
                }}
                onClicked={action}
                halign={Gtk.Align.CENTER}
                cursor={Gdk.Cursor.new_from_name("pointer", null)}
              >
                <Gtk.EventControllerMotion onEnter={() => focus(i)} />
                <box
                  orientation={Gtk.Orientation.VERTICAL}
                  spacing={8}
                  halign={Gtk.Align.CENTER}
                >
                  <label
                    label={icon}
                    class="screenshot-icon"
                    halign={Gtk.Align.CENTER}
                  />
                  <label
                    label={label}
                    class="screenshot-label"
                    halign={Gtk.Align.CENTER}
                  />
                  {i === botonesClipboard.length - 1 && (
                    <label
                      label="(C+Space)"
                      class="picker-hint"
                      halign={Gtk.Align.CENTER}
                    />
                  )}
                </box>
              </button>
            ))}
          </box>

          {/* path */}
          <label
            class="screenshot-path"
            label={mode((m) =>
              m === "normal" ? `󰉋 ${SCREENSHOT_DIR}` : "󰅍 Solo clipboard",
            )}
            halign={Gtk.Align.CENTER}
          />
        </box>
      </box>
    </window>
  )
}
