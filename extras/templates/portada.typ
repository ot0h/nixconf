/**
 Template para Portadas Universitarias
*/
#let portada(
  asignatura: [asignatura],
  seccion: [seccion],
  tarea: [tarea],
  docente: [docente],
  grupal: false,
  size: 12pt,
  grupo: none,
  font: "Pixel Code",
) = {
  set page(fill: rgb("#FFF"), margin: (rest: 1.0in), "us-letter")
  set text(font: font, size: size)
  set heading(numbering: "1.1.1")

  // --- ENCABEZADO ---
  align(center)[
    #image("./imagenes/logo-ceutec.png", width: 50%)
    #v(0em)
    #text(size: 22pt, weight: "bold", "Centro Universitario Tecnologico")
    #v(0em)
    #text(size: 22pt, weight: "bold", "CEUTEC")
    #v(0em)
    #emph(text(size: 20pt, weight: "bold", asignatura))\
    #emph(text(size: 18pt, weight: "light", "SEC."))
    #emph(text(size: 18pt, weight: "light", seccion))
    #v(1em)
  ]

  // --- CUERPO ---
  align(left)[
    #v(2em)

    // Tarea
    #text(size: 18pt, weight: "bold", "TAREA:")
    #text(size: 18pt, tarea)
    #v(1em)

    // Docente
    #text(size: 18pt, weight: "bold", "DOCENTE:")
    #text(size: 18pt, docente)
    #v(1em)

    // Si es grupal → lista de nombres
    // Si no → nombre individual
    #if grupal == false {
      [#text(size: 18pt, weight: "bold", "ALUMNO:")
        #text(size: 18pt, "Raul Moncada")
        #v(1em)
        #text(size: 18pt, weight: "bold", "NO#:")
        #text(size: 18pt, "62311465")]
    } else {
      v(1em)
      align(center)[
        #text(size: 18pt, weight: "bold", "INTEGRANTES")\
        #v(1em)

        #for integrante in grupo {
          text(size: 18pt, "" + integrante)
          v(1.1em)
        }
      ]
    }

    #v(2em)
  ]

  // Fecha abajo
  align(bottom + center)[#datetime.today().display()]
  line(start: (0%, 0%), end: (9.5in, 0%), stroke: (thickness: 1pt))
}
#show: portada(
  asignatura: "Matemáticas",
  seccion: "1001",
  tarea: "Investigación",
  docente: "Lic. Martínez",
  grupal: true,
  grupo: (
    "Raul Moncada — 62311465",
    "Diego Moncada — 62311432",
  ),
)
