import { Gtk } from "ags/gtk4"
import AstalMpris from "gi://AstalMpris?version=0.1"
import { createBinding, createComputed, For } from "gnim"

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
      spacing={8}
      visible={playerCount((n) => n > 0)}
    >
      {/* STACK */}
      <stack
        $={(self) => (stack = self)}
        transitionType={Gtk.StackTransitionType.SLIDE_LEFT_RIGHT}
        hexpand
        vexpand
        class="stack"
      >
        <For each={players}>
          {(player) => {
            const bus = createBinding(player, "busName")
            const identity = createBinding(player, "identity")

            return (
              <box
                class="card-player"
                $={(self) => {
                  const key = bus.peek()
                  pages.set(key, self)

                  // auto-focus al que esté reproduciendo
                  createBinding(
                    player,
                    "playbackStatus",
                  )((status) => {
                    if (status === AstalMpris.PlaybackStatus.PLAYING && stack) {
                      stack.set_visible_child(self)
                    }
                  })

                  // limpieza cuando desaparece
                  self.connect("destroy", () => {
                    pages.delete(key)
                    const first = stack.get_first_child()
                    if (first) stack.set_visible_child(first)
                  })
                }}
                spacing={10}
                orientation={Gtk.Orientation.VERTICAL}
              >
                {/* Cover */}
                <box
                  halign={Gtk.Align.CENTER}
                  overflow={Gtk.Overflow.HIDDEN}
                  css="border-radius:12px;"
                >
                  <image
                    pixelSize={120}
                    file={createBinding(player, "coverArt")}
                  />
                </box>

                {/* Info */}
                <box
                  orientation={Gtk.Orientation.VERTICAL}
                  halign={Gtk.Align.CENTER}
                >
                  {/* Título oculto si es navegador */}
                  <label
                    class="title"
                    visible={identity(
                      (id) =>
                        !id?.toLowerCase().includes("firefox") &&
                        !id?.toLowerCase().includes("chrome") &&
                        !id?.toLowerCase().includes("mozilla zen") &&
                        !id?.toLowerCase().includes("brave"),
                    )}
                    label={createBinding(player, "title")}
                  />

                  <label
                    class="artist"
                    label={createBinding(player, "artist")}
                  />

                  <label class="app" label={identity} />
                </box>

                {/* Controls */}

                <box spacing={16} halign={Gtk.Align.CENTER}>
                  <button
                    onClicked={() => player.previous()}
                    visible={createBinding(player, "canGoPrevious")}
                  >
                    <image iconName="media-skip-backward-symbolic" />
                  </button>

                  <button
                    onClicked={() => player.play_pause()}
                    visible={createBinding(player, "canControl")}
                  >
                    <image
                      iconName="media-playback-start-symbolic"
                      visible={createBinding(
                        player,
                        "playbackStatus",
                      )((s) => s !== AstalMpris.PlaybackStatus.PLAYING)}
                    />
                    <image
                      iconName="media-playback-pause-symbolic"
                      visible={createBinding(
                        player,
                        "playbackStatus",
                      )((s) => s === AstalMpris.PlaybackStatus.PLAYING)}
                    />
                  </button>

                  <button
                    onClicked={() => player.next()}
                    visible={createBinding(player, "canGoNext")}
                  >
                    <image iconName="media-skip-forward-symbolic" />
                  </button>
                </box>
              </box>
            )
          }}
        </For>
      </stack>

      {/* SWITCHER */}
      <box
        spacing={6}
        halign={Gtk.Align.CENTER}
        visible={playerCount((n) => n > 1)}
      >
        <For each={players}>
          {(player) => {
            const bus = createBinding(player, "busName")

            return (
              <button
                class="btnSwitcher"
                onClicked={() => {
                  const page = pages.get(bus.peek())
                  if (page) stack.set_visible_child(page)
                }}
              >
                <label label="" />
              </button>
            )
          }}
        </For>
      </box>
    </box>
  )
}
