/**
 Este template es para hacer rotulos de envios
*/
#let rotulo(empresa: none, persona: [PERSONA], telefono: [TELEFONO], direccion: [DIRECCION], tamañoLetra: 25pt) = {
  // Configuración general del template
  set page(flipped: true, "us-letter", margin: (rest: 1.3in))
  set text(font: "Iosevka", weight: "regular", tamañoLetra)


  /** --> Variables <-- */
  // Esto es para la persona que va dirigida el paquete
  align(left)[
    // Si se coloco la Empresa se va mostrar el nombre, o si no, aparecera la persona
    #text(weight: "bold", if empresa != none {
      "EMPRESA: "
      (text(weight: "regular", empresa))
    } else {
      "PERSONA: "
      (text(weight: "regular", persona))
    })
    #v(0em)
    // Direccion
    #text(weight: "bold", if direccion != none { "DIRECCION:" })
    #text(direccion)
    #v(0em)
    // Si se coloco la empresa va aparecer la persona pero como de atención
    #text(weight: "bold", if empresa != none {
      if persona != none {
        "ATENCION: "
        (text(weight: "regular", persona))
        (v(0em))
      }
    })
    // Telefono
    #text(weight: "bold", "TELEFONO:")
    #text(telefono)
    #v(2em)

    // Esto es de la empresa SYSCOM
    #text(weight: "bold", "DE: SYSCOM")
    #v(0em)
    #text(weight: "bold", "DIRECCION:")
    #text("San Pedro Sula, Villaflorencia, 19 y 20 Calle, 9 avenida #1914")
    #v(0em)
    #text(weight: "bold", "TELEFONO:")
    #text("9478-6491")
  ]
}

#show: rotulo(
  empresa: "CORPORACION DINANT",
  direccion: "Toco, Trujillo",
  persona: "Raul Moncada",
  telefono: "9430-7900",
)
