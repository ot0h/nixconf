#let acta(
  sitio: [sitio],
  idSitio: [Id del Sitio],
  detalle: [Llave de candado Mul-T-Lock, perteneciente a coraza metalica de gaginete ENC6150],
  cantidad: 1,
) = {
  set page(fill: rgb("#FFF"), margin: (rest: 0.5in), "us-letter")
  set text(font: "Iosevka NF", size: 14pt)

  align(top + left)[
    #image("imagenes/logo-syscom.png", width: 30%)
    #v(1em)
  ]
  align(top + center)[
    #text(size: 17pt, weight: "extrabold", "ACTA DE RECEPCION")
  ]
  align(left + top)[
    #v(1em)
    #text(size: 14pt, weight: "regular", "Sitio Asignado a")
    #text(size: 14pt, weight: "extrabold", "SYSCOM")
    #v(0.5em)
    #text(
      size: 14pt,
      weight: "regular",
      "Por este medio hacemos entrega de copia de la llave al personal de la zona correspondiente al sitio:",
    )
    #v(0.5em)

    // Aca entran las variables
    #text(size: 14pt, weight: "bold", "Sitio:")
    #text(size: 14pt, weight: "extrabold", upper(sitio))
    #v(0em)
    #text(size: 14pt, weight: "bold", "ID Sitio:")
    #text(size: 14pt, weight: "regular", idSitio)
    #v(0em)
    #text(size: 14pt, weight: "bold", "Detalle:")
    #text(size: 14pt, weight: "regular", detalle)
    #v(0em)
    #text(size: 14pt, weight: "bold", "Cantidad:")
    #text(size: 14pt, weight: "regular", str(cantidad))
    #text(size: 14pt, weight: "regular", if cantidad > 1 {
      "llaves"
    } else {
      "llave"
    })
    #v(5em)

    // Donde la persona debe escribir a mano
    #text(size: 14pt, weight: "bold", "Entregado por:  __________________________________________________")\
    #v(-2mm)
    #align(center)[
      #text(size: 14pt, weight: "bold", upper("Personal de SYSCOM"))
    ]
    #v(1.0em)
    #text(size: 14pt, weight: "bold", "Recibido por:   __________________________________________________")
    #v(-2mm)
    #align(center)[
      #text(size: 14pt, weight: "bold", upper("Personal de CENTRO DE LLAVES"))
    ]
    #v(1.0em)
    #text(size: 14pt, weight: "bold", "Identidad de quien recibe: _______________________________________")
    #v(1.5em)
    #text(size: 14pt, weight: "bold", "Fecha:          __________________________________________________")
    #v(1.5em)
    #text(size: 14pt, weight: "bold", "Telefono quien recibe: ___________________________________________")
  ]
}

#show: acta(
  sitio: "Yojoa",
  cantidad: 3,
)
