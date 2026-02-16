import { createPoll } from "ags/time"

function formatVertical(name: string): string {
  return name.split("").join("\n")
}

function iconFor(name: string): string {
  switch (name) {
    case "resize":
      return "󰩨 "
    case "move":
      return "󰆾 "
    case "launch":
      return "󱓞 "
    case "zoom":
      return " "
    default:
      return " "
  }
}

export const getSubmapHyprland = createPoll(
  { raw: "default", text: "", icon: "" },
  300,
  "hyprctl submap",
  (out, prev) => {
    const raw = out.replace("submap:", "").trim()

    if (raw === "default") {
      return { raw, text: "", icon: "" }
    }

    return {
      raw,
      text: formatVertical(raw),
      icon: iconFor(raw),
    }
  },
)
