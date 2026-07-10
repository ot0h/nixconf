import { exec, execAsync } from 'ags/process'
import Astal from 'gi://Astal?version=4.0'
import AstalAuth from 'gi://AstalAuth?version=0.1'
import { createState } from 'gnim'

type InputsEntryProps = {
  placeholder: string
  onSubmit: (value: string) => void
}

const InputsEntry = ({ placeholder, onSubmit }: InputsEntryProps) => {
  const [text, setText] = createState('')

  return (
    <box>
      <entry
        placeholderText={placeholder}
        visibility={false}
        text={text}
        onNotifyText={(self) => setText(self.text)}
        onActivate={(self) => onSubmit(self.text)}
      />
    </box>
  )
}

const [invisible, setInvisible] = createState(false)
export default function Lock() {
  function tryUnlock(password: string) {
    const pam = new AstalAuth.Pam()

    pam.connect('success', () => {
      print('Autenticado, desbloqueando...')
      setInvisible(false)
    })

    pam.connect('fail', (_pam, msg: string) => {
      print('Falló:', msg)
    })

    pam.start_authenticate()
    pam.supply_secret(password)
  }

  return (
    <window visible={invisible} keymode={Astal.Keymode.EXCLUSIVE}>
      <InputsEntry placeholder="Contraseña" onSubmit={tryUnlock} />
    </window>
  )
}
