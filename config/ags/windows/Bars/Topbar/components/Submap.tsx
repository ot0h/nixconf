import { getSubmapHyprland } from "../../../../utils"

function formatText(name: string, mode: "vertical" | "horizontal") {
  if (mode === "vertical") {
    return name.split("").join("\n")
  }
  return name
}

export default function Submap() {
  const mode: "vertical" | "horizontal" = "horizontal"

  return (
    <revealer revealChild={getSubmapHyprland.as((s) => s.raw !== "default")}>
      <box class="submap">
        <label
          class="submap-icon"
          label={getSubmapHyprland.as((s) => s.icon)}
        />
        <label
          class="submap-text"
          label={getSubmapHyprland.as((s) => formatText(s.raw, mode))}
        />
      </box>
    </revealer>
  )
}
