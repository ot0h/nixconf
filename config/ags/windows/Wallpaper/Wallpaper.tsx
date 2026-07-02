import app from 'ags/gtk4/app'
import { Astal, Gdk, Gtk } from 'ags/gtk4'
import GLib from 'gi://GLib'
import { execAsync } from 'ags/process'
import { createState, createComputed, For } from 'gnim'

const WALLPAPER_DIR = `${GLib.get_home_dir()}/Pictures/Wallpapers`
const WALLPAPER_SCRIPT = `${GLib.get_home_dir()}/scripts/wallpaper.sh`

const VALID_EXTS = ['.jpg', '.jpeg', '.png']
const MAX_COLS = 6

async function loadWallpapers(): Promise<string[]> {
  try {
    const out = await execAsync([
      'bash',
      '-c',
      `ls -1 ${WALLPAPER_DIR} 2>/dev/null`,
    ])
    const all = out.trim().split('\n').filter(Boolean)
    const images = all.filter((f) =>
      VALID_EXTS.some((ext) => f.toLowerCase().endsWith(ext))
    )
    // Sort numérico: 1, 2, ..., 10, 11, ...
    return images
      .map((f) => `${WALLPAPER_DIR}/${f}`)
      .sort((a, b) => a.localeCompare(b, undefined, { numeric: true }))
  } catch {
    return []
  }
}

