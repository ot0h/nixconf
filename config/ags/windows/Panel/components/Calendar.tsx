import { Gtk } from "ags/gtk4"
import { createState, createComputed } from "gnim"

export default function Calendar() {
  const months = [
    "enero",
    "febrero",
    "marzo",
    "abril",
    "mayo",
    "junio",
    "julio",
    "agosto",
    "septiembre",
    "octubre",
    "noviembre",
    "diciembre",
  ]

  const today = new Date()
  const [date, setDate] = createState({
    d: today.getDate(),
    m: today.getMonth(),
    y: today.getFullYear(),
  })

  const day = createComputed(() => `${date().d}`)

  const monthYear = createComputed(() => `${months[date().m]} ${date().y}`)

  const cal = new Gtk.Calendar()
  cal.mark_day(today.getDate())

  cal.connect("day-selected", () => {
    const d = cal.get_date()
    cal.clear_marks()
    cal.mark_day(d.get_day_of_month())
    setDate({
      d: d.get_day_of_month(),
      m: d.get_month(),
      y: d.get_year(),
    })
  })

  return (
    <box
      orientation={Gtk.Orientation.VERTICAL}
      halign={Gtk.Align.CENTER}
      spacing={0}
      class="calendar-box"
    >
      <box orientation={Gtk.Orientation.VERTICAL} class="calendar-header">
        <label class="calendar-day" label={day()} halign={Gtk.Align.CENTER} />
        <label
          class="calendar-monthyear"
          label={monthYear()}
          halign={Gtk.Align.CENTER}
        />
      </box>
      {cal}
    </box>
  )
}
