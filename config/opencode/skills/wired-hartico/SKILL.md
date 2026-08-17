---
name: wired-hartico
description: Sistema Wired del hotel Hartico (Habbo) — pilas, señales, variables, ctx, contadores, retardos y rendimiento. Úsala cuando el usuario pregunte por wireds, pilas, "ctx", señales, furnis wired, o quiera montar, explicar o arreglar una sala de Hartico. Guarda el trabajo hecho en Engram.
---

Documentación completa del sistema Wired. Las fuentes viven en esta misma carpeta.

## Fuentes

- `wired-hartico.md` → documentación completa concatenada (cada wired: cómo funciona de verdad, config, ejemplo, notas, orden de ejecución, señales, variables, contadores, límites y listado completo).
- `llms.txt` → índice/navegación de la web oficial, por categorías.
- Web oficial (manda si contradice al `.md`): https://wired.hartico.tv/

## Cómo trabajar con Wired

1. Lee `wired-hartico.md` para responder; está pensada para pegarse entera en el contexto.
2. Antes de diseñar una pila, pregúntale al usuario su sala: qué furnis tiene y en QUÉ BALDOSA está cada uno. La baldosa determina qué wireds forman una pila y no se puede deducir de la doc.
3. Si el usuario nombra un furni concreto, busca su ficha en `wired-hartico.md` antes de responder.
4. Respeta el orden de ejecución de la pila (1.º variables, 5.º enviar señal/ejecuta pilas) y avisa de los patrones frágiles: bucles de señales (la recursión se corta a mitad), retardos que se acumulan, selectores grandes, coste de "enviar señal".
5. Recomienda causantes periódicos para ciclos salvo que el usuario pida explícitamente señal.

## Engram: guardar el trabajo para el futuro

Engram es la memoria persistente del sistema. Su objetivo guardando
trabajo: que las pilas, diseños y decisiones de Wired no se pierdan entre sesiones.

### CUÁNDO GUARDAR (obligatorio — no opcional)

Llamar a `mem_save` inmediatamente después de cualquiera de estas cosas:

- Se diseñó, modificó o arregló una pila (o una sala completa)
- Se tomó una decisión de diseño (pila por señal vs periódica, antenas, reparto de baldosas)
- Descubrimiento no obvio sobre cómo se comporta un Wired de verdad
- Un patrón que funciona (p. ej. "bucle 1→10 con auto-señal y condición ctx < 10")
- Una preferencia o limitación del usuario (hotel, staff, furnis disponibles, tope de señales)

Formato de `mem_save`:
- **title**: Verbo + qué, corto y buscable (p. ej. "Bucle ctx 1→10 con auto-señal en Hartico")
- **type**: `decision` | `discovery` | `pattern` | `config` | `bugfix`
- **scope**: `project` (por defecto) | `personal`
- **topic_key** (recomendado para temas que evolucionan): clave estable como `wired/pilas-bucle`, `wired/antenas`, `wired/sala-estación`
- **content**, con esta estructura:
  - **Qué**: una frase — qué se hizo
  - **Por qué**: qué motivó la decisión (pedido del usuario, bug, límite del servidor…)
  - **Dónde**: sala/baldosas/furnis afectados, ficheros si los hay
  - **Aprendido**: gotchas, límites (cortes de recursión, retardos acumulados, advertencias de la doc)

Reglas de `topic_key`:
- Distintas observaciones de distinto tema no se pisan entre sí (un bugfix no sobrescribe un patrón).
- Reutilizar el mismo `topic_key` para actualizar un tema en evolución.
- Ante la duda usar `mem_suggest_topic_key` primero.

### CUÁNDO BUSCAR EN MEMORIA

Antes de responder sobre Wired — o ante cualquier "recordar", "qué hicimos", "recuerda mi sala",
"cómo hice" — o al empezar a trabajar sobre algo que pudiera haberse hecho antes:

1. `mem_context` — historial reciente de sesiones (rápido).
2. Si no aparece, `mem_search` con palabras clave (FTS5): pila, antena, señal, ctx, nombre de la sala.
3. Si hay coincidencia, `mem_get_observation` para el contenido completo.

### AL CERRAR LA SESIÓN

Antes de terminar o decir "listo"/"hecho", llamar `mem_session_summary` con:

```
## Goal
[En qué se trabajó en esta sesión]

## Instructions
[Preferencias o restricciones del usuario descubiertas — omitir si no hay]

## Discoveries
- [Hallazgos técnicos, gotchas, aprendizajes no obvios]

## Accomplished
- [Lo completado, con detalles clave]

## Next Steps
- [Lo que queda pendiente — para la próxima sesión]

## Relevant Files
- ruta/archivo — [qué hace o qué cambió]
```

Es obligatorio: si se omite, la próxima sesión arranca a ciegas.