export default function WallpaperPicker(
  monitor: Gdk.Monitor,
  index: number = 0
) {
  const geo = monitor.get_geometry()
  const winW = 720
  const winH = 520
  const centerX = Math.floor((geo.width - winW) / 2)
  const centerY = Math.floor((geo.height - winH) / 2)

  const [walls, setWalls] = createState<string[]>([])
  const [current, setCurrent] = createState<string>('')
  const [selectedIdx, setSelectedIdx] = createState<number>(0)
  const [mouseActive, setMouseActive] = createState<boolean>(false)

  const self_win = () => app.get_window(`WallpaperPicker-${index}`)

  let btnRefs: Gtk.Button[] = []
  let flowBox: Gtk.FlowBox | null = null
  let cursorHidden = false
  const noneCursor = Gdk.Cursor.new_from_name('none', null)

  function showCursor() {
    if (cursorHidden) {
      self_win()?.set_cursor(null)
      cursorHidden = false
    }
  }

  function hideCursor() {
    if (!cursorHidden) {
      self_win()?.set_cursor(noneCursor)
      cursorHidden = true
    }
  }

  function getCols(): number {
    if (!flowBox) return MAX_COLS
    const w = flowBox.get_allocated_width()
    if (w <= 0) return MAX_COLS
    const first = flowBox.get_child_at_index(0)
    if (!first) return MAX_COLS
    const alloc = first.get_allocation()
    if (alloc.width <= 0) return MAX_COLS
    const spacing = 8
    return Math.max(
      1,
      Math.min(MAX_COLS, Math.floor((w + spacing) / (alloc.width + spacing)))
    )
  }

  function scrollToIdx(idx: number) {
    if (!flowBox || idx < 0) return
    const child = flowBox.get_child_at_index(idx)
    if (!child) return
    let sw: Gtk.Widget | null = child.get_parent()
    while (sw && !(sw instanceof Gtk.ScrolledWindow)) {
      sw = sw.get_parent()
    }
    if (!sw) return
    const adj = (sw as Gtk.ScrolledWindow).get_vadjustment()
    if (!adj) return
    const alloc = child.get_allocation()
    const pageSize = adj.get_page_size()
    const curVal = adj.get_value()
    if (alloc.y < curVal || alloc.y + alloc.height > curVal + pageSize) {
      adj.set_value(Math.max(0, alloc.y - 16))
    }
  }

  execAsync(['bash', '-c', `cat ${GLib.get_home_dir()}/.wallpaper`])
    .then((w) => setCurrent(w.trim()))
    .catch(() => {})

  loadWallpapers().then((paths) => {
    setWalls(paths)
    setSelectedIdx(0)
    // Dar tiempo a For para crear los hijos y luego enfocar
    GLib.timeout_add(GLib.PRIORITY_DEFAULT, 10, () => {
      btnRefs[0]?.grab_focus()
      return GLib.SOURCE_REMOVE
    })
  })

  const n = () => walls().length
  const cols = () => Math.min(n(), getCols())
  const rootClass = createComputed(
    () => `wp-root${!mouseActive() ? ' keyboard-focus' : ''}`
  )

  function focus(dx: number, dy: number) {
    setSelectedIdx((prev) => {
      const total = n()
      if (total === 0) return prev
      const c = cols()
      const row = Math.floor(prev / c)
      const col = prev % c
      const maxRow = Math.max(0, Math.ceil(total / c) - 1)
      const newRow = Math.max(0, Math.min(maxRow, row + dy))
      const maxColAtRow = Math.min(c - 1, total - 1 - newRow * c)
      const newCol = Math.max(0, Math.min(maxColAtRow, col + dx))
      const next = newRow * c + newCol
      btnRefs[next]?.grab_focus()
      scrollToIdx(next)
      return next
    })
  }

  function applyWallpaper(path: string) {
    if (!path) return
    setCurrent(path)
    self_win()!.visible = false
    execAsync(['bash', WALLPAPER_SCRIPT, path])
      .then(() => {
        execAsync(['bash', '-c', 'hyprctl reload']).catch(console.error)
      })
      .catch(console.error)
  }

  function applySelected() {
    applyWallpaper(walls()[selectedIdx()])
  }

  function onKeyPressed(_src: Gtk.EventControllerKey, keyval: number) {
    let handled = false
    if (keyval === Gdk.KEY_Escape || keyval === Gdk.KEY_q) {
      self_win()!.visible = false
      handled = true
    } else if (keyval === Gdk.KEY_h || keyval === Gdk.KEY_Left) {
      focus(-1, 0)
      handled = true
    } else if (keyval === Gdk.KEY_l || keyval === Gdk.KEY_Right) {
      focus(1, 0)
      handled = true
    } else if (keyval === Gdk.KEY_k || keyval === Gdk.KEY_Up) {
      focus(0, -1)
      handled = true
    } else if (keyval === Gdk.KEY_j || keyval === Gdk.KEY_Down) {
      focus(0, 1)
      handled = true
    } else if (
      keyval === Gdk.KEY_Return ||
      keyval === Gdk.KEY_KP_Enter ||
      keyval === Gdk.KEY_space
    ) {
      applySelected()
      handled = true
    }

    if (handled) {
      hideCursor()
      if (mouseActive()) setMouseActive(false)
    }
    return handled
  }

  return (
    <window
      name={`WallpaperPicker-${index}`}
      class="WallpaperPicker"
      gdkmonitor={monitor}
      application={app}
      defaultWidth={winW}
      defaultHeight={winH}
      anchor={Astal.WindowAnchor.TOP | Astal.WindowAnchor.LEFT}
      marginTop={centerY}
      marginLeft={centerX}
      layer={Astal.Layer.OVERLAY}
      keymode={Astal.Keymode.EXCLUSIVE}
      visible={false}
      onMap={() => {
        setMouseActive(false)
        showCursor()
        btnRefs[selectedIdx()]?.grab_focus()
      }}
    >
      <Gtk.EventControllerKey onKeyPressed={onKeyPressed} />
      <Gtk.EventControllerMotion
        onMotion={() => {
          showCursor()
          if (!mouseActive()) setMouseActive(true)
        }}
      />

      <box class={rootClass} orientation={Gtk.Orientation.VERTICAL} spacing={8}>
        <box class="wp-header" spacing={8}>
          <label
            class="wp-title"
            label="Wallpapers"
            hexpand
            xalign={Gtk.Align.CENTER}
          />
          <button
            class="wp-close"
            cursor={Gdk.Cursor.new_from_name('pointer', null)}
            onClicked={() => (self_win()!.visible = false)}
          >
            <label label="" />
          </button>
        </box>

        <scrolledwindow
          hexpand
          vexpand
          hscrollbarPolicy={Gtk.PolicyType.NEVER}
          vscrollbarPolicy={Gtk.PolicyType.AUTOMATIC}
        >
          <Gtk.FlowBox
            class="wp-grid"
            homogeneous
            columnSpacing={8}
            rowSpacing={8}
            maxChildrenPerLine={MAX_COLS}
            minChildrenPerLine={2}
            selectionMode={Gtk.SelectionMode.NONE}
            $={(self) => {
              flowBox = self
            }}
          >
            <For each={walls}>
              {(path, idx) => {
                const btnClass = createComputed(
                  () =>
                    `wp-thumb${current() === path ? ' active' : ''}${!mouseActive() && selectedIdx() === idx() ? ' focused' : ''}`
                )
                return (
                  <Gtk.FlowBoxChild class="wp-child">
                    <button
                      class={btnClass}
                      cursor={Gdk.Cursor.new_from_name('pointer', null)}
                      $={(self) => {
                        btnRefs[idx()] = self
                      }}
                      onClicked={() => applyWallpaper(path)}
                    >
                      <Gtk.Picture
                        class="wp-image"
                        $={(self) => self.set_filename(path)}
                        widthRequest={160}
                        heightRequest={100}
                        contentFit={Gtk.ContentFit.COVER}
                      />
                    </button>
                  </Gtk.FlowBoxChild>
                )
              }}
            </For>
          </Gtk.FlowBox>
        </scrolledwindow>
      </box>
    </window>
  )
}
