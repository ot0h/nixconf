import { getSubmapHyprland } from '@utils'
import { For } from 'gnim'

function splitForRender(str: string): string[] {
  return [...str].reverse().map((c, i) => `${c}\u200B${i}`)
}
export default function Submap() {
  return (
    <revealer revealChild={getSubmapHyprland.as((s) => s.raw !== 'default')}>
      <box orientation={1} class="submap">
        {/* Icono primero */}
        <label
          class="submap-icon"
          label={getSubmapHyprland.as((s) => s.icon)}
        />

        {/* Luego las letras */}
        <For each={getSubmapHyprland.as((s) => splitForRender(s.raw))}>
          {(char: string) => (
            <label
              class="submap-letter"
              label={char.replace(/\u200B\d+$/, '')}
            />
          )}
        </For>
      </box>
    </revealer>
  )
}
