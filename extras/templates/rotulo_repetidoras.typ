#let rotulo_repetidora(modelo: "MODELO", serie: "SERIE", estado: true) = {
  set page(flipped: true, fill: rgb("#FFF"), "us-letter")
  set text(font: "Iosevka Term Slab", size: 40pt, weight: "bold")

  align(horizon + center)[
    MODELO: #text(weight: "regular", modelo)

    SERIE: #text(weight: "regular", serie)

    ESTADO: #text(weight: "regular", if estado == true { "EN BUEN ESTADO" } else { "EN MAL ESTADO" })
  ]
}
