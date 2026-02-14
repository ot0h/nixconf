import "./utils/autoReload.ts"
import app from "ags/gtk4/app"
import styles from "./styles.scss"
import Sidebar from "./windows/Bars/Sidebar/Sidebar.js"
import Panel from "./windows/Panel/Panel.js"
import NotificationPopups from "./windows/Notifications/NotificationPopups.js"

app.start({
  css: styles,
  main() {
    NotificationPopups()
    app.get_monitors().forEach((monitor) => {
      Sidebar(monitor)
      Panel(monitor)
    })
  },
})
