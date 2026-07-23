import { Gtk } from 'ags/gtk4'
import AstalMpris from 'gi://AstalMpris?version=0.1'
import { createBinding, createComputed, For } from 'gnim'

function formatTime(s: number | null): string {
  if (!s || s < 0) return '0:00'
  const min = Math.floor(s / 60)
  const sec = Math.floor(s % 60)
  return `${min}:${sec.toString().padStart(2, '0')}`
}

export default function Media() {
  const mpris = AstalMpris.get_default()
  const players = createBinding(mpris, 'players')
  const hasPlayers = createComputed(() => (players()?.length ?? 0) > 0)

  return (
    <box
      class="lockscreen-media"
      orientation={Gtk.Orientation.VERTICAL}
      spacing={8}
      halign={Gtk.Align.CENTER}
      visible={hasPlayers}
    >
      <For each={players}>
        {(player) => {
          const coverArt = createBinding(player, 'coverArt')
          const title = createBinding(player, 'title')
          const artist = createBinding(player, 'artist')
          const position = createBinding(player, 'position')
          const length = createBinding(player, 'length')

          return (
            <box
              orientation={Gtk.Orientation.VERTICAL}
              spacing={4}
              halign={Gtk.Align.CENTER}
            >
              <image
                class="media-coverart"
                file={coverArt}
                visible={coverArt((art) => !!art)}
                pixelSize={170}
              />
              <label
                class="media-title"
                label={title}
                maxWidthChars={30}
                ellipsize={3}
                halign={Gtk.Align.CENTER}
              />
              <label
                class="media-artist"
                label={artist}
                maxWidthChars={30}
                ellipsize={3}
                halign={Gtk.Align.CENTER}
              />
              <box spacing={8} halign={Gtk.Align.CENTER}>
                <label
                  class="media-time"
                  label={position((pos) => formatTime(pos))}
                />
                <Gtk.ProgressBar
                  class="media-progress"
                  widthRequest={150}
                  $={(self) => {
                    const update = () => {
                      const pos = player.position
                      const len = player.length
                      self.fraction =
                        len > 0 && pos >= 0 ? Math.min(pos / len, 1) : 0
                    }
                    player.connect('notify::position', update)
                    player.connect('notify::length', update)
                    update()
                  }}
                />
                <label
                  class="media-time"
                  label={length((len) => formatTime(len))}
                />
              </box>
            </box>
          )
        }}
      </For>
    </box>
  )
}
