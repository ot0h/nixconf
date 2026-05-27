import { Gtk } from "ags/gtk4"
import AstalMpris from "gi://AstalMpris?version=0.1"
import AstalCava from "gi://AstalCava"
import Gdk from "gi://Gdk?version=4.0"
import { createBinding, createComputed, For } from "gnim"

const BROWSERS = [
  "firefox",
  "chrome",
  "mozilla zen",
  "brave",
  "chromium",
  "zen-beta",
  "helium",
]
const isBrowser = (id: string) =>
  BROWSERS.some((b) => id?.toLowerCase().includes(b))

const cava = AstalCava.get_default()
cava?.set_bars(20)
cava?.set_framerate(60)
cava?.set_stereo(false)
cava?.set_autosens(true)
cava?.set_noise_reduction(0.77)

export default function MediaPlayer() {
  const mpris = AstalMpris.get_default()
  const players = createBinding(mpris, "players")
  const playerCount = createComputed(() => players()?.length ?? 0)

  let stack: Gtk.Stack
  const pages = new Map<string, Gtk.Widget>()

  return (
    <box
      class="mpris-container"
      orientation={Gtk.Orientation.VERTICAL}
      hexpand
      visible={playerCount((n) => n > 0)}
    >
      <stack
        $={(self) => (stack = self)}
        transitionType={Gtk.StackTransitionType.SLIDE_LEFT_RIGHT}
        transitionDuration={300}
        hexpand={false}
        vexpand={false}
        class="mpris-stack"
      >
        <For each={players}>
          {(player) => {
            const bus = createBinding(player, "busName")
            const identity = createBinding(player, "identity")
            const status = createBinding(player, "playbackStatus")

            return (
              <box
                class="card-a"
                orientation={Gtk.Orientation.VERTICAL}
                hexpand={false}
                width_request={200}
                $={(self) => {
                  const key = bus.peek()
                  pages.set(key, self)

                  status((s) => {
                    if (
                      (s === AstalMpris.PlaybackStatus.PLAYING ||
                        s === AstalMpris.PlaybackStatus.PAUSED ||
                        s === AstalMpris.PlaybackStatus.STOPPED) &&
                      stack
                    ) {
                      stack.set_visible_child(self)
                    }
                  })

                  self.connect("destroy", () => {
                    pages.delete(key)
                    const first = stack.get_first_child()
                    if (first) stack.set_visible_child(first)
                  })
                }}
              >
                <box
                  class="cover-wrapper"
                  halign={Gtk.Align.CENTER}
                  overflow={Gtk.Overflow.HIDDEN}
                >
                  <image
                    class="cover-art"
                    pixelSize={170}
                    file={createBinding(player, "coverArt")}
                  />
                </box>

                {/* Info + controles */}
                <box
                  class="card-a-info"
                  orientation={Gtk.Orientation.VERTICAL}
                  spacing={2}
                >
                  <box orientation={Gtk.Orientation.HORIZONTAL} spacing={4}>
                    <label
                      class="now-playing-tag"
                      label="playing now"
                      xalign={0}
                      hexpand
                    />
                    <label
                      class="cover-badge"
                      label={identity}
                      ellipsize={3}
                      max_width_chars={10}
                      xalign={1}
                    />
                  </box>

                  {/* Cava — justo debajo del badge de identidad */}
                  <label
                    class="cava-bars"
                    xalign={Gtk.Align.CENTER}
                    $={(self) => {
                      const chars = ["▁", "▂", "▃", "▄", "▅", "▆", "▇", "█"]
                      cava?.connect("notify::values", () => {
                        const values = cava.get_values() as number[]
                        const text = values
                          .map(
                            (v) =>
                              chars[
                                Math.min(
                                  Math.floor(v * chars.length),
                                  chars.length - 1,
                                )
                              ],
                          )
                          .join("")
                        self.set_label(text)
                      })
                    }}
                  />

                  <label
                    class="card-a-title"
                    visible={identity((id) => !isBrowser(id ?? ""))}
                    label={createBinding(player, "title")}
                    ellipsize={3}
                    max_width_chars={20}
                    xalign={0}
                  />
                  <label
                    class="card-a-artist"
                    label={createBinding(player, "artist")}
                    ellipsize={3}
                    max_width_chars={20}
                    xalign={0}
                  />

                  <box
                    class="card-a-controls"
                    spacing={0}
                    halign={Gtk.Align.CENTER}
                  >
                    <button
                      cursor={Gdk.Cursor.new_from_name("pointer", null)}
                      class="ctrl-side"
                      onClicked={() => player.previous()}
                      visible={createBinding(player, "canGoPrevious")}
                    >
                      <label label="󰒮" />
                    </button>

                    <button
                      cursor={Gdk.Cursor.new_from_name("pointer", null)}
                      class="ctrl-play"
                      onClicked={() => player.play_pause()}
                    >
                      <label
                        valign={Gtk.Align.CENTER}
                        label={status((s) =>
                          s === AstalMpris.PlaybackStatus.PLAYING ? "" : "󰐎",
                        )}
                      />
                    </button>

                    <button
                      class="ctrl-side"
                      cursor={Gdk.Cursor.new_from_name("pointer", null)}
                      onClicked={() => player.next()}
                    >
                      <label label="󰒭" />
                    </button>
                  </box>

                  <box
                    class="dots-box"
                    spacing={5}
                    halign={Gtk.Align.CENTER}
                    visible={playerCount((n) => n > 1)}
                  >
                    <For each={players}>
                      {(p) => {
                        const pBus = createBinding(p, "busName")
                        return (
                          <button
                            class="dot-btn"
                            onClicked={() => {
                              const page = pages.get(pBus.peek())
                              if (page) stack.set_visible_child(page)
                            }}
                            cursor={Gdk.Cursor.new_from_name("pointer", null)}
                          >
                            <box class="dot" halign={Gtk.Align.CENTER} />
                          </button>
                        )
                      }}
                    </For>
                  </box>
                </box>
              </box>
            )
          }}
        </For>
      </stack>
    </box>
  )
}
