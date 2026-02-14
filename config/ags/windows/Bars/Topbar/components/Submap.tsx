import { getSubmapHyprland } from "../../../../utils"

export default function Submap() {
  return (
    <revealer revealChild={getSubmapHyprland.as((s) => s.raw !== "default")}>
      <box class="submap">
        <label
          class="submap-icon"
          label={getSubmapHyprland.as((s) => s.icon)}
        />
        <label
          class="submap-text"
          label={getSubmapHyprland.as((s) => s.text)}
        />
      </box>
    </revealer>
  )
}
