# Sistema Wired de Hartico — documentación completa

Este fichero es toda la documentación del sistema Wired concatenada, pensada para pegarse de una vez
en el contexto de un asistente de IA.

Generado automáticamente desde https://wired.hartico.tv. Si algo aquí contradice a la web, manda la web.

Cómo usarlo: pégalo entero y luego describe tu sala —qué furnis tienes y EN QUÉ BALDOSA está cada
uno—, porque la baldosa es lo que determina qué wireds forman una pila y eso no se puede deducir de
esta documentación.

---


# Wired de Hartico

> Manual completo del sistema Wired – qué hace cada pieza, cómo funciona de verdad, y cómo montar pilas que no se rompan.
>
> Página: https://wired.hartico.tv/

import { Card, CardGrid } from '@astrojs/starlight/components';

## Por dónde entrar

<CardGrid stagger>
	<Card title="Nunca has tocado un wired" icon="rocket">
		Empieza por [Qué es el Wired](/empezar/que-es/) y monta [tu primera pila](/empezar/primera-pila/)
		en cinco minutos. No hace falta saber nada previo.
	</Card>
	<Card title="Ya montas pilas" icon="puzzle">
		Ve directo a [Conceptos](/conceptos/anatomia/). Ahí está el orden real de ejecución, cómo se
		reparten los objetivos entre varias referencias y por qué a veces una pila hace algo que no
		esperabas.
	</Card>
	<Card title="Buscas un furni concreto" icon="magnifier">
		Usa el buscador de arriba, o mira el [listado completo](/referencia/todos-los-wireds/) por
		nombre. Cada ficha explica todas las opciones de su ventana.
	</Card>
	<Card title="Quieres que te ayude una IA" icon="seti:javascript">
		Lee [Cómo usar esto con una IA](/empezar/con-ia/). Hay un fichero único con toda la
		documentación para pegar de una vez en el contexto.
	</Card>
</CardGrid>

## Qué vas a encontrar

Esta documentación no repite la descripción que trae cada furni en el catálogo. Explica **lo que hace
de verdad**: en qué momento exacto se ejecuta, sobre qué actúa cuando le das varias referencias, qué
pasa cuando algo no se puede cumplir, y con qué otras piezas se combina bien.

Cada ficha sigue la misma forma:

- **Para qué sirve** – una frase, sin tecnicismos.
- **Cómo funciona** – el comportamiento real, incluidos los casos raros.
- **Configuración** – cada opción, cada desplegable, cada casilla.
- **Ejemplo** – una pila mínima que puedes montar tal cual.
- **Notas** – los errores que comete todo el mundo la primera vez.

---

# Qué es el Wired

> La idea de fondo del sistema Wired y los seis tipos de pieza que vas a usar.
>
> Página: https://wired.hartico.tv/empezar/que-es/

El Wired es el sistema para **programar cosas dentro de una sala sin escribir código**. En vez de
teclear instrucciones, apilas furnis: uno dice *cuándo*, otro dice *si*, otro dice *qué pasa*.

La regla que lo sostiene todo cabe en una línea:

> **Los wireds que están en la misma baldosa trabajan juntos. Los que están en baldosas distintas no
> se conocen.**

A ese grupo de furnis apilados en una misma baldosa se le llama **pila**. Es la unidad de trabajo del
sistema: cada pila es, en la práctica, un programita independiente.

## Los seis tipos de pieza

| Tipo | Responde a | Cuántos por pila |
| --- | --- | --- |
| **Causante** | ¿Cuándo se dispara esto? | 1 o más |
| **Condición** | ¿Se cumple lo que pido? | 0 o más |
| **Efecto** | ¿Qué pasa? | 1 o más |
| **Selector** | ¿Sobre quién o qué actúa? | 0 o más |
| **Complemento** | ¿Cómo se comporta el resto de la pila? | 0 o más |
| **Variable** | ¿Qué necesito recordar? | 0 o más |

Una pila **necesita al menos un causante y al menos un efecto**. Todo lo demás es opcional, y es
justo lo opcional lo que separa una pila que funciona de una pila que hace exactamente lo que
querías.

### Causante

Es la puerta de entrada. Vigila algo que pasa en la sala –alguien pisa una baldosa, alguien dice una
palabra, pasan diez segundos– y cuando ocurre, pone la pila en marcha.

Sin causante, una pila no se ejecuta nunca. No hay forma de "llamarla a mano".

### Condición

Es un filtro. Cuando el causante dispara, las condiciones deciden si la cosa sigue adelante. Si
alguna falla, los efectos no se ejecutan.

Por defecto **todas las condiciones de una pila tienen que cumplirse a la vez**. Si necesitas que
baste con una, existe un complemento que cambia esa regla.

### Efecto

Es lo que realmente hace algo: mover un furni, teletransportar a alguien, dar puntos, hablar, encender
una luz. Una pila puede tener varios y se ejecutan todos.

### Selector

Responde a "¿sobre qué actúo?". Sin selector, un efecto actúa sobre lo obvio: el usuario que disparó
la pila, o los furnis que tú elegiste a mano en la ventana del efecto.

Con selector puedes decir cosas como "todos los usuarios que estén en esta zona", "todos los furnis
de este tipo" o "todo el que lleve tal cosa en la mano", y el efecto se aplicará a ese conjunto.

### Complemento

No hace nada por sí solo: **cambia cómo se comporta el resto de la pila**. Los hay para limitar cuántas
veces se ejecuta, para cambiar el AND de las condiciones por un OR, para que los furnis se muevan en
curva en lugar de en línea recta, para meter el nombre de un usuario dentro de un texto…

Es la categoría que más gente ignora y la que más partido da.

### Variable

Es memoria. Guarda un número o un texto que sobrevive entre ejecuciones, para que la pila pueda
contar, recordar quién hizo qué, o compartir información con otras pilas de la sala.

## Cómo se lee una pila

Puesto todo junto, una pila se lee de arriba abajo como una frase:

```
CUANDO       alguien pise esta baldosa          ← causante
SOBRE        todos los usuarios de la zona      ← selector
SI           hay al menos 2                     ← condición
ENTONCES     enséñales un mensaje               ← efecto
```

Ese es el modelo completo. Todo lo demás en esta documentación es detalle sobre cada pieza.

## Lo siguiente

- [Tu primera pila](/empezar/primera-pila/) – móntala tú, paso a paso.
- [Anatomía de una pila](/conceptos/anatomia/) – el detalle de cómo encajan las piezas.
- [El orden de ejecución](/conceptos/orden-de-ejecucion/) – qué corre antes que qué, y por qué importa.

---

# Tu primera pila

> Montar una puerta que solo se abre para quien lleve una placa, paso a paso.
>
> Página: https://wired.hartico.tv/empezar/primera-pila/

Vamos a montar algo pequeño pero completo: **una baldosa que teletransporta, pero solo a quien lleve
una placa concreta**. Usa las tres piezas obligatorias y una condición, que es donde está la gracia.

Necesitas derechos de construcción en la sala y los tres furnis wired del catálogo.

## 1. Elige la baldosa

Escoge dónde va a estar el "sensor". Todo lo que montemos va **en esa misma baldosa**, uno encima de
otro. Si un furni acaba en la baldosa de al lado, no formará parte de la pila y nada funcionará.

:::tip[Comprobación rápida]
Si dudas de si un furni quedó en la pila, ábrelo: cuando un wired pertenece a una pila, al abrirlo se
iluminan los demás wireds de esa misma baldosa.
:::

## 2. Pon el causante

Coloca el **Causante WIRED: Sobre un Furni**.

Ábrelo y selecciona el furni que hará de baldosa pisable – puede ser la propia alfombra, un suelo,
lo que quieras que la gente pise. Guarda.

Ya tienes el *cuándo*: **cuando alguien pise ese furni**.

## 3. Pon el efecto

Coloca encima el **Efecto WIRED: Teletransporte**.

Ábrelo y elige el furni de destino: el sitio al que quieres mandar a la gente. Guarda.

Con esto ya funciona. Pruébalo: pisa la baldosa y saldrás disparado al destino. Es una pila válida
–causante más efecto– y ya hace algo.

## 4. Pon la condición

Ahora el filtro. Coloca en la misma baldosa la **Condición WIRED: Lleva Placa**.

Ábrela y escribe el código de la placa. Guarda.

Vuelve a pisar. Si llevas la placa puesta, te teletransporta. Si no, no pasa nada. Ese "no pasa nada"
es la condición haciendo su trabajo: el causante disparó, la condición no se cumplió, y los efectos
no llegaron a ejecutarse.

## 5. Dale una respuesta al que no pasa

Que no pase nada es mala experiencia: el usuario no sabe si está roto o si le falta algo. Vamos a
darle un mensaje.

Coloca un **Efecto WIRED: Mensaje** en la misma pila, ábrelo, escribe algo como
"Necesitas la placa de socio para entrar", y aquí viene lo importante: **marca la casilla que lo
convierte en efecto negativo**.

Un efecto negativo se ejecuta justo cuando las condiciones **fallan**. Es el "si no" de la pila.

Resultado final:

```
CUANDO    alguien pise la alfombra
SI        lleva la placa SOCIO       → teletransportar al destino
SI NO                                → decirle que le falta la placa
```

## Lo que acabas de aprender

- Una pila son furnis **en la misma baldosa**.
- El orden en que los apilas **no importa**; el sistema sabe qué papel tiene cada uno.
- Las condiciones no "paran" la pila: la desvían hacia los efectos negativos, si los hay.
- Sin efectos negativos, una condición que falla se siente como si el furni estuviera roto. Ponlos.

## Lo siguiente

Cuando quieras que la pila actúe sobre **más de una persona a la vez** –no solo sobre quien la
disparó– necesitas un selector. Eso está en
[Fuentes y objetivos](/conceptos/fuentes-y-objetivos/).

---

# Cómo usar esto con una IA

> Pasarle toda la documentación a un asistente para que te diseñe pilas y te las optimice.
>
> Página: https://wired.hartico.tv/empezar/con-ia/

Esta documentación está pensada para que puedas dársela entera a un asistente de IA y pedirle que te
monte pilas, que te revise las que ya tienes o que te las simplifique. Para eso hay dos ficheros
preparados.

## Los dos ficheros

**[`/wired-completo.md`](/wired-completo.md)** – toda la documentación en un solo archivo de texto,
en orden. Es el que quieres pegar en el contexto de un asistente.

**[`/llms.txt`](/llms.txt)** – un índice corto en el formato estándar que algunas herramientas leen
solas. Si tu asistente sabe navegar por enlaces, dale este y él irá a buscar lo que necesite.

## Cómo pedirlo bien

Un asistente con esta documentación delante puede hacer tres cosas útiles. Las tres funcionan mucho
mejor si le das contexto real en vez de una pregunta abstracta.

### Diseñar una pila desde cero

Describe el **comportamiento que quieres**, no las piezas que crees que necesitas. Si le dices qué
furnis usar, le estás quitando justo la parte en la que te puede ayudar.

> Quiero que en mi sala de eventos, cuando un usuario diga "!entrar", se le teletransporte a la zona
> de espera, pero solo si hay menos de 20 personas dentro. Si está lleno, que se lo diga.
> Móntame la pila con la documentación de Wired de Hartico que te he pasado.

### Revisar una pila que ya tienes

Puedes copiar el contenido de tus wireds tal cual y pedirle que los lea. Dile en qué baldosa está
cada uno, porque **eso es lo que determina qué forma una pila y qué no** – es el error más común y
un asistente no puede adivinarlo.

> Esta es mi pila de la baldosa (12,8): causante Periodos cada 5s, condición Hay usuarios en el
> furni, efecto Mover furni. Se me para sola de vez en cuando. ¿Por qué?

### Optimizar

Si una sala te va lenta o se te ha "apagado" el wired, describe cuántas pilas tienes y de qué tipo.
La sección de [Límites y rendimiento](/conceptos/limites/) explica qué mide el servidor y qué lo hace
cortar.

> Tengo 40 pilas con Periodos Cortos moviendo furnis cada medio segundo y la sala va a tirones.
> ¿Cómo lo reduzco sin perder el efecto visual?

## Lo que la IA no puede saber

Por muy completa que sea la documentación, hay cosas que dependen de tu sala y que tienes que
aportarle tú:

- **En qué baldosa está cada furni.** Sin eso no sabe qué pilas existen.
- **Qué furnis tienes.** Puede proponerte algo que no está en tu inventario.
- **Los límites configurados en tu hotel.** Los topes de variables y de ejecución los pone el staff y
  pueden diferir de los que aparecen aquí.
- **Si un furni del catálogo tiene el wired activado.** Un furni puede parecer un wired y no serlo:
  lo que lo convierte en wired es un ajuste del catálogo que no se ve desde dentro de la sala.

## Un aviso sobre las respuestas

Un asistente te va a dar una pila que *parece* correcta siempre, incluso cuando se está inventando
una opción que no existe. Antes de montar algo largo, comprueba en la ficha del furni que las
opciones que te ha descrito están realmente ahí. Cada ficha de esta documentación lista **todas** las
opciones de su ventana, así que la comprobación es rápida.

---

# Anatomía de una pila

> Qué es exactamente una pila, cuántas piezas de cada tipo admite y cómo se relaciona con las demás.
>
> Página: https://wired.hartico.tv/conceptos/anatomia/

Una **pila** son todos los furnis wired que comparten una misma baldosa. El servidor las agrupa por
coordenada: no hay ningún otro criterio, ni orden de colocación, ni altura, ni a quién pertenecen.

## Cuántas piezas admite

| Rol | Por pila | Qué pasa si falta |
| --- | --- | --- |
| Causante | 1 o más | La pila no se ejecuta nunca |
| Selector | 0 o más | Los efectos actúan sobre lo que tengan configurado a mano |
| Complemento | 0 o más | Todo se comporta con sus valores por defecto |
| Condición | 0 o más | Los efectos se ejecutan siempre |
| Efecto | 1 o más | La pila evalúa y no hace nada |

**Varios causantes en la misma pila son válidos y útiles.** Si pones un causante de pisar y otro de
clic en el mismo sitio, cualquiera de los dos dispara los mismos efectos. Es la forma de ofrecer dos
maneras de activar lo mismo sin duplicar la pila entera.

## El orden de apilado da igual

Da exactamente lo mismo colocar primero el efecto y luego el causante. El servidor identifica el
papel de cada furni por lo que es, no por dónde está en el montón.

Lo único que importa es que **estén en la misma baldosa**.

## Pilas que se hablan entre sí

Las pilas son independientes por definición, pero hay tres formas de conectarlas:

**Señales.** Un efecto envía una señal a una antena, y cualquier causante de recibir señal que
escuche esa antena arranca. Es la forma normal de encadenar. Está explicado en
[Señales y pilas remotas](/conceptos/senales/).

**Llamar a otra pila.** Un efecto que ejecuta directamente los efectos de otra baldosa que tú
señalas.

**Variables.** Una pila escribe un valor y otra lo lee. No hay disparo: la segunda pila tiene que
mirar por su cuenta, o usar el causante que vigila cambios de variable.

## Efectos positivos y negativos

Cada efecto de la pila puede marcarse como **negativo**. Eso invierte cuándo se ejecuta:

- Los efectos normales corren cuando **todas** las condiciones se cumplen.
- Los efectos negativos corren cuando **alguna** falla.

Los dos grupos viven en la misma pila y se excluyen: en una ejecución dada corre uno u otro, nunca
ambos.

Si una pila no tiene condiciones, sus efectos negativos no se ejecutarán jamás, porque nunca hay nada
que pueda fallar.

## Qué convierte a un furni en wired

Esto sorprende a mucha gente: **un furni no es wired por su aspecto ni por su nombre**, sino por un
ajuste del catálogo que el staff configura. Dos furnis idénticos pueden comportarse distinto si uno
tiene ese ajuste y el otro no.

Por eso a veces un furni "de wired" comprado en otro sitio no hace nada al colocarlo: le falta la
configuración, no el diseño. Si te pasa, es cosa del staff del hotel, no de tu pila.

## Lo siguiente

- [El orden de ejecución](/conceptos/orden-de-ejecucion/) – qué corre antes que qué dentro de una pila.
- [Fuentes y objetivos](/conceptos/fuentes-y-objetivos/) – cómo decide un efecto sobre quién actúa.

---

# El orden de ejecución

> Las cuatro fases por las que pasa una pila cada vez que se dispara, y por qué el orden explica casi todos los comportamientos raros.
>
> Página: https://wired.hartico.tv/conceptos/orden-de-ejecucion/

Cuando un causante dispara, la pila pasa **siempre** por las mismas cuatro fases, en este orden:

```
1. SELECTORES    ¿sobre qué furnis y qué usuarios va esto?
2. COMPLEMENTOS  ¿cambian las reglas del resto de la pila?
3. CONDICIONES   ¿se cumple lo que pido?
4. EFECTOS       hacer las cosas
```

Casi todo lo que parece un fallo del Wired se explica sabiendo este orden.

## 1. Selectores

Lo primero que ocurre es resolver **el conjunto**: qué furnis y qué usuarios entran en juego. Los
selectores se evalúan antes que nada, así que trabajan sobre el estado de la sala **tal como estaba
en el momento del disparo**, antes de que ningún efecto haya tocado nada.

Esto tiene una consecuencia práctica importante: si tu pila mueve furnis y a la vez los selecciona,
el selector ve las posiciones de **antes** del movimiento.

## 2. Complementos

Con el conjunto ya resuelto, se aplican los complementos. Aquí es donde se decide si las condiciones
van a evaluarse con Y o con O, si esta ejecución está dentro del límite permitido, en qué orden se
van a recorrer los objetivos, y qué texto real va a sustituir a cada identificador.

## 3. Condiciones

Ahora se evalúan las condiciones. **Por defecto se exigen todas a la vez**: basta con que una falle
para que el bloque entero falle.

Si añades a la pila el complemento de evaluación O, cambia la regla y basta con que se cumpla una.

El resultado de esta fase solo tiene dos salidas:

- **Pasan** → se ejecutan los efectos normales.
- **Fallan** → se ejecutan los efectos negativos, si los hay. Si no los hay, la pila termina sin
  hacer nada.

## 4. Efectos

Los efectos no corren en el orden en que los apilaste. El servidor los reparte en cinco escalones y
los ejecuta de arriba abajo:

| Escalón | Qué va aquí |
| --- | --- |
| **1.º** | Dar variable |
| **2.º** | Cambiar valor de variable |
| **3.º** | Eliminar variable |
| **4.º** | Todo lo demás: mover, hablar, teletransportar, puntuar… |
| **5.º** | Enviar Señal y Ejecuta Pilas |

Los tres primeros no son un capricho: hacen que **el resto de la pila vea las variables ya
calculadas**. Por eso un Mensaje puesto en la misma pila enseña el valor final y no el que había al
empezar. Entre el tercero y el cuarto hay además un paso interno en el que los complementos de texto
capturan su valor, que es lo que permite que un identificador muestre en su propia pila el número
recién calculado.

El quinto es el que más consecuencias tiene. Que las señales y las llamadas salgan **al final**
garantiza que la pila que las recibe ve el estado ya modificado, y no a medias. Si mueves un furni y
envías una señal en la misma pila, la pila remota verá el furni ya movido.

**Dentro del cuarto escalón el orden se sortea en cada ejecución.** No está solo "no garantizado": es
aleatorio de verdad, y cambia entre una vuelta y la siguiente. Si necesitas que dos cosas ocurran en
un orden concreto tienes dos salidas: el complemento
[Ejecutar en Orden](/complementos/ejecutar-en-orden/), que los ordena por la altura a la que coloques
los furnis, o partir la pila y encadenarla con una señal.

## El caso de varias pilas a la vez

Un mismo evento puede disparar varias pilas: tres baldosas distintas con causantes de pisar, o varias
pilas escuchando la misma antena.

Cuando eso pasa, el sistema **evalúa todas las condiciones antes de ejecutar ningún efecto**. Es
decir, todas las pilas miran el mismo estado de la sala, el de antes de que ninguna hubiera actuado.

Esto evita un problema clásico: si la pila A apaga una luz y la pila B tenía la condición "la luz
está encendida", B no se queda fuera solo por haberse evaluado un instante después. Las dos ven la
luz encendida y las dos actúan.

Es un comportamiento deliberado. Si lo que quieres es justo lo contrario –que solo una de ellas
actúe– tienes que encadenarlas con señales en lugar de dispararlas en paralelo.

## Lo siguiente

- [Fuentes y objetivos](/conceptos/fuentes-y-objetivos/) – cómo se reparte el conjunto entre los efectos.
- [Señales y pilas remotas](/conceptos/senales/) – la forma correcta de encadenar en orden.

---

# Fuentes y objetivos

> Cómo decide un efecto sobre quién actúa, y cómo se reparten los objetivos cuando hay varias referencias.
>
> Página: https://wired.hartico.tv/conceptos/fuentes-y-objetivos/

Casi todos los efectos tienen que responder a dos preguntas antes de actuar: **¿a quién?** y **¿con
respecto a qué?**. Eso es lo que configuran los desplegables de *fuente* que verás en sus ventanas.

## Las dos preguntas

Un efecto como "mover usuario hacia furni" necesita dos cosas distintas:

- **El objetivo** – a qué usuario voy a mover.
- **La referencia** – hacia qué furni lo muevo.

Cada una tiene su propio desplegable, y cada una puede venir de un sitio diferente.

## De dónde puede salir cada una

Las opciones concretas cambian según el efecto, pero se agrupan en cuatro familias:

**El causante.** El usuario que disparó la pila, o el furni que se pisó o se clicó. Es lo más
inmediato y lo que casi siempre quieres cuando la pila reacciona a una persona.

**Elegidos a mano.** Los furnis que seleccionaste tú al configurar la ventana del efecto. Fijos: los
mismos en cada ejecución.

**El selector de la pila.** El conjunto que resolvió el selector en la primera fase. Es la opción que
convierte una pila de "actúa sobre uno" a "actúa sobre muchos".

**La señal.** Cuando la pila se disparó por una señal, la señal puede traer consigo usuarios o furnis
desde la pila que la envió. Así se pasa información entre pilas sin variables.

:::caution[El desplegable no dice si hay algo]
Elegir "el selector" como fuente no garantiza que haya algo dentro. Si la pila no tiene selector, o
si el selector no encontró nada, el conjunto está vacío y el efecto no hace nada. No es un error: es
que no había sobre qué actuar.
:::

## Cuando hay más objetivos que referencias

Aquí está la parte que confunde a todo el mundo, y merece la pena entenderla porque cambia por
completo lo que hace una pila.

Imagina un efecto que teletransporta usuarios a un furni. El selector te ha dado **12 usuarios**, y
como referencia has puesto **2 furnis**. ¿Qué pasa?

No es un sorteo. **Es un reparto**: el sistema recorre los objetivos en orden y va rotando entre las
referencias disponibles.

```
usuario 1  → furni A
usuario 2  → furni B
usuario 3  → furni A
usuario 4  → furni B
...
```

Con 12 usuarios y 2 furnis salen **6 y 6, siempre**. No 7 y 5, ni 9 y 3. El reparto es equilibrado
por construcción.

### Por dónde empieza el reparto es al azar

Si el reparto empezara siempre por la primera referencia, la referencia A recibiría siempre al primer
usuario de la lista, y con números impares recibiría siempre uno más que las demás. Sería un sesgo
permanente.

Por eso **el punto de partida se sortea en cada ejecución**. Con 13 usuarios y 2 furnis salen 7 y 6,
pero cuál de los dos se lleva el séptimo cambia cada vez.

En resumen: **el reparto es equilibrado, el resto es aleatorio**.

### Qué efectos reparten así

Los que aceptan varias referencias para una misma tanda de objetivos: cambiar el valor de una
variable, mover furni hacia furni, reposicionar, traer furni al usuario, mover usuario hacia furni,
teletransportar, y los de mover y teletransportar bots.

En los demás, o solo hay una referencia posible, o la referencia no se reparte.

## Cuando el objetivo no cabe

Repartir no garantiza que la acción se pueda cumplir. Si mandas 5 usuarios a 4 baldosas de destino,
alguno se quedará fuera: dos personas no pueden ocupar la misma baldosa.

Para eso está el complemento de movimientos físicos, que permite atravesar usuarios. Con él puesto,
los 5 llegan.

Es un buen ejemplo de la regla general: **el reparto decide a quién le toca qué; los complementos
deciden si eso es posible**.

## Lo siguiente

- [Retardos y repeticiones](/conceptos/retardos/) – cómo separar en el tiempo lo que si no ocurriría de golpe.
- [Límites y rendimiento](/conceptos/limites/) – cuántos objetivos puedes mover sin que la sala sufra.

---

# Retardos y repeticiones

> El retardo que lleva cada efecto, los cuatro causantes de tiempo y sus rangos reales.
>
> Página: https://wired.hartico.tv/conceptos/retardos/

Todo lo que pasa dentro de una pila ocurre de golpe salvo que tú digas lo contrario. Las dos formas
de meter tiempo son el **retardo de cada efecto** y los **causantes periódicos**.

## El retardo de un efecto

Cada efecto, sin excepción, tiene abajo una barra de retardo. Es lo que separa una pila que hace
cinco cosas a la vez de una que las hace en secuencia.

| | |
| --- | --- |
| **Rango** | 0 a 10 segundos |
| **Paso** | medio segundo |
| **Ámbito** | por efecto, no por pila |

Que el retardo sea **por efecto** es lo que permite montar secuencias sin encadenar pilas: pones
cuatro efectos en la misma pila con retardos de 0, 1, 2 y 3 segundos, y se ejecutan uno detrás de
otro.

:::note[El furni parpadea al principio, no al final]
Cuando un efecto tiene retardo, el wired se ilumina en el momento del disparo, no cuando el retardo
vence. Es intencionado: así ves que la pila arrancó aunque el resultado tarde. Si esperas el parpadeo
para saber si "ya pasó", te va a despistar.
:::

### El retardo no cancela nada

Si la pila se vuelve a disparar antes de que venza un retardo pendiente, el nuevo disparo **no
sustituye** al anterior: se acumulan. Con un causante rápido y un retardo largo puedes acabar con
decenas de ejecuciones en cola.

Es la causa número uno de salas que se ponen lentas sin motivo aparente. Si un efecto lleva retardo,
asegúrate de que su causante no puede dispararse más rápido de lo que el retardo tarda en vencer.

## Los cuatro causantes de tiempo

Se diferencian en el rango y en la precisión. Elegir el que va sobrado de rango y ponerlo al mínimo
es peor que elegir el ajustado.

| Causante | Rango | Paso | Para qué |
| --- | --- | --- | --- |
| **Periodos Cortos** | 50 ms – 500 ms | 50 ms | Animación fina, movimiento fluido |
| **Periodos** | 0,5 s – 30 s | 0,5 s | El de uso general |
| **Periodos Largos** | 5 s – 600 s | 5 s | Ciclos de sala, rondas, avisos |
| **¡Ya!** | 0,5 s – 600 s | 0,5 s | Una sola vez, contando desde que empieza la sala |

Los tres primeros **repiten para siempre**. El cuarto se dispara **una vez** y no vuelve.

### Sobre Periodos Cortos

Es la herramienta más potente y la más peligrosa. A 50 ms una pila se ejecuta veinte veces por
segundo; con cinco pilas así en una sala, son cien ejecuciones por segundo compitiendo con todo lo
demás.

Úsalo cuando necesites que algo se vea fluido, y solo durante el tiempo que haga falta. Si lo que
quieres es que algo pase "rápido" pero no es una animación, Periodos al mínimo (medio segundo) suele
bastar y cuesta diez veces menos.

## Combinar retardo y repetición

El patrón más útil del sistema es un causante periódico lento con efectos escalonados por retardo:

```
CUANDO    cada 10 segundos               ← Periodos
          → efecto A con retardo 0 s
          → efecto B con retardo 2 s
          → efecto C con retardo 4 s
```

Eso te da una secuencia de tres pasos que se repite cada diez segundos, con **una sola pila** y sin
señales. Mientras el retardo mayor sea menor que el periodo, nunca se solapan.

Si el retardo mayor supera el periodo, empiezan a solaparse ejecuciones. A veces es justo lo que
quieres –una cascada continua– pero tienes que decidirlo tú, no descubrirlo.

## Lo siguiente

- [Señales y pilas remotas](/conceptos/senales/) – encadenar cuando el retardo no basta.
- [Límites y rendimiento](/conceptos/limites/) – qué mide el servidor y cuándo corta.

---

# Señales y pilas remotas

> Cómo hacer que una pila dispare a otra que está en otra baldosa, y qué viaja con la señal.
>
> Página: https://wired.hartico.tv/conceptos/senales/

Las pilas son independientes: cada baldosa es su propio programa. Las **señales** son la forma
normal de conectarlas.

## Cómo funciona

Intervienen tres piezas:

1. Una **antena**, que es un furni cualquiera que hace de canal.
2. Un efecto **Enviar Señal**, que apunta a esa antena.
3. Un causante **Recibir Señal**, en otra baldosa, que escucha esa misma antena.

Cuando la primera pila ejecuta el efecto de enviar, todas las pilas cuyo causante escuche esa antena
arrancan.

```
Baldosa (3,3)                     Baldosa (10,7)
  Causante: alguien pisa            Causante: recibir señal   [antena X]
  Efecto:   enviar señal → X   ──►  Efecto:   abrir la puerta
```

Una antena puede tener **muchos oyentes**. Un solo envío dispara todas las pilas que la escuchen, lo
que la convierte en la herramienta natural para "que pasen diez cosas a la vez en sitios distintos".

## Las señales van al final

Como se explica en [El orden de ejecución](/conceptos/orden-de-ejecucion/), enviar señal es de las
últimas cosas que hace una pila, después de todos sus demás efectos.

Esto no es un detalle interno: es la garantía que hace útiles las señales. Cuando la pila remota
arranca, **ve el mundo ya modificado** por la pila que la llamó. Si mueves un furni y envías una
señal, la pila que recibe encuentra el furni en su sitio nuevo.

Por eso, cuando necesites que dos cosas ocurran en un orden garantizado, la respuesta es encadenar
con señal, no apilar dos efectos.

## Qué viaja con la señal

Una señal no es solo un aviso: puede **llevarse consigo** el usuario y los furnis con los que estaba
trabajando la pila que la envía.

En la pila que recibe, los efectos pueden elegir "la señal" como fuente, y entonces actúan sobre lo
que vino de la otra baldosa. Es la manera de pasar información entre pilas **sin usar variables**.

Ejemplo típico: la pila A detecta quién pisó, envía señal; la pila B recibe y teletransporta "al
usuario de la señal". La pila B nunca supo quién era, y no le hace falta.

## Varias pilas escuchando lo mismo

Cuando una antena tiene varios oyentes, todos ellos **evalúan sus condiciones antes de que ninguno
ejecute sus efectos**. Todos ven el mismo estado de la sala.

Y va más allá: si un efecto envía varias señales seguidas –una por cada usuario de un grupo, por
ejemplo– todas las pilas que reciben evalúan contra el mismo estado inicial. La señal del segundo
usuario no ve lo que hizo la del primero.

Esto es deliberado y casi siempre es lo que quieres: evita que el primero de la lista se "coma" el
recurso y deje a los demás sin cumplir la condición.

:::caution[Si quieres que se pisen, encadena]
Si tu diseño necesita justo lo contrario –que cada uno vea lo que hizo el anterior– las señales
paralelas no te lo van a dar. Tienes que encadenar en cascada: la pila A llama a la B, la B a la C.
:::

## Cuidado con los bucles

Nada te impide que la pila B envíe una señal que despierte a la pila A. Y nada te impide que eso se
repita para siempre.

El servidor tiene protecciones que cortan la recursión, así que no vas a tumbar el hotel, pero tu
pila **dejará de funcionar** a mitad de camino y de forma poco predecible. Si necesitas un ciclo,
móntalo con un causante periódico, que está pensado para eso.

## Antena, no "cable"

La antena es un furni normal y corriente que actúa de canal. Dos cosas que conviene saber:

- Si **mueves o recoges** la antena, las pilas que la referencian dejan de encontrarse.
- Usar **antenas distintas** para propósitos distintos es lo que mantiene una sala entendible. Una
  sola antena para todo convierte cualquier envío en un disparo global.

## Lo siguiente

- [Límites y rendimiento](/conceptos/limites/) – hasta dónde puedes encadenar.
- [Causante: Recibir Señal](/causantes/recibir-senal/) – la ficha completa.

---

# Límites y rendimiento

> Qué le cuesta trabajo al servidor, qué pasa cuando te pasas, y cómo aligerar una sala sin perder el efecto.
>
> Página: https://wired.hartico.tv/conceptos/limites/

El servidor mide lo que cuesta ejecutar los wireds de una sala en cada instante. Si te pasas, corta.
Esta página explica qué cuesta caro y qué hacer al respecto.

## El coste relativo de cada pieza

No todas las piezas pesan igual. De más barato a más caro:

| Pieza | Peso | Nota |
| --- | --- | --- |
| Condición | ×1 | Muy barata. No tengas miedo de poner varias |
| Complemento | ×1 | Igual de barata |
| Causante | ×2 | Cada vez que dispara |
| Efecto | ×2 **por objetivo** | Aquí está el multiplicador que importa |
| Selector | ×5 | La pieza cara |
| Enviar señal | mucho | Lo más caro con diferencia |

Dos conclusiones prácticas:

**Las condiciones son baratas, los selectores no.** Si puedes resolver algo con tres condiciones en
lugar de con un selector, sale más barato. Mucha gente hace lo contrario.

**Un efecto sobre 50 furnis cuesta 50 veces un efecto sobre uno.** El número de objetivos es lo que
más determina el coste de tu sala. Un selector que devuelve medio salón y un efecto detrás es la
receta clásica para una sala lenta.

## Qué pasa cuando te pasas

Hay tres niveles, y conviene conocerlos porque los síntomas son distintos.

**Nivel 1 – se corta ese instante.** Si en un mismo momento se acumula demasiado trabajo, el
servidor deja de procesar wireds hasta el siguiente. Síntoma: cosas que "a veces no pasan", sin
patrón claro.

**Nivel 2 – la sala va a tirones.** Si el trabajo de wired hace que la sala tarde más de lo que
debería en completar su ciclo, se marca como sobrecargada.

**Nivel 3 – el wired se apaga.** Si la sala va sobrecargada tres veces seguidas y además se estaba
cortando por exceso, el sistema **desactiva todos los wireds de esa sala durante diez minutos**.
Síntoma inconfundible: todo dejó de funcionar de golpe y vuelve solo un rato después.

Si te ha pasado el nivel 3, no busques el wired roto: no hay ninguno roto. Hay demasiados, o hay uno
que actúa sobre demasiadas cosas.

## Límites duros que conviene saber

**Un solo Periodos Cortos por baldosa.** Puedes poner hasta once causantes periódicos normales en una
misma pila, pero de los cortos solo uno. Es una protección deliberada: son los que más rápido
disparan.

**La recursión se corta.** Si una pila llama a otra que llama a otra, hay un tope de encadenamiento.
Un bucle de señales no tumba el hotel, pero se detiene a mitad y de forma impredecible.

**Los retardos se acumulan, no se sustituyen.** Ya lo cuenta [Retardos](/conceptos/retardos/), pero
es la causa más habitual de sobrecarga: un causante rápido con efectos retardados va llenando una
cola que nunca se vacía.

## Cómo aligerar una sala

En orden de cuánto suele ganar cada cosa:

**Sube el periodo.** Pasar de Periodos Cortos a 50 ms a Periodos a medio segundo divide el coste por
diez. Pregúntate si de verdad necesitas la fluidez o solo querías que fuese "rápido".

**Recorta el conjunto.** Un selector de área 3×3 en lugar de 11×11 no es un ajuste menor: es la
diferencia entre 9 objetivos y 121. Ajusta el área a lo que realmente necesitas tocar.

**Filtra antes de actuar, no después.** Si vas a actuar sobre "los usuarios del equipo rojo", usa el
selector de equipo en vez de seleccionar a todos y descartar con condiciones. La condición se evalúa
una vez por pila, pero el efecto se paga por objetivo.

**Reduce las señales.** Si tres pilas hacen lo mismo con la misma antena, plantéate si pueden ser una
sola pila con varios efectos.

**Apaga lo que no se usa.** Un causante periódico corre aunque no haya nadie en la sala. Si tienes
decoración animada por wired, considera arrancarla con una condición de "hay usuarios" o pararla con
una variable.

## Para pedirle una optimización a una IA

Si vas a pedir ayuda, lo que necesita saber quien te ayude es esto:

- Cuántas pilas tienes y con qué causantes.
- Si usas selectores, sobre qué tamaño de área o cuántos furnis.
- Si algún efecto actúa sobre muchos objetivos a la vez.
- Cuál de los tres síntomas de arriba estás viendo.

Con eso se puede razonar. Con "mi sala va lenta" no.

---

# Opciones avanzadas

> El enlace que esconde media configuración de un wired, y qué hay detrás.
>
> Página: https://wired.hartico.tv/conceptos/opciones-avanzadas/

Muchas ventanas de wired guardan una parte de su configuración detrás de un enlace:

> **Mostrar opciones avanzadas**

Viene **cerrado**, así que si no lo pulsas nunca sabrás que esas opciones existen. Y son justo las que
resuelven los "esto no hace lo que yo quería" más comunes.

Sale abajo del todo, encima de los botones de Listo y Cancelar, y solo aparece en los wireds que
tienen algo que enseñar ahí. Si un wired ya tiene algo configurado en esa zona, la ventana lo abre
sola al entrar, para que no se te pase.

## Qué hay detrás

Dos cosas, según el wired.

**Los selectores de fuente.** "Seleccionar la fuente de furnis" y "Seleccionar la fuente de usuarios",
que deciden **sobre quién trabaja** ese wired concreto: el desencadenante, los del selector, los que
traiga una señal, el usuario clicado o el alcanzado. Está contado en
[Fuentes y objetivos](/conceptos/fuentes-y-objetivos/).

**Las opciones propias del wired.** Cada familia tiene las suyas. La más importante, porque la llevan
casi todas las condiciones, es la que viene ahora.

## Cumplir condición si

Cuando una condición trabaja con **varios** furnis o con **varias** personas, hay que decidir qué
significa que se cumpla: ¿tienen que cumplirla todos, o basta con uno?

Eso se decide aquí, y por defecto exige **todos**. Es la causa número uno de que una condición
parezca rota en una sala con gente: la escribiste pensando en una persona y el sistema la está
exigiendo para todas.

Las etiquetas cambian según el wired sea positivo o negativo:

| Trabaja con | En la condición positiva | En la negativa |
| --- | --- | --- |
| **Usuarios** | Todos los usuarios coinciden · Cualquier usuario coincide | Algún usuario no coincide · Ningún usuario coincide |
| **Furnis** | Todos los furnis coinciden · Cualquiera de los furnis coincide | Cualquiera de los furnis no coincide · Ninguno de los furnis coincide |

[Furnis con Usuarios](/condiciones/furnis-con-usuarios/) y su gemela son la excepción: dicen lo mismo
con otras palabras —"Uno de los furnis seleccionados tienen un usuario en él" y "Todos los furnis
seleccionados tienen usuarios en ellos"— y además **las lista al revés**, con el "uno" arriba y el
"todos" abajo. Mira cuál está marcada antes de darlo por hecho.

## Merece la pena abrirlo siempre

Aunque no vayas a tocar nada. Es medio minuto y te ahorra el rato de no entender por qué una pila se
comporta distinto con dos personas en la sala que con una.

---

# Causantes

> Los 32 causantes disponibles, agrupados por lo que vigilan.
>
> Página: https://wired.hartico.tv/causantes/

Un **causante** es la puerta de entrada de una pila: vigila algo que pasa en la sala y, cuando
ocurre, pone la pila en marcha. Sin causante no hay ejecución posible.

Puedes poner **varios causantes en la misma pila**. Cualquiera de ellos dispara los mismos efectos,
lo que te ahorra duplicar la pila entera para ofrecer dos formas de activar lo mismo.

## Por lo que vigilan

### El usuario toca algo

| Causante | Se dispara cuando |
| --- | --- |
| [Sobre un Furni](/causantes/sobre-furni/) | Alguien pisa el furni |
| [Vete](/causantes/sale-de-furni/) | Alguien deja de pisarlo |
| [Click en Furni](/causantes/clic-en-furni/) | Alguien hace clic en el furni |
| [Cambiar estado de Furni](/causantes/cambiar-estado-de-furni/) | Dos clics seguidos |
| [Click en Baldosa](/causantes/clic-en-baldosa/) | Clic en una Baldosa Invisible del suelo |
| [Usuario Da Click a Usuario](/causantes/clic-en-usuario/) | Alguien hace clic sobre otra persona |
| [Teclado](/causantes/teclado/) | Alguien pulsa una tecla concreta |

### El usuario entra, sale o habla

| Causante | Se dispara cuando |
| --- | --- |
| [Entrada](/causantes/entra-en-la-sala/) | Alguien entra |
| [Salida](/causantes/sale-de-la-sala/) | Alguien se va |
| [Clave](/causantes/dice-algo/) | Alguien escribe un mensaje |
| [Usuario Realiza Acción](/causantes/usuario-realiza-accion/) | Alguien baila, saluda o cambia de efecto |

### El tiempo

| Causante | Se dispara cuando |
| --- | --- |
| [Periodos Cortos](/causantes/periodos-cortos/) | Cada 50 ms a 500 ms |
| [Periodos](/causantes/periodos/) | Cada 0,5 s a 30 s |
| [Periodos Largos](/causantes/periodos-largos/) | Cada 5 s a 600 s |
| [¡Ya!](/causantes/ya/) | Una sola vez, tras el tiempo indicado |
| [Contador Alcanza el Tiempo Establecido](/causantes/contador-llega-a-tiempo/) | Un contador de la sala alcanza una marca |

### Los furnis

| Causante | Se dispara cuando |
| --- | --- |
| [Estado de los Furnis Cambia](/causantes/estado-del-furni-cambia/) | El furni cambia de estado |
| [Furni es Usado](/causantes/furni-es-usado/) | Alguien usa el furni |

### Otras pilas y variables

| Causante | Se dispara cuando |
| --- | --- |
| [Recibir Señal](/causantes/recibir-senal/) | Otra pila envía una señal a esta antena |
| [Cambio de variable](/causantes/cambio-de-variable/) | Una variable se crea, cambia o se borra |

### Juegos y puntuación

| Causante | Se dispara cuando |
| --- | --- |
| [Comienza el juego](/causantes/empieza-el-juego/) | Arranca la partida |
| [Acaba el juego](/causantes/termina-el-juego/) | Acaba la partida |
| [Puntos Conseguidos](/causantes/puntos-conseguidos/) | Un equipo llega a los puntos indicados |

### Colisiones

| Causante | Se dispara cuando |
| --- | --- |
| [Colisión](/causantes/colision/) | Un furni en movimiento alcanza a una persona |
| [Usuario entra en colisión](/causantes/entra-en-colision/) | Entrega al que embiste en un choque entre personas |
| [Entra en colisión con Usuario](/causantes/colision-con-usuario/) | Entrega al que se llevaron por delante |

### Bots

| Causante | Se dispara cuando |
| --- | --- |
| [Bot alcanza usuario](/causantes/bot-alcanza-usuario/) | Un bot llega hasta una persona |
| [Bot alcanza furni](/causantes/bot-alcanza-furni/) | Un bot llega hasta un furni |

### Ausencia

| Causante | Se dispara cuando |
| --- | --- |
| [Ausencia Positiva](/causantes/ausencia-positiva/) | Alguien se queda ausente |
| [Ausencia Negativa](/causantes/ausencia-negativa/) | Alguien vuelve de estar ausente |
| [Usuario AFK](/causantes/usuario-afk/) | Alguien lleva X tiempo sin hacer nada |
| [Usuario AFK Dormido](/causantes/usuario-afk-dormido/) | Alguien lleva X tiempo sin moverse |

---

# Sobre un Furni

> Se dispara cuando alguien pisa uno de los furnis que elijas.
>
> Página: https://wired.hartico.tv/causantes/sobre-furni/

El causante más usado del sistema. Vigila unos furnis concretos y dispara la pila **en el momento en
que un usuario pone el pie encima**.

## Cómo funciona

Se dispara una vez por cada entrada, y el usuario que pisó pasa a ser **el causante** de la pila: es
a quien apuntan los efectos que usan "el usuario que disparó" como fuente.

Si alguien cruza tres baldosas vigiladas seguidas, la pila se dispara tres veces, una por baldosa.

Solo cuenta entrar. Salir es otro causante distinto, [Vete](/causantes/sale-de-furni/).

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/sobre-furni.png" alt="Ventana de configuración de Sobre un Furni" class="ventana-wired" />
<!-- /ventana -->

**Selección de furnis.** Puedes elegirlos de dos formas:

- **Uno a uno**, clicándolos en la sala. Vigila exactamente esos.
- **Por tipo**, que vigila todos los furnis iguales de la sala. Si luego colocas otro del mismo tipo,
  entra solo en la vigilancia sin tener que reconfigurar nada.

La opción por tipo es la que quieres para suelos, alfombras y todo lo que vayas a ampliar después.

## Ejemplo

Una alfombra de bienvenida que saluda por su nombre a quien la pisa:

```
Pila A:
  Causante:    Sobre un Furni      [la alfombra]
  Complemento: Identificar Nombres
  Efecto:      Mensaje             ["¡Hola $usuario!"]
```

## Notas

**Los furnis apilados.** Si el usuario pisa un furni que está encima de otro, solo se dispara el
causante que vigile el furni de arriba, que es el que realmente se pisa.

**Vigilar la propia pila.** Si el furni que vigilas es el mismo sobre el que están los wireds, la
gente no podrá pisarlo salvo que los wireds estén configurados como pisables. Lo normal es vigilar un
furni al lado, no el de debajo.

**Las áreas grandes.** Vigilar por tipo un suelo de 200 baldosas significa 200 disparos potenciales
cada vez que alguien cruza el salón. Es correcto, pero mira [Límites](/conceptos/limites/) antes de
poner efectos pesados detrás.

---

# Vete

> Se dispara cuando alguien deja de pisar uno de los furnis que elijas.
>
> Página: https://wired.hartico.tv/causantes/sale-de-furni/

El reverso de [Sobre un Furni](/causantes/sobre-furni/): dispara **cuando el usuario sale** del furni
vigilado.

## Cómo funciona

Se dispara en el instante en que el usuario abandona la baldosa, y el que se fue queda como causante
de la pila. Da igual si salió andando o si lo teletransportaron.

**Salir de la sala no cuenta.** Si la persona se va o se desconecta estando encima del furni, este
causante no salta: la salida de la sala solo dispara [Salida](/causantes/sale-de-la-sala/). Es
importante si llevas una cuenta de cuánta gente hay sobre algo, porque se te queda descuadrada.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/sale-de-furni.png" alt="Ventana de configuración de Vete" class="ventana-wired" />
<!-- /ventana -->

**Selección de furnis**, uno a uno o por tipo. Igual que en Sobre un Furni.

## Ejemplo

Una luz que se enciende al entrar y se apaga al salir. Como el efecto es el mismo en los dos casos,
te basta **una sola pila** con los dos causantes:

```
Pila A:
  Causante: Sobre un Furni [la alfombra]
  Causante: Vete           [la alfombra]
  Efecto:   Mutar          [la luz]
```

Mutar alterna, así que la primera vez la enciende y la segunda la apaga. Deja la luz apagada antes de
empezar o te saldrá al revés.

Sepáralo en dos pilas solo si quieres que entrar y salir hagan cosas distintas.

## Notas

**No sirve para saber si queda alguien.** Si dos personas están sobre la alfombra y una se va, este
causante dispara igual, aunque la otra siga encima. Si lo que quieres es "cuando ya no quede nadie",
añade a la pila la condición **Furnis SIN Usuarios** apuntando a la alfombra.

**El orden con Sobre un Furni.** Al cruzar de una baldosa vigilada a otra, salta primero el "vete" de
la primera y luego el "sobre" de la segunda. Si las dos pilas tocan lo mismo, el resultado final es
el de la segunda.

---

# Click en Furni

> Se dispara cuando alguien hace clic en uno de los furnis que elijas.
>
> Página: https://wired.hartico.tv/causantes/clic-en-furni/

Dispara cuando un usuario hace clic sobre el furni vigilado, sin necesidad de que se acerque ni lo
pise.

## Cómo funciona

El que hace clic queda como causante de la pila. Funciona **a distancia**: no hace falta estar al
lado del furni.

Es la forma normal de montar botones, paneles e interruptores.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/clic-en-furni.png" alt="Ventana de configuración de Click en Furni" class="ventana-wired" />
<!-- /ventana -->

**Selección de furnis**, uno a uno o por tipo.

## Ejemplo

Un botón que teletransporta al que lo pulse:

```
Pila A:
  Causante: Click en Furni [el botón]
  Efecto:   ¡Adiós!        [destino]
```

## Notas

**El furni sigue haciendo lo suyo.** Si el furni que vigilas tiene su propio comportamiento al
clicarlo –una silla en la que te sientas, una puerta que se abre– eso sigue pasando además de
dispararse la pila.

**La distancia no se comprueba.** Cualquiera puede pulsar tu botón desde la otra punta de la sala. Si
quieres exigir cercanía, añade una condición de posición o un selector de área.

---

# Cambiar estado de Furni

> Se dispara con dos clics seguidos sobre el mismo furni.
>
> Página: https://wired.hartico.tv/causantes/cambiar-estado-de-furni/

Se dispara cuando un usuario hace **dos clics seguidos** sobre el mismo furni.

:::note[El nombre despista]
Este causante se llama "Cambiar estado de Furni", pero no vigila el estado: vigila el **doble clic**.
Si lo que buscas es reaccionar a que un furni cambie de estado, el que quieres es
[Estado de los Furnis Cambia](/causantes/estado-del-furni-cambia/).
:::

## Cómo funciona

Sirve para separar dos acciones sobre el mismo objeto: un clic hace una cosa, dos clics hacen otra.

Si tienes montadas las dos pilas, el doble clic dispara **las dos**, porque el primero de los dos
clics ya activó la de clic simple. No son excluyentes, y conviene tenerlo en cuenta al diseñar.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/cambiar-estado-de-furni.png" alt="Ventana de configuración de Cambiar estado de Furni" class="ventana-wired" />
<!-- /ventana -->

**Selección de furnis.** Puedes elegirlos de dos formas:

- **Uno a uno**, clicándolos en la sala.
- **Por tipo**, que vigila todos los furnis iguales de la sala.

## Ejemplo

Un cofre que se abre con un clic y reparte premio con dos:

```
Pila A:
  Causante: Click en Furni [el cofre]
  Efecto:   Mutar          [el cofre]

Otra baldosa:
  Causante: Cambiar estado de Furni [el cofre]
  Efecto:   Dar puntos              [50 · aumentar]
```

## Notas

**No es exclusivo del clic simple.** Si necesitas que las dos acciones sean incompatibles, usa una
variable como cerrojo en vez de confiar en que los causantes se separen solos.

**El doble clic tiene que ser sobre el mismo furni.** Dos clics rápidos en furnis distintos no
cuentan; son dos clics simples.

---

# Click en Baldosa

> Dispara al clicar una Baldosa Invisible puesta en el suelo.
>
> Página: https://wired.hartico.tv/causantes/clic-en-baldosa/

Dispara cuando un usuario hace clic sobre una **Baldosa Invisible: Clic** que hayas colocado en el
suelo.

## Cómo funciona

Aquí hay una pieza que no se ve venir: este causante **no vigila el suelo a secas**. Necesita que
pongas el furni **Baldosa Invisible: Clic** en las casillas que te interesen y que lo selecciones en
la ventana. Sin ese furni no dispara nunca, por muchas veces que la gente clique ahí.

Es invisible, así que el jugador no ve nada: para él es suelo normal. Pero tiene que estar puesto.

El usuario que clicó queda como causante. A diferencia del clic en furni, aquí lo que importa es la
posición del suelo, no el mueble.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/clic-en-baldosa.png" alt="Ventana de configuración de Click en Baldosa" class="ventana-wired" />
<!-- /ventana -->

**Selección de furnis**, uno a uno o por tipo. Aquí eliges las **Baldosas Invisibles: Clic** que
quieres vigilar. Cualquier otro furni que selecciones se ignora.

## Ejemplo

Una zona del suelo que actúa de campo minado. Primero cubre las casillas con Baldosas Invisibles:
Clic, y luego:

```
Pila A:
  Causante: Click en Baldosa [las baldosas invisibles de la zona]
  Efecto:   Mensaje          ["¡Boom!" · solo el usuario]
```

## Notas

**Si no dispara, casi seguro que te falta el furni.** Es el fallo de este causante: se configura
igual que los demás y parece que debería funcionar sobre cualquier baldosa. No lo hace.

**El usuario va a caminar igualmente.** Clicar el suelo es la forma de moverse, así que la pila
dispara y además la persona se pone en marcha hacia allí. Si quieres impedirlo, tendrás que
congelarla o teletransportarla.

---

# Usuario Da Click a Usuario

> Se dispara cuando alguien hace clic sobre otra persona de la sala.
>
> Página: https://wired.hartico.tv/causantes/clic-en-usuario/

Dispara cuando un usuario hace clic **sobre otro usuario**. Es el causante de las interacciones
persona a persona: saludar, retar, marcar, intercambiar.

## Cómo funciona

Aquí hay **dos personas implicadas**, y conviene tenerlas claras porque los efectos pueden apuntar a
cualquiera de las dos:

- **El causante** es quien hizo clic.
- **El usuario clicado** es quien recibió el clic. Está disponible como fuente propia en los efectos,
  y también como centro del selector de vecindario.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/clic-en-usuario.png" alt="Ventana de configuración de Usuario Da Click a Usuario" class="ventana-wired" />
<!-- /ventana -->

**Cuando se hace clic en un Usuario**, con dos casillas:

- **No Rotar** – evita que tu avatar gire hacia la persona clicada. Útil cuando el giro delataría la
  interacción o rompería una animación en curso.
- **No abrir el menu del avatar** – impide que salga el menú normal de acciones. Es lo que convierte
  el clic en un gesto exclusivo de tu pila.

Marcar la segunda es casi siempre lo que quieres: si no, el usuario ve el menú además de que ocurra
tu efecto.

## Ejemplo

Un juego de "pillar": clicas a alguien y le pasas la mancha.

```
Pila A:
  Causante: Usuario Da Click a Usuario [no abrir menú]
  Efecto:   Dar variable               [al usuario clicado: "manchado" = 1]
  Efecto:   Mensaje                    ["¡Te la quedas!"]
```

## Notas

**Si la condición falla, el clic vuelve a ser normal.** Cuando una condición de la pila no se cumple,
el cliente deja pasar el clic como si el wired no existiera y se abre el menú del avatar de siempre.
Es deliberado, para que una pila que solo aplica en cierta zona no rompa el clic en el resto de la
sala.

**El clicado no es el causante.** Es el error más común. Si un efecto no lleva la fuente puesta en
"usuario clicado", va a actuar sobre quien hizo clic, no sobre quien lo recibió.

---

# Teclado

> Se dispara cuando alguien pulsa una tecla concreta estando en la sala.
>
> Página: https://wired.hartico.tv/causantes/teclado/

Dispara cuando un usuario pulsa una tecla concreta. Es lo que permite montar controles tipo juego
–WASD para moverse, espacio para saltar– dentro de una sala.

## Cómo funciona

Normalmente todo lo que tecleas en el hotel va a parar al chat. Este causante **reserva una tecla**
para la sala: cuando la pulsas, en vez de escribirse, dispara la pila.

La reserva es **por sala y por tecla**. Solo afecta a las teclas que hayas configurado, solo en las
salas donde esté el wired, y no toca a nadie del resto del hotel.

Si la pila tiene condiciones y **no se cumplen**, la tecla vuelve a ser del chat y la letra se
escribe con normalidad, en su sitio. Eso permite tener las teclas reservadas solo mientras estás
sobre cierta baldosa y escribir normal en el resto de la sala.

Se identifica la **tecla física**, no el carácter. La `W` es la misma tecla en un teclado español que
en uno francés, aunque produzca letras distintas.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/teclado.png" alt="Ventana de configuración de Teclado" class="ventana-wired" />
<!-- /ventana -->

**Tecla configurada.** Pulsa la tecla que quieras asignar y queda registrada.

**Cuándo activar**, con tres modos:

| Modo | Dispara |
| --- | --- |
| **Al presionar** | En el momento de pulsar |
| **Al soltar** | En el momento de soltar |
| **Al mantener** | Tras mantenerla pulsada el tiempo que indiques |

En el modo mantener aparece además **Aguantarla (ms)**, entre 100 y 10.000 milisegundos.

## Ejemplo

Movimiento con WASD. Son cuatro pilas, una por tecla, todas en la misma pila:

```
Pila A:
  Causante:  Teclado                      [W · al presionar]
  Condición: Causante está Sobre el Furni [la plataforma de juego]
  Efecto:    Mover y Rotar Usuario        [una baldosa al norte]
```

Y lo mismo con A, S y D cambiando la dirección.

## Notas

**Si ya tienes algo escrito en el chat, la tecla no se reserva.** El cliente solo intercepta las teclas
cuando la barra está vacía; si estabas escribiendo, la letra va al chat y la pila no se dispara. Es lo
que más despista al probarlo: parece que el wired no funciona y lo que pasa es que tenías el cursor en
el chat.


**Reserva solo lo que uses.** Cada tecla reservada es una tecla que la gente no puede escribir en el
chat mientras esté en la sala. Reservar letras comunes sin una condición que las libere es una
molestia constante para quien intenta conversar.

**Los espectadores no se ven afectados.** Quien no cumpla las condiciones escribe con normalidad.
Aprovéchalo: pon la condición de estar en la zona de juego y el chat seguirá funcionando en el resto
de la sala.

---

# Entrada

> Se dispara cuando alguien entra en la sala.
>
> Página: https://wired.hartico.tv/causantes/entra-en-la-sala/

Dispara cuando un usuario entra en la sala. El recién llegado queda como causante.

## Cómo funciona

Se dispara una vez por cada entrada, sea la primera del día o la número cincuenta.

Es el causante para dar la bienvenida, repartir efectos de entrada, colocar a la gente en su sitio o
llevar la cuenta de visitas.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/entra-en-la-sala.png" alt="Ventana de configuración de Entrada" class="ventana-wired" />
<!-- /ventana -->

**Elige el causante**, con dos opciones:

- **Cualquier avatar** – dispara con quien sea.
- **Un avatar concreto** – solo con el nombre que escribas.

La segunda sirve para recibimientos personalizados o para reaccionar a la llegada de alguien del
staff.

## Ejemplo

Dar un efecto y un saludo a quien entra:

```
Pila A:
  Causante:    Entrada             [cualquier avatar]
  Complemento: Identificar Nombres
  Efecto:      Mensaje             ["Bienvenido, $usuario"]
  Efecto:      Mensaje             ["Bienvenido" · con retardo 1 s]
```

## Notas

**El efecto Teletransportar a Sala no funciona colgado de este causante.** Está vetado a propósito,
porque llegada más reenvío es un bucle infinito entre dos salas. Si quieres reenviar a quien entra,
ponle una baldosa nada más entrar y usa [Sobre un Furni](/causantes/sobre-furni/).

**Llega antes de que la sala esté del todo lista para él.** Si el efecto depende de que el usuario ya
esté colocado y dibujado, ponle medio segundo o un segundo de retardo. Sin retardo, algunos efectos
visuales se pierden.

**Se dispara también al volver.** Alguien que sale y entra cuenta dos veces. Si estás contando
visitantes únicos, necesitas una variable de usuario que recuerde si ya vino.

---

# Salida

> Se dispara cuando alguien sale de la sala.
>
> Página: https://wired.hartico.tv/causantes/sale-de-la-sala/

Dispara cuando un usuario abandona la sala, por la puerta o por desconexión.

## Cómo funciona

El que se va queda como causante, aunque para cuando los efectos corran ya no esté disponible para
todo. Los efectos que actúan sobre el propio usuario –moverlo, darle algo– no van a tener sentido;
los que actúan sobre la sala sí.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/sale-de-la-sala.png" alt="Ventana de configuración de Salida" class="ventana-wired" />
<!-- /ventana -->

**Elige el causante**: cualquier avatar, o un avatar concreto por nombre.

## Ejemplo

Un aforo que baja cuando alguien se va:

```
Pila A:
  Causante: Salida                    [cualquier avatar]
  Efecto:   Cambiar valor de variable [aforo, restar 1]
```

## Notas

**No intentes darle nada al que se va.** Ya no está. Usa este causante para actualizar el estado de
la sala, no para actuar sobre la persona.

**Limpia lo que dejó.** Si marcas usuarios con variables mientras están dentro, este es el sitio para
borrarlas. Si no, la sala acumula marcas de gente que ya no está.

---

# Clave

> Se dispara cuando alguien escribe un mensaje que coincide con lo que indiques.
>
> Página: https://wired.hartico.tv/causantes/dice-algo/

Dispara cuando un usuario escribe en el chat algo que encaja con el patrón que configures. Es la base
de los comandos de sala.

## Cómo funciona

Cada mensaje que se escribe en la sala se compara con el patrón. Si encaja, la pila arranca y quien
lo escribió queda como causante.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/dice-algo.png" alt="Ventana de configuración de Clave" class="ventana-wired" />
<!-- /ventana -->

**Mensaje desencadenante.** El texto a buscar.

**Escoge el tipo**, con tres modos:

| Modo | Encaja con |
| --- | --- |
| **Contiene la palabra clave** | Cualquier mensaje que incluya ese texto |
| **Coincidencia exacta** | Solo si el mensaje es exactamente ese texto |
| **Coincide con cualquier texto** | Cualquier cosa que se diga. Deshabilita el campo de texto |

**Opciones**, dos casillas:

- **Ocultar el mensaje desencadenante** – el mensaje no aparece en el chat. Viene marcada, y es lo
  que hace que los comandos se sientan como comandos y no como conversación.
- **El causante es dueño de la sala** – solo dispara si quien lo escribió es el propietario. Es un
  filtro de permisos rápido, sin condición aparte.

## Ejemplo

Un comando para abrir la puerta, solo para el dueño:

```
Pila A:
  Causante: Clave    ["!abrir" · coincidencia exacta ·
                          ocultar mensaje · causante es dueño]
  Efecto: Mutar [la puerta]
```

## Notas

**Contiene es más amplio de lo que parece.** Con la palabra clave `hola`, el mensaje "ahola qué tal"
también encaja. Para comandos, usa coincidencia exacta o empieza siempre por un símbolo poco común.

**El mensaje solo se oculta si la pila pasa sus condiciones.** El sistema decide si esconderlo
**después** de evaluarlas, así que si alguien escribe la palabra clave y no cumple los requisitos, su
mensaje se ve en el chat con normalidad. Eso es cómodo —el que no tiene permiso no se queda con la
duda— pero significa que la palabra clave se hace pública en cuanto alguien la prueba sin cumplir.

Si tu clave tiene que ser secreta de verdad, no la protejas con condiciones: monta una pila que la
oculte siempre y decide dentro qué hacer, con
[Ejecutar pilas Negativo](/efectos/ejecutar-pilas-negativo/) para el caso de que no tenga permiso.

**Cuidado con cualquier texto.** Dispara con absolutamente todo lo que se hable en la sala. Con una
sala concurrida son muchísimas ejecuciones; mira [Límites](/conceptos/limites/).

---

# Usuario Realiza Acción

> Se dispara cuando alguien baila, saluda o cambia de efecto.
>
> Página: https://wired.hartico.tv/causantes/usuario-realiza-accion/

Dispara cuando un usuario hace una acción con su avatar: bailar, cambiar de efecto, hacer un gesto.

## Cómo funciona

Vigila el estado del avatar y dispara cuando pasa a la acción que hayas indicado. Quien la hizo queda
como causante.

Es la manera de reaccionar a lo que la gente hace con su cuerpo, sin pedirles que escriban comandos.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/usuario-realiza-accion.png" alt="Ventana de configuración de Usuario Realiza Acción" class="ventana-wired" />
<!-- /ventana -->

**Acción desencadenante**, con dos filtros:

- **Filtrar por señal** – reacciona a los gestos y señales del avatar.
- **Filtrar por baile** – reacciona a un baile concreto de los disponibles.

Elige uno y selecciona cuál de la lista.

## Ejemplo

Una pista de baile que premia a quien baile en ella:

```
Pila A:
  Causante:  Usuario Realiza Acción       [filtrar por baile · baile 1]
  Condición: Causante está Sobre el Furni [la pista]
  Efecto:    Dar puntos                   [1 punto]
```

## Notas

**Se dispara al cambiar, no mientras dura.** Alguien que se pone a bailar dispara una vez. Si quieres
premiar el rato que lleva bailando, combínalo con un causante periódico y una condición.

---

# Periodos

> Repite la pila cada medio segundo a 30 segundos. El causante de tiempo de uso general.
>
> Página: https://wired.hartico.tv/causantes/periodos/

Repite la pila **para siempre**, cada tantos segundos. Es el causante de tiempo que vas a usar el 90%
de las veces.

## Cómo funciona

Arranca solo, sin que nadie haga nada, en cuanto se coloca. Sigue disparando aunque la sala esté
vacía.

Como no hay nadie que lo dispare, **no hay usuario causante**. Los efectos que necesiten una persona
tendrán que sacarla de un selector.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/periodos.png" alt="Ventana de configuración de Periodos" class="ventana-wired" />
<!-- /ventana -->

**Establecer tiempo**, entre **0,5 y 30 segundos**, en pasos de medio segundo.

## Ejemplo

Una luz que parpadea cada dos segundos:

```
Pila A:
  Causante: Periodos [2 s]
  Efecto:   Mutar    [la lámpara]
```

## Notas

**Con la sala vacía se para solo.** Cuando no queda nadie dentro, la sala se descarga a los diez
segundos y con ella se detienen todos los periódicos. No hace falta que los pares tú: no están
gastando servidor de madrugada.

Lo que sí cuesta es cuando hay gente. Veinte pilas periódicas de decoración corriendo a la vez con la
sala llena es lo que hay que vigilar, y ahí sí ayuda una condición que las apague cuando no aportan.

**Hay cuatro efectos que no funcionan con los periódicos**, y no avisan de nada. Es la causa número
uno de "mi pila periódica no hace nada":

| Efecto | Se puede arreglar |
| --- | --- |
| [Mensaje](/efectos/mensaje/) | Sí, con un selector de usuarios delante |
| [¡Adiós!](/efectos/adios/) | Sí, con un selector de usuarios delante |
| [Teletransportar a Sala](/efectos/teletransportar-a-sala/) | Sí, con un selector de usuarios delante |
| [Expulsar Usuario](/efectos/expulsar-usuario/) | **No.** Con un periódico no hay manera |

El veto es de los tres periódicos: este, [Periodos Cortos](/causantes/periodos-cortos/) y
[Periodos Largos](/causantes/periodos-largos/). Y en los tres primeros basta con que el efecto trabaje
sobre **los usuarios del selector** en vez de sobre el desencadenante — que es lo que quieres de todas
formas, porque en una pila periódica no hay desencadenante.

**No hay causante humano.** Si un efecto tuyo no hace nada en una pila periódica, casi seguro es
porque esperaba un usuario y no lo hay. Añade un selector.

**Al volver a entrar, la cuenta empieza de cero.** Como la sala se ha descargado, los periódicos
arrancan de nuevo cuando alguien entra; no retoman por donde iban.

---

# Periodos Cortos

> Repite la pila cada 50 a 500 milisegundos. Para animación fina.
>
> Página: https://wired.hartico.tv/causantes/periodos-cortos/

Como [Periodos](/causantes/periodos/), pero mucho más rápido: por debajo del segundo, en pasos de 50
milisegundos.

## Cómo funciona

Idéntico a Periodos en todo salvo el rango. Existe para lo que necesita verse **fluido**: movimiento
continuo de furnis, animaciones, efectos que deben parecer suaves.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/periodos-cortos.png" alt="Ventana de configuración de Periodos Cortos" class="ventana-wired" />
<!-- /ventana -->

**Establecer tiempo**, entre **50 ms y 500 ms**, en pasos de 50 ms.

## Ejemplo

Un furni que se desliza suave por la sala:

```
Pila A:
  Causante:    Periodos Cortos                  [100 ms]
  Complemento: Cancelar Animación de Movimiento
  Efecto:      Mover                            [una baldosa adelante]
```

## Notas

**Solo puedes poner uno por baldosa.** Es un límite del sistema. Puedes tener hasta once causantes
periódicos normales en la misma pila, pero de los cortos, uno.

**Es la pieza más cara del sistema.** A 50 ms una pila corre veinte veces por segundo. Cinco pilas
así son cien ejecuciones por segundo. Úsalo solo cuando la fluidez sea el objetivo, y súbelo al
máximo que te siga pareciendo bien. Lee [Límites](/conceptos/limites/) antes de montarlos en serie.

---

# Periodos Largos

> Repite la pila cada 5 segundos a 10 minutos. Para ciclos de sala.
>
> Página: https://wired.hartico.tv/causantes/periodos-largos/

Como [Periodos](/causantes/periodos/), pero para intervalos largos: de cinco segundos a diez minutos.

## Cómo funciona

Idéntico en comportamiento, solo cambia el rango. Es el causante para lo que ocurre "de vez en
cuando": rondas de un juego, avisos, reinicios de estado, rotación de premios.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/periodos-largos.png" alt="Ventana de configuración de Periodos Largos" class="ventana-wired" />
<!-- /ventana -->

**Establecer tiempo**, entre **5 y 600 segundos**, en pasos de 5 segundos.

## Ejemplo

Un aviso automático cada cinco minutos:

```
Pila A:
  Causante: Periodos Largos [300 s]
  Efecto:   Mensaje         ["Recuerda leer las normas de la sala"]
```

## Notas

**Nadie ve el primer disparo.** Si el intervalo es de diez minutos, quien entre justo después tendrá
que esperar diez minutos para ver algo. Para cosas que deban notarse al llegar, usa además el
causante de entrar en la sala.

---

# ¡Ya!

> Dispara pasado el tiempo indicado desde que arranca la sala. Se puede rearmar.
>
> Página: https://wired.hartico.tv/causantes/ya/

Dispara **una vez** cuando pasa el tiempo que indiques, contando desde que la sala se pone en marcha.
Después se queda callado, salvo que alguien ponga el reloj de la sala a cero.

## Cómo funciona

Es el causante para preparar una sala: colocar las cosas en su sitio de salida, encender lo que tenga
que estar encendido, dejar las variables a cero.

Y se puede **rearmar**: el efecto [Reset](/efectos/reset/) pone a cero el reloj interno de la sala, y
con él este causante vuelve a estar listo para disparar cuando pase otra vez el tiempo marcado.

Esa pareja es más útil de lo que parece. Con un Reset colgado de algo que pase a menudo —que alguien
hable, que alguien pise una baldosa— este causante se convierte en un **detector de inactividad**: solo
llega a disparar cuando la sala lleva callada el tiempo que marcaste.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/ya.png" alt="Ventana de configuración de ¡Ya!" class="ventana-wired" />
<!-- /ventana -->

**Establecer tiempo**, entre **0,5 y 600 segundos**, en pasos de medio segundo.

## Ejemplo

Preparar la sala un segundo después de arrancar:

```
Pila A:
  Causante: ¡Ya!                      [1 s]
  Efecto:   A cero                    [todos los del juego]
  Efecto:   Cambiar valor de variable [ronda = 0]
```

## Notas

**Cuenta desde que la sala arranca, no desde que entras tú.** La sala arranca cuando entra la primera
persona y se apaga al quedarse vacía. Si buscas algo que pase al entrar cada usuario, el causante es
[Entrada](/causantes/entra-en-la-sala/).

---

# Contador Alcanza el Tiempo Establecido

> Se dispara cuando un contador de la sala alcanza la marca que indiques.
>
> Página: https://wired.hartico.tv/causantes/contador-llega-a-tiempo/

Dispara cuando un furni contador de la sala llega al tiempo que le marques. Es la pieza de los juegos
con cronómetro.

## Cómo funciona

A diferencia de los periódicos, este no lleva su propio reloj: **lee un contador que hay en la sala**
y dispara cuando ese contador alcanza la marca. Quién arranca, para o reinicia el contador es cosa de
otros efectos.

:::caution[Solo vale el Contador Wired]
De todos los relojes del catálogo, aquí solo sirven **Contador Wired Pequeño** y **Contador reloj
de arena**. Los temporizadores de partida —Contador Banzai, Contador Freeze, los Contador moderno
y los Temporizador de juego— **no valen**: si eliges uno, esto no se cumple nunca y no hay ningún
aviso.
:::


Eso te da control real sobre el tiempo de un juego: puedes pausarlo, reiniciarlo o adelantarlo, y
este causante reacciona a lo que marque.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/contador-llega-a-tiempo.png" alt="Ventana de configuración de Contador Alcanza el Tiempo Establecido" class="ventana-wired" />
<!-- /ventana -->

**Selección del contador**, que eliges clicándolo en la sala.

**Minutos transcurridos**, de 0 a 99.

**Segundos transcurridos**, de 0 a 119.

Los dos se suman: 1 minuto y 90 segundos son dos minutos y medio.

## Ejemplo

Terminar una ronda a los tres minutos:

```
Pila A:
  Causante: Contador Alcanza el Tiempo Establecido [el contador · 3 min 0 s]
  Efecto:   Mensaje                                ["¡Se acabó el tiempo!"]
  Efecto:   Control de Contador                    [el temporizador · parar]
```

## Notas

**Necesita un contador puesto en la sala.** Sin el furni contador seleccionado, el causante no puede
dispararse nunca.

**Dispara al alcanzar la marca, no mientras la supera.** Si quieres varias marcas –aviso al minuto,
aviso a los dos– necesitas una pila por marca.

---

# Estado de los Furnis Cambia

> Se dispara cuando uno de los furnis que vigilas cambia de estado.
>
> Página: https://wired.hartico.tv/causantes/estado-del-furni-cambia/

Dispara cuando un furni vigilado cambia de estado: una lámpara que se enciende, una puerta que se
abre, un dado que sale.

## Cómo funciona

Vigila el estado, no quién lo cambió. Da igual si lo cambió una persona clicando, otro wired o un
efecto retardado: si el estado cambia, dispara.

Eso lo hace ideal para **reaccionar en cadena** sin tener que enviar señales.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/estado-del-furni-cambia.png" alt="Ventana de configuración de Estado de los Furnis Cambia" class="ventana-wired" />
<!-- /ventana -->

**Selección de furnis**, uno a uno o por tipo.

**Opciones**, con dos modos:

- **Desencadenar para el estado actual** – solo dispara cuando el furni llega al estado en el que
  estaba al configurarlo. Es el modo para "cuando se abra", no "cuando cambie".
- **Desencadenar para todos los estados** – dispara con cualquier cambio.

## Ejemplo

Una alarma que salta cuando se abre la caja fuerte:

```
Pila A:
  Causante: Estado de los Furnis Cambia [la caja · estado actual = abierta]
  Efecto:   Mensaje                     ["¡Alguien abrió la caja!"]
```

## Notas

**Los bucles son fáciles aquí.** Si la pila cambia el estado de un furni que ella misma vigila, se
vuelve a disparar. El servidor corta la recursión, pero el resultado es impredecible. Vigila un furni
y cambia otro.

---

# Furni es Usado

> Se dispara cuando alguien usa el furni.
>
> Página: https://wired.hartico.tv/causantes/furni-es-usado/

Dispara cuando un usuario **usa** el furni vigilado, es decir, cuando interactúa con él de la manera
propia de ese furni.

## Cómo funciona

A diferencia de [Estado de los Furnis Cambia](/causantes/estado-del-furni-cambia/), aquí sí importa
que haya **una persona detrás**: quien usó el furni queda como causante de la pila.

Es el causante para interruptores y palancas donde necesitas saber quién los accionó.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/furni-es-usado.png" alt="Ventana de configuración de Furni es Usado" class="ventana-wired" />
<!-- /ventana -->

**Selección de furnis**, uno a uno o por tipo.

## Ejemplo

Una palanca que registra quién la accionó:

```
Pila A:
  Causante:    Furni es Usado      [la palanca]
  Complemento: Identificar Nombres
  Efecto:      Mensaje             ["$usuario ha activado la palanca"]
```

## Notas

**No es lo mismo que el clic.** Usar un furni y clicarlo no siempre coinciden: hay furnis que se usan
sin cambiar de estado y furnis que cambian de estado sin que nadie los use. Si lo que quieres es
detectar el clic, usa [Click en Furni](/causantes/clic-en-furni/).

---

# Recibir Señal

> Se dispara cuando otra pila envía una señal a la antena que escuchas.
>
> Página: https://wired.hartico.tv/causantes/recibir-senal/

Dispara cuando otra pila envía una señal a la antena que este causante tiene seleccionada. Es la
pieza que conecta pilas que están en baldosas distintas.

## Cómo funciona

Está explicado a fondo en [Señales y pilas remotas](/conceptos/senales/). Lo esencial:

- Escucha una **antena**, que es un furni cualquiera haciendo de canal.
- Cuando llega la señal, la pila arranca.
- La señal puede **traer consigo** el usuario y los furnis de la pila que la envió, disponibles como
  fuente en los efectos.
- Muchas pilas pueden escuchar la misma antena, y todas evalúan sus condiciones contra el mismo
  estado de la sala.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/recibir-senal.png" alt="Ventana de configuración de Recibir Señal" class="ventana-wired" />
<!-- /ventana -->

**Selección de la antena**, uno a uno o por tipo.

## Ejemplo

Una puerta que se abre desde un botón lejano:

```
Pila A:
  Causante: Click en Furni [el botón]
  Efecto:   Enviar señal   [antena A]

Pila B:
  Causante: Recibir Señal [antena A]
  Efecto:   Mutar         [la puerta]
```

## Notas

**Si mueves o recoges la antena, se rompe el enlace.** Las pilas dejan de encontrarse y no hay aviso.

**Una antena por propósito.** Usar la misma antena para todo convierte cualquier envío en un disparo
global de media sala. Es la causa habitual de "se activan cosas que no toca".

---

# Cambio de variable

> Se dispara cuando una variable se crea, cambia de valor o se elimina.
>
> Página: https://wired.hartico.tv/causantes/cambio-de-variable/

Dispara cuando una variable de la sala cambia. Es lo que convierte las variables en algo activo:
en vez de tener que consultarlas, la pila reacciona sola.

## Cómo funciona

Vigila una variable concreta y dispara según el tipo de cambio que le indiques. Permite montar
sistemas donde una pila escribe y otra reacciona, sin señales de por medio.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/cambio-de-variable.png" alt="Ventana de configuración de Cambio de variable" class="ventana-wired" />
<!-- /ventana -->

**Escoge una variable**, de las disponibles en la sala.

**Desencadenar cuando la variable**, con tres casillas. Son casillas, no opciones excluyentes: puedes
marcar varias y la pila disparará con cualquiera de ellas.

| Casilla | Dispara cuando |
| --- | --- |
| **Es creada** | La variable aparece por primera vez |
| **Cambia su valor** | Su valor cambia |
| **Se elimina** | La variable desaparece |

Al marcar **Cambia su valor** se habilitan tres subcasillas que afinan qué clase de cambio te
interesa. **Si no marcas ninguna, valen las tres**: cualquier cambio dispara. Solo hace falta tocarlas
si quieres filtrar.

| Subcasilla | Dispara cuando |
| --- | --- |
| **Aumentado** | El nuevo valor es mayor que el anterior |
| **Disminuido** | El nuevo valor es menor |
| **Sin cambios** | Se escribió el mismo valor que ya tenía |

Aumentado y disminuido son los que hacen útil este causante para contadores: te dicen la dirección
del cambio sin que tengas que guardar tú el valor anterior. Y "sin cambios" es la forma de detectar
una escritura que no alteró nada, que es justo lo que te salva de los bucles.

## Ejemplo

Avisar cada vez que sube el marcador:

```
Pila A:
  Causante:    Cambio de variable [puntos · aumentado]
  Complemento: Valor de Variable  [puntos]
  Efecto:      Mensaje            ["Vamos por $valor puntos"]
```

## Notas

**Cuidado con los bucles.** Si la pila que reacciona al cambio vuelve a escribir la misma variable,
se dispara a sí misma. Usa una variable distinta para la respuesta, o el modo "sin cambios" para
detectar el caso.

---

# Puntos Conseguidos

> Se dispara cuando un equipo alcanza los puntos que indiques.
>
> Página: https://wired.hartico.tv/causantes/puntos-conseguidos/

Dispara cuando la puntuación de un equipo llega a la cifra que marques. Es el causante que cierra un
juego por puntos.

## Cómo funciona

Se comprueba cada vez que alguien suma puntos, y mira el marcador **del equipo de esa persona**. Si ese
equipo está en la cifra que marcaste o por encima, dispara, y el que acaba de puntuar queda como
causante.

De ahí salen dos cosas que conviene tener claras. La primera es que **no salta una sola vez**: mientras
el equipo siga sumando por encima del objetivo, vuelve a saltar con cada punto. Si lo usas para
proclamar un ganador, protégelo con una variable o con el complemento
[Límite de Ejecución](/complementos/limite-de-ejecucion/), o anunciarás al mismo ganador cinco veces.

La segunda es que **cada equipo lleva su cuenta**: no es un marcador único de la sala. El primero que
llegue a la cifra dispara, sea del color que sea.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/puntos-conseguidos.png" alt="Ventana de configuración de Puntos Conseguidos" class="ventana-wired" />
<!-- /ventana -->

**Establecer puntuación**, entre **1 y 1000 puntos**.

## Ejemplo

Terminar la partida cuando alguien llegue a 10:

```
Pila A:
  Causante: Puntos Conseguidos  [10 puntos]
  Efecto:   Mensaje             ["¡Tenemos ganador!"]
  Efecto:   Control de Contador [el temporizador · parar]
```

## Notas

**Quien no esté en un equipo no puntúa.** Los puntos van al marcador de un color, así que si nadie se
ha alistado no hay nada que sumar y este causante no llega a dispararse. Es lo primero que hay que
descartar cuando un juego por puntos no reacciona.

---

# Comienza el juego

> Se dispara cuando arranca la partida.
>
> Página: https://wired.hartico.tv/causantes/empieza-el-juego/

Dispara en el momento en que empieza una partida en la sala.

## Cómo funciona

Es el sitio donde preparas todo lo que tiene que estar listo al empezar: repartir a la gente por los
equipos, colocar los furnis, poner los marcadores a cero, abrir las puertas.

No tiene usuario causante: es un evento de la sala, no de una persona.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/empieza-el-juego.png" alt="Ventana de configuración de Comienza el juego" class="ventana-wired" />
<!-- /ventana -->

No tiene opciones. Colócalo y ya está.

## Ejemplo

```
Pila A:
  Causante: Comienza el juego
  Efecto:   A cero            [los del tablero]
  Efecto:   Mensaje           ["¡Empieza la partida!"]
```

## Notas

**No arranca el juego, reacciona a que arranque.** Para empezar la partida hace falta el efecto
correspondiente en otra pila.

---

# Acaba el juego

> Se dispara cuando acaba la partida.
>
> Página: https://wired.hartico.tv/causantes/termina-el-juego/

Dispara cuando termina una partida en la sala.

## Cómo funciona

El sitio donde recoges: anunciar el resultado, repartir premios, devolver a la gente a la zona de
espera y dejar la sala lista para la siguiente ronda.

No tiene usuario causante.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/termina-el-juego.png" alt="Ventana de configuración de Acaba el juego" class="ventana-wired" />
<!-- /ventana -->

No tiene opciones.

## Ejemplo

```
Pila A:
  Causante: Acaba el juego
  Efecto:   Mensaje        ["Fin de la partida"]
  Efecto:   ¡Adiós!        [a la zona de espera · con retardo 2 s]
```

## Notas

**Corre también si la partida se corta.** No asumas que llegó al final "bien"; si necesitas
distinguir un final normal de uno forzado, guárdalo tú en una variable.

---

# Colisión

> Se dispara cuando un furni en movimiento choca contra algo.
>
> Página: https://wired.hartico.tv/causantes/colision/

Dispara cuando un furni que se está moviendo por wired se topa con una **persona**.

## Cómo funciona

Ojo con el nombre: **no salta contra muros ni contra otros furnis**. Solo contra gente. Un furni que
choca con una pared se para o rebota, pero no avisa a nadie.

Esa es justo su gracia: es la forma de enterarte de que tu furni en movimiento ha alcanzado a
alguien, y de ahí salen los juegos de pillar, las trampas y los proyectiles. La persona alcanzada
queda como desencadenante de la pila.

Lo lanzan los efectos de movimiento que persiguen o recorren:
[Cambiar dirección de Furni](/efectos/cambiar-direccion/), [Caza](/efectos/caza/),
[Caza Azul](/efectos/caza-azul/) y [Caza Amarillo](/efectos/caza-amarillo/). **[Mover](/efectos/mover/)
no lo lanza**, aunque el furni se quede bloqueado contra alguien.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/colision.png" alt="Ventana de configuración de Colisión" class="ventana-wired" />
<!-- /ventana -->

No tiene opciones propias.

## Ejemplo

Una bola que recorre la sala y elimina a quien alcanza. Hacen falta dos pilas: una que mantiene la
bola en marcha y otra que resuelve el impacto.

```
Pila A:
  Causante: Periodos                   [1 s]
  Efecto:   Cambiar dirección de Furni [la bola · hacia el este · media vuelta]

Pila B:
  Causante: Colisión
  Efecto:   Mensaje  ["¡Te ha dado la bola!" · solo el usuario]
  Efecto:   ¡Adiós!  [la grada]
```

La Pila B no nombra la bola en ninguna parte: el causante ya le entrega a la persona alcanzada.

## Notas

**Solo detecta choques provocados por wired.** Un furni que alguien arrastra a mano no dispara este
causante.

---

# Usuario entra en colisión

> Se dispara cuando un usuario provoca un choque.
>
> Página: https://wired.hartico.tv/causantes/entra-en-colision/

Dispara cuando un usuario es **quien provoca** un choque al cruzarse con otra persona.

## Cómo funciona

Es solo **entre personas**: un furni en movimiento no cuenta, para eso está
[Colisión](/causantes/colision/).

El que provoca el choque queda como causante, y el sistema decide quién es por quién estaba
caminando: si uno va andando y el otro está parado, el que embiste es el que andaba. Es el lado
"activo" de la colisión.

Junto con [Entra en colisión con Usuario](/causantes/colision-con-usuario/) forma la pareja que
permite tratar de forma distinta a quien embiste y a quien recibe.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/entra-en-colision.png" alt="Ventana de configuración de Usuario entra en colisión" class="ventana-wired" />
<!-- /ventana -->

No tiene opciones propias.

## Ejemplo

Un juego de choques donde quien embiste pierde un punto:

```
Pila A:
  Causante: Usuario entra en colisión
  Efecto:   Dar puntos                [-1 al causante]
```

## Notas

**Depende de los complementos de movimiento.** Si en la sala todo el mundo puede atravesarse, no hay
choques que detectar.

---

# Entra en colisión con Usuario

> Se dispara cuando un usuario choca contra otro usuario.
>
> Página: https://wired.hartico.tv/causantes/colision-con-usuario/

Dispara cuando dos usuarios chocan entre sí. Es el lado "receptor" de la colisión.

## Cómo funciona

Complementa a [Usuario entra en colisión](/causantes/entra-en-colision/): los dos saltan en el mismo
choque, pero cada uno entrega a una persona distinta. Aquel te da al que embiste —el que venía
andando—; este, al que se lo llevó por delante.

Con los dos montados puedes tratarlos de forma distinta: dar un punto al que pilla y mandar a la
casilla de salida al pillado.

Es la base de los juegos de perseguir, pillar y empujar.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/colision-con-usuario.png" alt="Ventana de configuración de Entra en colisión con Usuario" class="ventana-wired" />
<!-- /ventana -->

No tiene opciones propias.

## Ejemplo

```
Pila A:
  Causante: Entra en colisión con Usuario
  Efecto:   Mensaje                       ["¡Choque!"]
  Efecto:   Mover y Rotar Usuario         [una baldosa atrás]
```

## Notas

**Los dos usuarios existen, pero solo uno es el causante.** Si quieres actuar sobre el otro,
necesitarás un selector de vecindario centrado en el causante.

---

# Bot alcanza usuario

> Se dispara cuando un bot que persigue llega hasta una persona.
>
> Página: https://wired.hartico.tv/causantes/bot-alcanza-usuario/

Dispara cuando un bot que va siguiendo o persiguiendo a alguien consigue alcanzarlo.

## Cómo funciona

Se usa junto a los efectos de perseguir y seguir: el efecto pone al bot en marcha, y este causante
avisa cuando llega.

:::caution[El causante es el BOT]
En este causante, el **bot** es quien figura como causante de la pila, no la persona alcanzada. Pero la
persona no se pierde: viaja aparte, y la recoges eligiendo la fuente **El usuario alcanzado** en el
efecto que deba actuar sobre ella. Es el mismo reparto que hace el clic entre quien pulsa y a quién
pulsan.

Si dejas la fuente por defecto, el efecto irá contra el bot.

Si tenías pilas montadas con este causante desde antes, revísalas: es un cambio de comportamiento
respecto a versiones anteriores.
:::

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/bot-alcanza-usuario.png" alt="Ventana de configuración de Bot alcanza usuario" class="ventana-wired" />
<!-- /ventana -->

**Nombre del bot.** Escribe el nombre exacto del bot que quieres vigilar.

## Ejemplo

Un bot guardián que avisa al alcanzar a un intruso:

```
Pila A:
  Causante: Bot alcanza usuario           [bot "Guardián"]
  Efecto:   Bot habla o susurra a usuario ["Te tengo"]
```

## Notas

**El nombre debe coincidir exactamente.** Si renombras el bot, la pila deja de funcionar sin avisar.

---

# Bot alcanza furni

> Se dispara cuando un bot llega hasta uno de los furnis que indiques.
>
> Página: https://wired.hartico.tv/causantes/bot-alcanza-furni/

Dispara cuando un bot llega hasta un furni de los que has marcado.

## Cómo funciona

Es la forma de montar recorridos de bots: mandas al bot hacia un furni y, cuando llega, esta pila
decide qué hace a continuación. Encadenando varias tienes una ruta completa.

**El bot tiene que poder subirse encima.** El causante no salta al llegar al lado: salta en el momento
en que el bot **pisa** el furni. Con un furni que no se puede pisar —una mesa, una planta, cualquier
cosa de pared— el bot llega, se queda al lado y aquí no pasa nada. Es lo que rompe la mayoría de las
rutas de bot que "dejan de funcionar a la segunda parada": pon baldosas, alfombras o cualquier cosa
que se pise.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/bot-alcanza-furni.png" alt="Ventana de configuración de Bot alcanza furni" class="ventana-wired" />
<!-- /ventana -->

**Nombre del bot.** El nombre exacto del bot a vigilar.

**Selección de furnis**, uno a uno o por tipo: los destinos que quieres detectar.

## Ejemplo

Un bot camarero que hace una ronda:

```
Pila A:
  Causante: Bot alcanza furni [bot "Camarero" · la mesa 1]
  Efecto:   Mensaje de Bot    ["Aquí tiene"]
  Efecto:   Bot mover a furni [a la mesa 2 · con retardo 3 s]
```

## Notas

**Si el bot no puede llegar, no dispara nunca.** Un camino bloqueado deja la cadena parada en seco.
Deja siempre una ruta libre, o añade un temporizador de rescate que lo reponga.

---

# Ausencia Positiva

> Se dispara en el momento en que alguien se queda ausente.
>
> Página: https://wired.hartico.tv/causantes/ausencia-positiva/

Dispara justo cuando un usuario **pasa a estar ausente**, es decir, cuando el hotel lo marca como
inactivo.

## Cómo funciona

Es un aviso puntual del cambio de estado: se dispara una vez, en el instante en que la persona entra
en ausencia. El ausente queda como causante.

Y hay dos formas de entrar en ausencia, no una: **la que decide el hotel** cuando alguien lleva un rato
quieto, y **la que decide la persona** poniéndose a dormir a propósito con el gesto correspondiente.
Esta segunda dispara en el acto, así que no cuentes con que siempre haya pasado un rato.

Forma pareja con [Ausencia Negativa](/causantes/ausencia-negativa/), que avisa de la vuelta.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/ausencia-positiva.png" alt="Ventana de configuración de Ausencia Positiva" class="ventana-wired" />
<!-- /ventana -->

No tiene opciones propias.

## Ejemplo

Mover a los ausentes a una zona aparte:

```
Pila A:
  Causante: Ausencia Positiva
  Efecto:   ¡Adiós!           [a la zona de ausentes]
```

## Notas

**No decides tú cuánto tarda.** El umbral de ausencia lo marca el hotel. Si necesitas controlar el
tiempo, usa [Usuario AFK](/causantes/usuario-afk/), que sí te deja elegirlo.

---

# Ausencia Negativa

> Se dispara cuando alguien vuelve de estar ausente.
>
> Página: https://wired.hartico.tv/causantes/ausencia-negativa/

Dispara cuando un usuario que estaba ausente **vuelve a estar activo**.

## Cómo funciona

El reverso de [Ausencia Positiva](/causantes/ausencia-positiva/). Se dispara una vez, en el momento
de volver, y el que vuelve queda como causante.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/ausencia-negativa.png" alt="Ventana de configuración de Ausencia Negativa" class="ventana-wired" />
<!-- /ventana -->

No tiene opciones propias.

## Ejemplo

Devolver a su sitio a quien vuelve:

```
Pila A:
  Causante: Ausencia Negativa
  Efecto:   ¡Adiós!           [a la zona principal]
  Efecto:   Mensaje           ["Bienvenido de vuelta"]
```

## Notas

**Empareja siempre las dos.** Si mandas a los ausentes a una zona aparte y no montas la vuelta, se
quedan encerrados ahí para siempre.

---

# Usuario AFK

> Se dispara cuando alguien lleva sin hacer nada el tiempo que indiques.
>
> Página: https://wired.hartico.tv/causantes/usuario-afk/

Dispara cuando un usuario acumula el tiempo de inactividad que tú marques. A diferencia de
[Ausencia Positiva](/causantes/ausencia-positiva/), aquí **el umbral lo eliges tú**.

## Cómo funciona

Lleva la cuenta de cuánto tiempo lleva cada persona sin actividad y dispara al alcanzar el tiempo
configurado. El inactivo queda como causante.

**Y se repite.** Al disparar, la cuenta de esa persona vuelve a cero y empieza de nuevo, así que si
sigue sin moverse se vuelve a disparar cada vez que pasa el tiempo que marcaste. No es un aviso
único.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/usuario-afk.png" alt="Ventana de configuración de Usuario AFK" class="ventana-wired" />
<!-- /ventana -->

**Establecer tiempo**, entre **5 y 600 segundos**, en pasos de 5 segundos.

## Ejemplo

Expulsar a quien lleve cinco minutos parado:

```
Pila A:
  Causante: Usuario AFK [300 s]
  Efecto:   Mensaje     ["Te vamos a mover por inactividad"]
  Efecto:   ¡Adiós!     [a la zona de espera · con retardo 3 s]
```

## Notas

**Uno por sala.** Todos los Usuario AFK de una sala miran la misma cuenta de inactividad, así que el
primero que dispara la pone a cero para los demás y los otros no llegan nunca a su tiempo. Si quieres
avisar a los tres minutos y mover a los cinco, no pongas dos furnis: pon uno solo y separa los efectos
con retardos.

Con [Usuario AFK Dormido](/causantes/usuario-afk-dormido/) no pasa: cada uno lleva su propia cuenta y
no se estorban.

**Avisa antes de castigar.** Expulsar sin previo aviso se percibe como un fallo. Un mensaje con unos
segundos de retardo antes de la acción cambia por completo la experiencia.

---

# Usuario AFK Dormido

> Se dispara cuando alguien lleva sin moverse el tiempo que indiques.
>
> Página: https://wired.hartico.tv/causantes/usuario-afk-dormido/

Como [Usuario AFK](/causantes/usuario-afk/), pero contando solo **el movimiento**: alguien que está
escribiendo en el chat sin moverse del sitio cuenta como parado.

## Cómo funciona

Mide el tiempo desde el último desplazamiento. Es el causante para detectar a quien ocupa un sitio
sin usarlo, aunque siga conversando.

**Y se repite**: al disparar, la cuenta de esa persona vuelve a cero, así que mientras no se mueva se
vuelve a disparar cada vez que pasa el tiempo marcado.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/usuario-afk-dormido.png" alt="Ventana de configuración de Usuario AFK Dormido" class="ventana-wired" />
<!-- /ventana -->

**Establecer tiempo**, entre **5 y 600 segundos**, en pasos de 5 segundos.

## Ejemplo

Liberar asientos de una zona con aforo limitado:

```
Pila A:
  Causante:  Usuario AFK Dormido          [120 s]
  Condición: Causante está Sobre el Furni [los asientos de la mesa]
  Efecto:    ¡Adiós!                      [a la zona común]
```

## Notas

**Uno por sala.** Todos los Usuario AFK Dormido comparten la misma cuenta, y el primero que dispara la
pone a cero para los demás. Para hacer dos cosas a tiempos distintos, usa un solo furni y separa los
efectos con retardos.

**No es lo mismo que ausente.** Alguien charlando activamente cuenta como dormido si no se mueve.
Úsalo para gestionar espacio, no para detectar gente desconectada.

---

# Condiciones

> Las 37 condiciones disponibles, agrupadas por lo que comprueban.
>
> Página: https://wired.hartico.tv/condiciones/

Una **condición** filtra: cuando el causante dispara, decide si los efectos llegan a ejecutarse.

Por defecto **se exigen todas a la vez**. Basta con que una falle para que el bloque entero falle y
la pila se desvíe a los efectos negativos, si los hay. Si necesitas que baste con una, existe un
complemento que cambia esa regla.

## Las parejas positiva y negativa

Casi todas vienen en pareja: una comprueba que algo se cumple y su gemela que **no** se cumple.

No son intercambiables por el hecho de negar. La diferencia está en el momento: poner la condición
positiva y responder con efectos negativos no es lo mismo que poner la condición negativa, porque en
el primer caso los efectos negativos también saltan cuando falla **cualquier otra** condición de la
pila. Si quieres reaccionar a una comprobación concreta, usa su gemela negativa.

## Sobre quien disparó la pila

| Condición | Comprueba |
| --- | --- |
| [El Desencadenante es…](/condiciones/desencadenante-es/) | Que sea un habbo, una mascota o un bot concreto |
| [Desencadenante NO Coincide](/condiciones/desencadenante-no-coincide/) | Lo contrario |
| [Usuario Lleva la Placa](/condiciones/lleva-placa/) | Que lleve puesta una placa |
| [Usuario NO Lleva la Placa](/condiciones/no-lleva-placa/) | Lo contrario |
| [Usuario tiene Efecto](/condiciones/tiene-efecto/) | Que lleve puesto un efecto |
| [Usuario NO tiene Efecto](/condiciones/no-tiene-efecto/) | Lo contrario |
| [Usuario tiene item de mano](/condiciones/item-de-mano/) | Que lleve algo en la mano |
| [Usuario NO tiene item de mano](/condiciones/no-item-de-mano/) | Lo contrario |
| [Miembro del Grupo](/condiciones/miembro-de-grupo/) | Que pertenezca a un grupo |
| [NO es Miembro del Grupo](/condiciones/no-miembro-de-grupo/) | Lo contrario |
| [Miembro del Equipo](/condiciones/miembro-de-equipo/) | Que esté en un equipo del juego |
| [NO es Miembro del Equipo](/condiciones/no-miembro-de-equipo/) | Lo contrario |
| [Usuario está Realizando Acción](/condiciones/realiza-accion/) | Que esté bailando o haciendo un gesto |
| [Usuario NO está Realizando Acción](/condiciones/no-realiza-accion/) | Lo contrario |
| [Dirección del Usuario](/condiciones/direccion-del-usuario/) | Hacia dónde mira |
| [Causante está Sobre el Furni](/condiciones/causante-sobre-furni/) | Que esté encima de un furni concreto |
| [Causante NO está Sobre el Furni](/condiciones/causante-no-sobre-furni/) | Lo contrario |

## Sobre los furnis

| Condición | Comprueba |
| --- | --- |
| [Furni Coincide](/condiciones/furni-coincide/) | Que el furni esté entre los que señalaste |
| [Furni NO Coincide](/condiciones/furni-no-coincide/) | Lo contrario |
| [Furni encima](/condiciones/furni-encima/) | Que tenga otro furni apilado encima |
| [NO tiene un Furni encima](/condiciones/no-furni-encima/) | Lo contrario |
| [Furnis con Usuarios](/condiciones/furnis-con-usuarios/) | Que haya alguien encima |
| [Furnis SIN Usuarios](/condiciones/furnis-sin-usuarios/) | Lo contrario |
| [Posición o Estado Coincide](/condiciones/posicion-o-estado/) | Que siga como cuando lo guardaste |
| [Posición o Estado NO Coincide](/condiciones/posicion-o-estado-no/) | Lo contrario |
| [Altitud de Furni Coincide](/condiciones/altitud/) | La altura a la que está |

## Sobre la sala y el tiempo

| Condición | Comprueba |
| --- | --- |
| [Aforo Coincide](/condiciones/aforo/) | Cuánta gente hay en la sala |
| [Aforo NO Coincide](/condiciones/aforo-no/) | Lo contrario |
| [Fecha y Hora](/condiciones/fecha-y-hora/) | Que estemos dentro de una franja horaria |
| [Fecha](/condiciones/fecha/) | Día de la semana, día del mes o mes |
| [Hora](/condiciones/hora/) | La hora, con zona horaria |
| [Contador Coincide](/condiciones/contador-coincide/) | El tiempo que marca un contador |

## Sobre la selección y las variables

| Condición | Comprueba |
| --- | --- |
| [Cantidad](/condiciones/cantidad/) | Cuántas cosas trajo el selector |
| [Contiene variable](/condiciones/contiene-variable/) | Que exista una variable |
| [Contiene variable (Negativo)](/condiciones/no-contiene-variable/) | Lo contrario |
| [Valor de variable](/condiciones/valor-de-variable/) | Lo que vale una variable |
| [Edad de variable](/condiciones/edad-de-variable/) | Cuánto hace que se creó o cambió |

---

# El Desencadenante es…

> Comprueba que quien disparó la pila sea un habbo, una mascota o un bot concreto.
>
> Página: https://wired.hartico.tv/condiciones/desencadenante-es/

Comprueba **quién** disparó la pila. Sirve para que una pila solo funcione para cierta persona, o
para distinguir entre habbos, mascotas y bots.

## Cómo funciona

Se evalúa contra el causante de esa ejecución. En una pila sin causante humano –un causante
periódico, por ejemplo– no hay a quién comprobar y la condición no se cumple.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/desencadenante-es.png" alt="Ventana de configuración de El Desencadenante es…" class="ventana-wired" />
<!-- /ventana -->

**Escoge el tipo de usuario**, con tres opciones: **Habbo**, **Mascota** y **Bot**. Es el primer
filtro, y con él solo ya puedes montar pilas que ignoren a las mascotas.

**Escoge un desencadenante**, con dos modos:

- **Cualquier usuario** – vale cualquiera del tipo elegido.
- **Usuario especificado por nombre** – solo esa persona, escribiendo su nombre.

**Cumplir condición si**, dentro de **Mostrar opciones avanzadas**: decide si la condición la tienen
que cumplir **todos** los usuarios seleccionados, o si basta con uno. Viene exigiendo **todos**, y
esa es la causa número uno de que una condición parezca rota. Está contado en
[Opciones avanzadas](/conceptos/opciones-avanzadas/).

## Ejemplo

Una puerta privada:

```
Pila A:
  Causante:  Sobre un Furni        [la alfombra]
  Condición: El Desencadenante es… [Habbo · por nombre: "Marco"]
  Efecto:    ¡Adiós!               [al interior]
```

## Notas

**El nombre tiene que ser exacto.** Si el usuario se cambia el nombre, la pila deja de reconocerlo
sin avisar.

---

# Desencadenante NO Coincide

> Se cumple cuando quien disparó la pila no es el usuario o el tipo que indiques.
>
> Página: https://wired.hartico.tv/condiciones/desencadenante-no-coincide/

Se cumple cuando quien disparó la pila **no** es el usuario o el tipo indicado. Es la forma de montar
cosas para todos **menos** para alguien.

## Cómo funciona

Se evalúa contra el causante de esa ejecución, igual que su gemela
[El Desencadenante es…](/condiciones/desencadenante-es/). La diferencia práctica es para qué se usa:
la positiva sirve para dar acceso, esta para excluir.

En una pila sin causante humano —un causante periódico— no hay a quién comprobar, y entonces la
condición **no se cumple** y la pila no llega a ejecutarse. Es la explicación de un caso que
desconcierta: montas una exclusión con un periódico detrás y no pasa absolutamente nada, ni siquiera
para la gente que sí debería pasar el filtro. Ponle delante un
[selector](/conceptos/fuentes-y-objetivos/) y ya tiene a quién mirar.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/desencadenante-no-coincide.png" alt="Ventana de configuración de Desencadenante NO Coincide" class="ventana-wired" />
<!-- /ventana -->

**Escoge el tipo de usuario**: **Habbo**, **Mascota** o **Bot**.

**Escoge un desencadenante**, con dos modos:

- **Cualquier usuario** – excluye a todos los del tipo elegido.
- **Usuario especificado por nombre** – excluye solo a esa persona.

**Cumplir condición si**, dentro de **Mostrar opciones avanzadas**: decide si la condición la tienen
que cumplir **todos** los usuarios seleccionados, o si basta con uno. Viene exigiendo **todos**, y
esa es la causa número uno de que una condición parezca rota. Está contado en
[Opciones avanzadas](/conceptos/opciones-avanzadas/).

## Ejemplo

Una sala donde las mascotas no activan las trampas:

```
Pila A:
  Causante:  Sobre un Furni             [la baldosa]
  Condición: Desencadenante NO Coincide [Mascota · cualquiera]
  Efecto:    ¡Adiós!                    [al calabozo]
```

## Notas

**Excluir a una persona por nombre es frágil.** Si se cambia el nombre, deja de estar excluida y
nadie se entera. Para vetos que importen, usa una variable de usuario o una placa.

---

# Usuario Lleva la Placa

> Comprueba que quien disparó la pila lleve puesta una placa concreta.
>
> Página: https://wired.hartico.tv/condiciones/lleva-placa/

Comprueba que el usuario lleve **puesta** una placa. Es la forma más común de montar zonas y
funciones reservadas.

## Cómo funciona

Mira las placas que la persona lleva puestas en ese momento, no las que tiene en su colección. Si la
tiene guardada pero no puesta, la condición no se cumple.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/lleva-placa.png" alt="Ventana de configuración de Usuario Lleva la Placa" class="ventana-wired" />
<!-- /ventana -->

**Código de la placa.** El código interno, no el nombre que se lee en el perfil.

## Ejemplo

```
Pila A:
  Causante:  Sobre un Furni          [la alfombra]
  Condición: Usuario Lleva la Placa  ["SOCIO"]
  Efecto:    ¡Adiós!                 [a la zona VIP]
  Efecto:    Ejecutar pilas Negativo [la pila B]

Pila B (sin causante):
  Efecto: Mensaje ["Necesitas la placa de socio" · solo el usuario]
```

La **Pila B** es la rama del "si no":
[Ejecutar pilas Negativo](/efectos/ejecutar-pilas-negativo/) solo se activa cuando la condición falla,
y la pila que llama no necesita causante propio.


## Notas

**Puesta, no poseída.** Mucha gente tiene la placa y no la lleva encima; si tu zona depende de esto,
avísalo con un efecto negativo o te llegarán quejas de que "está roto".

---

# Usuario NO Lleva la Placa

> Se cumple cuando el usuario no lleva puesta la placa que indiques.
>
> Página: https://wired.hartico.tv/condiciones/no-lleva-placa/

Se cumple cuando el usuario **no** lleva puesta la placa indicada.

## Cómo funciona

Mira las placas puestas, no las que la persona tiene guardadas. Eso significa que **también se cumple
con quien tiene la placa pero no la lleva encima**, que es la fuente número uno de confusión con esta
condición.

Su uso natural no es cerrar el paso —para eso está su gemela— sino **hablarle a quien todavía no la
tiene**: explicarle cómo conseguirla, ofrecerle apuntarse, mandarlo a la zona pública.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/no-lleva-placa.png" alt="Ventana de configuración de Usuario NO Lleva la Placa" class="ventana-wired" />
<!-- /ventana -->

**Código de la placa.** El código interno, no el nombre que se lee en el perfil.

## Ejemplo

Un cartel que solo ve quien no es socio:

```
Pila A:
  Causante:  Sobre un Furni            [el felpudo]
  Condición: Usuario NO Lleva la Placa ["SOCIO"]
  Efecto:    Mensaje                   ["¿Quieres ser socio? Habla con el staff"]
```

## Notas

**Si vas a repartir la placa con esta condición**, recuerda que quien la tenga guardada y no puesta
volverá a recibirla cada vez. Para no repetir, marca a la gente con una variable de usuario en lugar
de fiarte de la placa.

---

# Usuario tiene Efecto

> Comprueba que quien disparó la pila lleve puesto un efecto concreto.
>
> Página: https://wired.hartico.tv/condiciones/tiene-efecto/

Comprueba que el usuario lleve puesto un efecto de avatar.

## Cómo funciona

Es útil como marca invisible: das un efecto con un wired y luego lo compruebas para saber por dónde
ha pasado esa persona, sin necesidad de variables.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/tiene-efecto.png" alt="Ventana de configuración de Usuario tiene Efecto" class="ventana-wired" />
<!-- /ventana -->

**Identificador del efecto.** El número del efecto, no su nombre.

## Ejemplo

Un circuito donde solo avanza quien ya pasó por la primera prueba:

```
Pila A:
  Causante:  Sobre un Furni       [la alfombra]
  Condición: Usuario tiene Efecto [el efecto de la prueba 1]
  Efecto:    ¡Adiós!              [a la prueba 2]
```

## Notas

**El usuario puede quitárselo.** Un efecto no es un candado: cualquiera puede cambiárselo desde su
perfil. Para algo que deba resistir, usa una variable de usuario.

---

# Usuario NO tiene Efecto

> Se cumple cuando el usuario no lleva puesto el efecto que indiques.
>
> Página: https://wired.hartico.tv/condiciones/no-tiene-efecto/

Se cumple cuando el usuario **no** lleva puesto el efecto indicado.

## Cómo funciona

Es la condición que evita repetir. Si tu pila reparte un efecto, ponerla delante hace que solo lo
reciba quien todavía no lo tiene, en vez de reasignárselo una y otra vez a todo el mundo.

Eso importa más de lo que parece con causantes periódicos: sin esta condición, un efecto que se da
cada cinco segundos se reasigna cada cinco segundos, y el avatar parpadea.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/no-tiene-efecto.png" alt="Ventana de configuración de Usuario NO tiene Efecto" class="ventana-wired" />
<!-- /ventana -->

**Identificador del efecto.** El número del efecto, no su nombre.

## Ejemplo

Dar un efecto al entrar en una zona, una sola vez:

```
Pila A:
  Causante:  Sobre un Furni            [el suelo de la zona]
  Condición: Usuario NO tiene Efecto   [el efecto de la zona]
  Efecto:    Cambiar valor de variable [@effect · Asignar · el número del efecto]
```

## Notas

**Los efectos se ponen escribiendo en `@effect`.** No hay un efecto de wired llamado "poner efecto":
se le asigna el número con
[Cambiar valor de variable](/efectos/cambiar-valor-de-variable/) sobre la variable interna `@effect`
del usuario. Asignarle **0** se lo quita.

**Sirve también para detectar que alguien se lo quitó.** Como el usuario puede cambiarse el efecto
desde su perfil, esta condición te avisa de que ya no lo lleva y puedes reaccionar — expulsarlo de la
zona, avisarle o volver a dárselo.

---

# Usuario tiene item de mano

> Comprueba que quien disparó la pila lleve algo en la mano.
>
> Página: https://wired.hartico.tv/condiciones/item-de-mano/

Comprueba que el usuario lleve en la mano **el objeto concreto** que tú elijas.

## Cómo funciona

Los items de mano son la forma más visible de marcar a alguien, porque se ven en el avatar. Combinado
con el efecto que los reparte, permite montar entregas, canjes y misiones.

**No pregunta si lleva algo, pregunta si lleva eso.** Alguien con otro objeto distinto en la mano no
cumple la condición, igual que quien no lleva nada. Y como solo se puede llevar un objeto a la vez, no
hay forma de preguntar "¿lleva algo?" — hay que preguntar por cada objeto.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/item-de-mano.png" alt="Ventana de configuración de Usuario tiene item de mano" class="ventana-wired" />
<!-- /ventana -->

**Objeto de mano.** Se elige de la lista de objetos disponibles.

**Cumplir condición si**, dentro de **Mostrar opciones avanzadas**: decide si la condición la tienen
que cumplir **todos** los usuarios seleccionados, o si basta con uno. Viene exigiendo **todos**, y
esa es la causa número uno de que una condición parezca rota. Está contado en
[Opciones avanzadas](/conceptos/opciones-avanzadas/).

## Ejemplo

Un canje: entregas la copa y te dan el premio.

```
Pila A:
  Causante:  Click en Furni             [el mostrador]
  Condición: Usuario tiene item de mano [la copa]
  Efecto:    Dar item de mano           [ninguno, para quitársela]
  Efecto:    Dar puntos                 [50 · aumentar]
```

## Notas

**Se pierde al salir de la sala.** No sirve para recordar nada entre visitas; para eso están las
variables de usuario.

---

# Usuario NO tiene item de mano

> Se cumple cuando el usuario no lleva el objeto de mano que indiques.
>
> Página: https://wired.hartico.tv/condiciones/no-item-de-mano/

Se cumple cuando el usuario **no** lleva en la mano el objeto indicado.

## Cómo funciona

Como solo se puede llevar un objeto de mano a la vez, esta condición es en la práctica "tiene las
manos libres para esto". Se usa antes de entregar algo, para no quitarle sin querer lo que ya tenía.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/no-item-de-mano.png" alt="Ventana de configuración de Usuario NO tiene item de mano" class="ventana-wired" />
<!-- /ventana -->

**Objeto de mano**, de la lista de objetos disponibles.

**Cumplir condición si**, dentro de **Mostrar opciones avanzadas**: decide si la condición la tienen
que cumplir **todos** los usuarios seleccionados, o si basta con uno. Viene exigiendo **todos**, y
esa es la causa número uno de que una condición parezca rota. Está contado en
[Opciones avanzadas](/conceptos/opciones-avanzadas/).

## Ejemplo

Un camarero que sirve solo a quien no tiene ya su copa:

```
Pila A:
  Causante:  Click en Furni                [la barra]
  Condición: Usuario NO tiene item de mano [la copa]
  Efecto:    Dar item de mano              [la copa]
  Efecto:    Ejecutar pilas Negativo       [la pila B]

Pila B (sin causante):
  Efecto: Mensaje ["Ya tienes una" · solo el usuario]
```

La **Pila B** es la rama del "si no":
[Ejecutar pilas Negativo](/efectos/ejecutar-pilas-negativo/) solo se activa cuando la condición falla,
y la pila que llama no necesita causante propio.


## Notas

**Se cumple también con quien lleva otro objeto distinto.** La condición pregunta por el objeto
concreto que elegiste, no por si tiene las manos vacías. Si le das algo, le quitarás lo que llevaba.

---

# Miembro del Grupo

> Comprueba que quien disparó la pila pertenezca a un grupo.
>
> Página: https://wired.hartico.tv/condiciones/miembro-de-grupo/

Comprueba que el usuario pertenezca a un grupo del hotel.

## Cómo funciona

A diferencia de las placas, la pertenencia a un grupo no depende de que la persona lleve nada puesto:
o está en el grupo o no está. Eso lo hace mucho más fiable para controlar accesos.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/miembro-de-grupo.png" alt="Ventana de configuración de Miembro del Grupo" class="ventana-wired" />
<!-- /ventana -->

**Elección del grupo**, con dos modos:

- **Grupo actual** – el grupo al que está asociada la sala. Es el que quieres casi siempre, porque
  no hay que reconfigurar nada si cambias de grupo.
- **Seleccionar de la lista** – un grupo concreto, elegido a mano.

**Cumplir condición si**, dentro de **Mostrar opciones avanzadas**: decide si la condición la tienen
que cumplir **todos** los usuarios seleccionados, o si basta con uno. Viene exigiendo **todos**, y
esa es la causa número uno de que una condición parezca rota. Está contado en
[Opciones avanzadas](/conceptos/opciones-avanzadas/).

## Ejemplo

```
Pila A:
  Causante:  Sobre un Furni    [la alfombra]
  Condición: Miembro del Grupo [grupo actual]
  Efecto:    ¡Adiós!           [a la sala de reuniones]
```

## Notas

**"Grupo actual" depende de la sala, no de la pila.** Si desvinculas la sala del grupo, la condición
deja de encontrar grupo y no se cumple para nadie.

---

# NO es Miembro del Grupo

> Se cumple cuando el usuario no pertenece al grupo que indiques.
>
> Página: https://wired.hartico.tv/condiciones/no-miembro-de-grupo/

Se cumple cuando el usuario **no** pertenece al grupo indicado.

## Cómo funciona

A diferencia de las placas, la pertenencia a un grupo no depende de llevar nada puesto: o se está o
no se está. Eso la hace fiable, y por eso esta condición es de las mejores para tratar a los
visitantes de fuera.

Su uso típico es de bienvenida, no de castigo: enseñar la sala, explicar cómo unirse, mandar al
recibidor en vez de al interior.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/no-miembro-de-grupo.png" alt="Ventana de configuración de NO es Miembro del Grupo" class="ventana-wired" />
<!-- /ventana -->

**Elección del grupo**, con dos modos:

- **Grupo actual** – el grupo asociado a la sala. El que quieres casi siempre, porque no hay que
  reconfigurar nada si cambias de grupo.
- **Seleccionar de la lista** – un grupo concreto.

**Cumplir condición si**, dentro de **Mostrar opciones avanzadas**: decide si la condición la tienen
que cumplir **todos** los usuarios seleccionados, o si basta con uno. Viene exigiendo **todos**, y
esa es la causa número uno de que una condición parezca rota. Está contado en
[Opciones avanzadas](/conceptos/opciones-avanzadas/).

## Ejemplo

Un recibidor para quien no es del grupo:

```
Pila A:
  Causante:  Entrada                 [cualquier avatar]
  Condición: NO es Miembro del Grupo [grupo actual]
  Efecto:    ¡Adiós!                 [al recibidor · con retardo 1 s]
  Efecto:    Mensaje                 ["Bienvenido. Únete al grupo para entrar del todo"]
```

## Notas

**Si desvinculas la sala del grupo**, "grupo actual" deja de encontrar grupo. Entonces esta condición
se cumple para **todo el mundo**, incluidos los miembros — y de golpe tu recibidor se traga a la sala
entera.

---

# Miembro del Equipo

> Comprueba que quien disparó la pila esté en un equipo del juego.
>
> Página: https://wired.hartico.tv/condiciones/miembro-de-equipo/

Comprueba que el usuario esté apuntado a uno de los equipos del sistema de juegos de la sala.

## Cómo funciona

Los equipos son del juego, no del hotel: se entra y se sale con los efectos correspondientes, y no
tienen nada que ver con los grupos.

Ojo con una cosa que se cree todo el mundo: **los equipos no se vacían al acabar la partida**. Quien
se apuntó sigue apuntado hasta que sale de la sala o usa
[Abandonar Equipo](/efectos/abandonar-equipo/), aunque el juego lleve horas parado.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/miembro-de-equipo.png" alt="Ventana de configuración de Miembro del Equipo" class="ventana-wired" />
<!-- /ventana -->

**Equipo**, a elegir entre los disponibles.

**Cumplir condición si**, dentro de **Mostrar opciones avanzadas**: decide si la condición la tienen
que cumplir **todos** los usuarios seleccionados, o si basta con uno. Viene exigiendo **todos**, y
esa es la causa número uno de que una condición parezca rota. Está contado en
[Opciones avanzadas](/conceptos/opciones-avanzadas/).

## Ejemplo

Una puerta que solo abre para el equipo rojo:

```
Pila A:
  Causante:  Sobre un Furni          [la alfombra]
  Condición: Miembro del Equipo      [rojo]
  Efecto:    Mutar                   [la puerta]
  Efecto:    Ejecutar pilas Negativo [la pila B]

Pila B (sin causante):
  Efecto: Mensaje ["Esta zona es del equipo rojo" · solo el usuario]
```

La **Pila B** es la rama del "si no":
[Ejecutar pilas Negativo](/efectos/ejecutar-pilas-negativo/) solo se activa cuando la condición falla,
y la pila que llama no necesita causante propio.


## Notas

**Se puede estar en un equipo con el juego parado.** Apuntarse no exige que haya partida, y terminarla
no desapunta a nadie. Así que esta condición se cumple para quien se apuntó, empezara o no el juego.

**Si tu sala juega rondas seguidas, vacía los equipos tú.** Con un selector de toda la sala y
[Abandonar Equipo](/efectos/abandonar-equipo/), o la ronda nueva empieza con los equipos de la
anterior.

---

# NO es Miembro del Equipo

> Se cumple cuando el usuario no está en el equipo que indiques.
>
> Página: https://wired.hartico.tv/condiciones/no-miembro-de-equipo/

Se cumple cuando el usuario **no** está apuntado al equipo indicado.

## Cómo funciona

Los equipos son del sistema de juegos de la sala: se entra y se sale con los efectos
correspondientes. No se vacían al terminar la partida: quien se apuntó sigue apuntado hasta que sale
de la sala o usa [Abandonar Equipo](/efectos/abandonar-equipo/).

Su uso natural es la sala de espera: mientras no te has apuntado, esta condición se cumple y puedes
mandar a la persona a la zona de reclutamiento, enseñarle las normas o impedirle entrar al campo.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/no-miembro-de-equipo.png" alt="Ventana de configuración de NO es Miembro del Equipo" class="ventana-wired" />
<!-- /ventana -->

**Equipo**, a elegir entre los disponibles.

**Cumplir condición si**, dentro de **Mostrar opciones avanzadas**: decide si la condición la tienen
que cumplir **todos** los usuarios seleccionados, o si basta con uno. Viene exigiendo **todos**, y
esa es la causa número uno de que una condición parezca rota. Está contado en
[Opciones avanzadas](/conceptos/opciones-avanzadas/).

## Ejemplo

Una barrera que solo deja pasar a los apuntados:

```
Pila A:
  Causante:  Sobre un Furni           [la baldosa]
  Condición: NO es Miembro del Equipo [rojo]
  Efecto:    ¡Adiós!                  [de vuelta a la espera]
  Efecto:    Mensaje                  ["Apúntate a un equipo antes de entrar"]
```

## Notas

**Quien nunca se ha apuntado no está en ningún equipo**, así que esta condición se cumple para todo el
que acabe de entrar en la sala. Es la trampa clásica: una barrera montada así rebota a la gente hasta
que pisa la baldosa de alistamiento.

**Y al revés al terminar una ronda.** Como los equipos no se vacían solos, quien jugó la partida
anterior sigue apuntado y esta condición deja de cumplirse para él aunque el juego ya no exista. Si tu
sala reinicia rondas, vacía los equipos a mano con
[Abandonar Equipo](/efectos/abandonar-equipo/).

---

# Usuario está Realizando Acción

> Comprueba que quien disparó la pila esté bailando o haciendo un gesto.
>
> Página: https://wired.hartico.tv/condiciones/realiza-accion/

Comprueba qué está haciendo el avatar en ese momento: si baila, y cuál baile, o si está haciendo una
señal.

## Cómo funciona

Es una foto del estado actual, no un aviso de cambio. Se pregunta "¿está bailando ahora?", no
"¿acaba de ponerse a bailar?". Para lo segundo está el causante
[Usuario Realiza Acción](/causantes/usuario-realiza-accion/).

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/realiza-accion.png" alt="Ventana de configuración de Usuario está Realizando Acción" class="ventana-wired" />
<!-- /ventana -->

**Acción desencadenante**, con dos filtros que se eligen por separado:

- **Filtrar por señal** – comprueba el gesto que está haciendo.
- **Filtrar por baile** – comprueba el baile concreto.

**Cumplir condición si**, dentro de **Mostrar opciones avanzadas**: decide si la condición la tienen
que cumplir **todos** los usuarios seleccionados, o si basta con uno. Viene exigiendo **todos**, y
esa es la causa número uno de que una condición parezca rota. Está contado en
[Opciones avanzadas](/conceptos/opciones-avanzadas/).

## Ejemplo

Una pista que premia mientras se baila, comprobando cada pocos segundos:

```
Pila A:
  Causante:  Periodos                       [5 s]
  Selector:  Usuarios en Área               [la pista]
  Condición: Usuario está Realizando Acción [baile 1]
  Efecto:    Dar puntos                     [1 punto]
```

## Notas

**Con un causante periódico hace falta un selector.** Sin él no hay usuario al que mirar y la
condición no se cumple nunca.

---

# Usuario NO está Realizando Acción

> Se cumple cuando el usuario no está haciendo el baile o la señal que indiques.
>
> Página: https://wired.hartico.tv/condiciones/no-realiza-accion/

Se cumple cuando el usuario **no** está haciendo el baile o el gesto indicado.

## Cómo funciona

Es una foto del estado actual, no un aviso de cambio: pregunta "¿no está bailando ahora?".

Su uso más útil es detectar a quien se ha quedado parado donde debería estar participando: la pista
de baile en la que alguien está de pie, el escenario en el que nadie hace el gesto que toca.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/no-realiza-accion.png" alt="Ventana de configuración de Usuario NO está Realizando Acción" class="ventana-wired" />
<!-- /ventana -->

**Acción desencadenante**, con dos filtros que se eligen por separado:

- **Filtrar por señal** – comprueba el gesto.
- **Filtrar por baile** – comprueba el baile concreto.

**Cumplir condición si**, dentro de **Mostrar opciones avanzadas**: decide si la condición la tienen
que cumplir **todos** los usuarios seleccionados, o si basta con uno. Viene exigiendo **todos**, y
esa es la causa número uno de que una condición parezca rota. Está contado en
[Opciones avanzadas](/conceptos/opciones-avanzadas/).

## Ejemplo

Echar de la pista a quien no baila:

```
Pila A:
  Causante:  Periodos                          [10 s]
  Selector:  Usuarios en Área                  [la pista]
  Condición: Usuario NO está Realizando Acción [baile 1]
  Efecto:    Mensaje                           ["¡A bailar o fuera!"]
  Efecto:    ¡Adiós!                           [a la barra · con retardo 3 s]
```

## Notas

**Con un causante periódico hace falta un selector**, o no hay usuario al que mirar.

**Da margen antes de castigar.** Alguien que acaba de llegar a la pista aún no ha empezado a bailar;
si el periodo es corto, lo echas antes de que le dé tiempo.

---

# Dirección del Usuario

> Comprueba hacia dónde mira quien disparó la pila.
>
> Página: https://wired.hartico.tv/condiciones/direccion-del-usuario/

Comprueba hacia dónde está mirando el avatar.

## Cómo funciona

Las direcciones son las ocho del hotel, contadas como el resto del sistema. Un avatar mira siempre a
alguna, así que la condición siempre tiene algo que evaluar mientras haya causante.

Es útil para puertas que solo se abren si te acercas de frente, o para juegos donde importa la
orientación.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/direccion-del-usuario.png" alt="Ventana de configuración de Dirección del Usuario" class="ventana-wired" />
<!-- /ventana -->

**Escoge la dirección**, en una cuadrícula con las ocho. Solo se puede elegir **una**, y no viene
ninguna marcada de fábrica.

**Cumplir condición si**, dentro de **Mostrar opciones avanzadas**: decide si la condición la tienen
que cumplir **todos** los usuarios seleccionados, o si basta con uno. Viene exigiendo **todos**, y
esa es la causa número uno de que una condición parezca rota. Está contado en
[Opciones avanzadas](/conceptos/opciones-avanzadas/).

## Ejemplo

```
Pila A:
  Causante:  Sobre un Furni        [el felpudo]
  Condición: Dirección del Usuario [mirando al norte]
  Efecto:    Mutar                 [la puerta]
```

## Notas

**Tienes que marcar una flecha.** La ventana viene sin ninguna elegida, y guardada así la condición
**no se cumple nunca**. Es el fallo más fácil de cometer con esta pieza: parece configurada y no lo
está.

**Mira el cuerpo, no la cabeza.** Sentado o al girarse hacia alguien que le habla, el avatar mueve
solo la cabeza y el cuerpo se queda como estaba, así que la condición sigue viendo la dirección de
antes. Lo que sí cambia el cuerpo es caminar.

**Y de pie el avatar gira mucho.** Cada paso lo deja mirando a donde iba, así que una condición de
dirección sobre gente que se mueve es frágil por naturaleza; funciona mucho mejor sobre gente sentada.

---

# Causante está Sobre el Furni

> Comprueba que quien disparó la pila esté encima de un furni concreto.
>
> Página: https://wired.hartico.tv/condiciones/causante-sobre-furni/

Comprueba que el usuario esté **encima** de uno de los furnis que elijas.

## Cómo funciona

Es la condición que convierte una pila global en una pila con zona. Como los causantes de teclado, de
chat o periódicos no saben dónde está la gente, esta condición es la que acota dónde tienen efecto.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/causante-sobre-furni.png" alt="Ventana de configuración de Causante está Sobre el Furni" class="ventana-wired" />
<!-- /ventana -->

**Selección de furnis**, uno a uno.

**Cumplir condición si**, dentro de **Mostrar opciones avanzadas**: decide si la condición la tienen
que cumplir **todos** los usuarios seleccionados, o si basta con uno. Viene exigiendo **todos**, y
esa es la causa número uno de que una condición parezca rota. Está contado en
[Opciones avanzadas](/conceptos/opciones-avanzadas/).

## Ejemplo

Reservar las teclas WASD solo mientras estás en la plataforma de juego:

```
Pila A:
  Causante:  Teclado                      [W]
  Condición: Causante está Sobre el Furni [la plataforma]
  Efecto:    Mover y Rotar Usuario        [al norte]
```

## Notas

**Es la pareja natural del causante de teclado.** Sin ella, las teclas quedan reservadas en toda la
sala y la gente no puede escribir.

---

# Causante NO está Sobre el Furni

> Se cumple cuando el usuario no está encima de ninguno de los furnis que indiques.
>
> Página: https://wired.hartico.tv/condiciones/causante-no-sobre-furni/

Se cumple cuando el usuario **no** está encima de ninguno de los furnis indicados.

## Cómo funciona

Es la condición de "estás fuera de la zona". Sirve para dos cosas muy distintas y las dos son útiles:

**Avisar a quien se ha salido.** Un juego que exige quedarse en una plataforma puede detectar al que
se bajó y devolverlo, o descalificarlo.

**Actuar solo fuera.** Todo lo que deba pasar en el resto de la sala pero no en la zona protegida:
que las trampas no salten dentro del refugio, que la música ambiente no suene en la cabina.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/causante-no-sobre-furni.png" alt="Ventana de configuración de Causante NO está Sobre el Furni" class="ventana-wired" />
<!-- /ventana -->

**Selección de furnis**, uno a uno.

**Cumplir condición si**, dentro de **Mostrar opciones avanzadas**: decide si la condición la tienen
que cumplir **todos** los usuarios seleccionados, o si basta con uno. Viene exigiendo **todos**, y
esa es la causa número uno de que una condición parezca rota. Está contado en
[Opciones avanzadas](/conceptos/opciones-avanzadas/).

## Ejemplo

Un juego del que no te puedes salir:

```
Pila A:
  Causante:  Periodos                        [2 s]
  Selector:  Usuarios en Área                [toda la sala]
  Condición: Causante NO está Sobre el Furni [la plataforma]
  Efecto:    ¡Adiós!                         [de vuelta a la plataforma]
```

## Notas

**Con "ninguno" quiere decir ninguno.** Si seleccionas cinco furnis, basta con que la persona esté
sobre uno cualquiera para que la condición no se cumpla. No hay opción de exigir que esté fuera de
alguno en concreto.

---

# Furni Coincide

> Comprueba que los furnis estén entre los que señalaste.
>
> Página: https://wired.hartico.tv/condiciones/furni-coincide/

Comprueba que los furnis con los que trabaja la pila estén **entre** los que tú señalaste.

## Cómo funciona

Ojo, que el nombre despista: **no mira el modelo del furni, mira cuál es**. Enfrenta dos conjuntos y
comprueba, uno por uno, si los del primero están en el segundo. Dos lámparas iguales no coinciden
entre sí; una lámpara solo coincide consigo misma.

Se usa sobre todo detrás de un selector: el selector trae un montón de furnis y esta condición
comprueba que sean los que esperabas antes de actuar sobre ellos.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/furni-coincide.png" alt="Ventana de configuración de Furni Coincide" class="ventana-wired" />
<!-- /ventana -->

**Furnis a coincidir** y **furnis a comparar**: los dos conjuntos que se enfrentan.

También ofrece elegir entre exigir que coincidan **todos** o que baste con **alguno**.

**Cumplir condición si**, dentro de **Mostrar opciones avanzadas**: decide si la condición la tienen
que cumplir **todos** los furnis seleccionados, o si basta con uno. Viene exigiendo **todos**, y esa
es la causa número uno de que una condición parezca rota. Está contado en
[Opciones avanzadas](/conceptos/opciones-avanzadas/).

## Ejemplo

```
Pila A:
  Causante:  Click en Furni [el panel]
  Selector:  Furnis en área
  Condición: Furni Coincide [que sean sillas]
  Efecto:    Mutar
```

## Notas

**Todos o alguno cambia el resultado por completo.** Con un selector que trae veinte furnis, exigir
que coincidan todos casi nunca se cumple.

---

# Furni NO Coincide

> Se cumple cuando los furnis no están entre los que señalaste.
>
> Página: https://wired.hartico.tv/condiciones/furni-no-coincide/

Se cumple cuando los furnis con los que trabaja la pila **no** están entre los que señalaste.

## Cómo funciona

Es la condición de "esto no es lo que va aquí". Su terreno son los puzles de colocar objetos: detecta
que alguien puso la pieza equivocada en el pedestal y te deja rechazarla, devolverla o avisar.

Como su gemela, **no mira el modelo del furni sino cuál es**: enfrenta dos conjuntos y comprueba si
los del primero están o no en el segundo. Dos piezas idénticas no cuentan como la misma.

También sirve de red de seguridad detrás de un selector amplio, para descartar lo que no esperabas
antes de actuar sobre ello.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/furni-no-coincide.png" alt="Ventana de configuración de Furni NO Coincide" class="ventana-wired" />
<!-- /ventana -->

**Furnis a coincidir** y **furnis a comparar**: los dos conjuntos que se enfrentan.

Y la elección entre exigir que **todos** cumplan o que baste con **alguno**.

**Cumplir condición si**, dentro de **Mostrar opciones avanzadas**: decide si la condición la tienen
que cumplir **todos** los furnis seleccionados, o si basta con uno. Viene exigiendo **todos**, y esa
es la causa número uno de que una condición parezca rota. Está contado en
[Opciones avanzadas](/conceptos/opciones-avanzadas/).

## Ejemplo

Un pedestal que rechaza lo que no toca:

```
Pila A:
  Causante:  Estado de los Furnis Cambia [el pedestal]
  Condición: Furni NO Coincide           [la pieza correcta]
  Efecto:    Mensaje                     ["Esa pieza no va aquí"]
```

## Notas

**Negar un "todos" no es un "ninguno".** Con la opción de todos marcada, la condición se cumple en
cuanto haya **un solo** furni que no coincida, aunque los demás sí. Si lo que quieres es "ninguno de
ellos coincide", revísalo con calma antes de darlo por hecho.

---

# Furni encima

> Comprueba que un furni tenga otro apilado encima.
>
> Página: https://wired.hartico.tv/condiciones/furni-encima/

Comprueba que los furnis elegidos tengan **otro furni encima**.

## Cómo funciona

Detecta apilamiento, no ocupación por personas. Para eso está
[Furnis con Usuarios](/condiciones/furnis-con-usuarios/).

Es la base de los puzles de colocar objetos: una bandeja que detecta que le han puesto algo, un
pedestal que reconoce su pieza.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/furni-encima.png" alt="Ventana de configuración de Furni encima" class="ventana-wired" />
<!-- /ventana -->

**Selección de furnis**, uno a uno.

**Permitir que funcione sólo si**, con dos modos: que baste con que **uno** de los furnis
seleccionados tenga algo encima, o que lo tengan **todos**.

## Ejemplo

Un altar de tres pedestales que se abre al completarse:

```
Pila A:
  Causante:  Estado de los Furnis Cambia [los pedestales]
  Condición: Furni encima                [los 3 pedestales · todos]
  Efecto:    Mutar                       [la puerta]
```

## Notas

**Cualquier furni cuenta.** No distingue qué le pusieron encima. Si te importa, combínalo con
[Furni Coincide](/condiciones/furni-coincide/).

---

# NO tiene un Furni encima

> Se cumple cuando los furnis elegidos no tienen nada apilado encima.
>
> Página: https://wired.hartico.tv/condiciones/no-furni-encima/

Se cumple cuando los furnis elegidos **no** tienen ningún otro furni apilado encima.

## Cómo funciona

Detecta huecos libres. Es la mitad que falta de los puzles de colocación: su gemela sabe cuándo has
puesto la pieza, y esta sabe cuándo el sitio está vacío.

Con ella se montan mostradores que se reponen solos, pedestales que avisan de que falta algo, y
tableros que detectan que se ha retirado una ficha.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/no-furni-encima.png" alt="Ventana de configuración de NO tiene un Furni encima" class="ventana-wired" />
<!-- /ventana -->

**Selección de furnis**, uno a uno.

**Permitir que funcione sólo si**, con dos modos: que baste con que **alguno** de los furnis esté
libre, o que lo estén **todos**.

## Ejemplo

Un mostrador que repone la mercancía cuando se la llevan:

```
Pila A:
  Causante:  Periodos                 [5 s]
  Condición: NO tiene un Furni encima [el mostrador · alguno]
  Efecto:    Mover Furni a Furni      [la mercancía → el mostrador]
```

## Notas

**No distingue quién retiró el furni**, solo que ya no está. Si necesitas saberlo, tendrás que
marcarlo con una variable en el momento de la retirada.

---

# Furnis con Usuarios

> Comprueba que haya alguien encima de los furnis elegidos.
>
> Página: https://wired.hartico.tv/condiciones/furnis-con-usuarios/

Comprueba que haya **personas** encima de los furnis que elijas.

## Cómo funciona

Es la condición de presencia. Se usa para puertas que solo abren con alguien en la placa de presión,
para saber si una zona está ocupada, o para no ejecutar cosas caras con la sala vacía.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/furnis-con-usuarios.png" alt="Ventana de configuración de Furnis con Usuarios" class="ventana-wired" />
<!-- /ventana -->

**Selección de furnis**, uno a uno.

**Cumplir condición si**, dentro de **Mostrar opciones avanzadas**: decide si la condición la tienen
que cumplir **todos** los furnis seleccionados, o si basta con uno. Viene exigiendo **todos**, y esa
es la causa número uno de que una condición parezca rota. Está contado en
[Opciones avanzadas](/conceptos/opciones-avanzadas/).

## Ejemplo

Una placa de presión de dos personas:

```
Pila A:
  Causante:  Sobre un Furni      [las dos placas]
  Condición: Furnis con Usuarios [las dos placas]
  Efecto:    Mutar               [la puerta]
```

## Notas

**Para exigir un número concreto de personas**, esta condición no basta: usa un selector de usuarios
más [Cantidad](/condiciones/cantidad/).

---

# Furnis SIN Usuarios

> Se cumple cuando no hay nadie encima de los furnis elegidos.
>
> Página: https://wired.hartico.tv/condiciones/furnis-sin-usuarios/

Se cumple cuando **no** hay nadie encima de los furnis elegidos.

## Cómo funciona

Es la condición del "ya no queda nadie". Su papel más común es cerrar lo que su gemela abrió: la
puerta que se cierra cuando el último se baja de la placa, la luz que se apaga al quedar la sala
vacía.

También es la forma correcta de que un wired caro no corra en balde: si la zona está desierta, no
tiene sentido mover cincuenta furnis.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/furnis-sin-usuarios.png" alt="Ventana de configuración de Furnis SIN Usuarios" class="ventana-wired" />
<!-- /ventana -->

**Selección de furnis**, uno a uno.

**Cumplir condición si**, dentro de **Mostrar opciones avanzadas**: decide si la condición la tienen
que cumplir **todos** los furnis seleccionados, o si basta con uno. Viene exigiendo **todos**, y esa
es la causa número uno de que una condición parezca rota. Está contado en
[Opciones avanzadas](/conceptos/opciones-avanzadas/).

## Ejemplo

Una puerta que se cierra sola:

```
Pila A:
  Causante:  Vete                [la placa de presión]
  Condición: Furnis SIN Usuarios [la placa de presión]
  Efecto:    Mutar               [la puerta]
```

Fíjate en por qué hace falta la condición: el causante salta cuando **alguien** se baja, aunque quede
gente encima. Es la condición la que comprueba que no queda nadie.

## Notas

**Es la pareja obligada del causante Vete.** Sin ella, con dos personas sobre la placa, la puerta se
cierra en cuanto se mueva la primera y deja a la segunda encerrada.

---

# Posición o Estado Coincide

> Comprueba que un furni siga como estaba cuando lo guardaste.
>
> Página: https://wired.hartico.tv/condiciones/posicion-o-estado/

Comprueba que los furnis elegidos sigan **igual que cuando configuraste la condición**: en el mismo
estado, la misma dirección, la misma posición o la misma altura.

## Cómo funciona

Al guardar, la condición se queda con una foto de los furnis. Después compara contra esa foto. Por
eso no se le indica un valor: el valor es "como estaba".

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/posicion-o-estado.png" alt="Ventana de configuración de Posición o Estado Coincide" class="ventana-wired" />
<!-- /ventana -->

**Selección de furnis**, uno a uno.

**Qué comparar**, con cuatro casillas que puedes combinar:

| Casilla | Compara |
| --- | --- |
| **Estado actual** | Encendido, apagado, abierto… |
| **Dirección actual** | Hacia dónde está girado |
| **Posición actual** | En qué baldosa está |
| **Altura actual** | A qué altura está |

**Cumplir condición si**, dentro de **Mostrar opciones avanzadas**: decide si la condición la tienen
que cumplir **todos** los furnis seleccionados, o si basta con uno. Viene exigiendo **todos**, y esa
es la causa número uno de que una condición parezca rota. Está contado en
[Opciones avanzadas](/conceptos/opciones-avanzadas/).


**Si no marcas ninguna casilla, la condición se cumple siempre.** No compara nada, así que deja pasar
todo. No da error ni aviso: simplemente no filtra.

## Ejemplo

Un puzle que se resuelve dejando las piezas en su sitio:

```
Pila A:
  Causante:  Estado de los Furnis Cambia [las piezas]
  Condición: Posición o Estado Coincide  [las piezas · posición y dirección]
  Efecto:    Mensaje                     ["¡Resuelto!"]
```

## Notas

**La foto se toma al guardar.** Si mueves los furnis después de configurar la condición, has cambiado
la referencia sin darte cuenta. Colócalo todo en su sitio y guarda al final.

---

# Posición o Estado NO Coincide

> Se cumple cuando los furnis han cambiado respecto a como los guardaste.
>
> Página: https://wired.hartico.tv/condiciones/posicion-o-estado-no/

Se cumple cuando los furnis elegidos **han cambiado** respecto a la foto que se guardó al configurar
la condición.

## Cómo funciona

Al guardar, la condición se queda con una foto de los furnis: su estado, su dirección, su posición y
su altura. Después compara contra esa foto, y se cumple si algo se ha movido.

Es la condición de "alguien ha tocado esto". Sirve para detectar sabotajes, para saber que un puzle
está a medias, o para reponer una decoración que la gente descoloca.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/posicion-o-estado-no.png" alt="Ventana de configuración de Posición o Estado NO Coincide" class="ventana-wired" />
<!-- /ventana -->

**Selección de furnis**, uno a uno.

**Qué comparar**, con cuatro casillas combinables:

| Casilla | Compara |
| --- | --- |
| **Estado actual** | Encendido, apagado, abierto… |
| **Dirección actual** | Hacia dónde está girado |
| **Posición actual** | En qué baldosa está |
| **Altura actual** | A qué altura está |

**Cumplir condición si**, dentro de **Mostrar opciones avanzadas**: decide si la condición la tienen
que cumplir **todos** los furnis seleccionados, o si basta con uno. Viene exigiendo **todos**, y esa
es la causa número uno de que una condición parezca rota. Está contado en
[Opciones avanzadas](/conceptos/opciones-avanzadas/).

## Ejemplo

Una decoración que se recoloca sola:

```
Pila A:
  Causante:  Periodos Largos               [60 s]
  Condición: Posición o Estado NO Coincide [los muebles · posición y dirección]
  Efecto:    A cero                        [los muebles]
```

## Notas

**La foto se toma al guardar.** Coloca todo en su sitio definitivo y guarda al final; si mueves los
furnis después de configurar la condición, has cambiado la referencia sin querer y la condición se
cumplirá siempre.

**Marca solo lo que te importe.** Con las cuatro casillas puestas, girar un mueble un poco ya cuenta
como cambio.

---

# Altitud de Furni Coincide

> Comprueba la altura a la que está un furni.
>
> Página: https://wired.hartico.tv/condiciones/altitud/

Comprueba la **altura** a la que está colocado un furni, comparándola con el valor que indiques.

## Cómo funciona

Va de la mano del efecto que cambia la altura: uno sube o baja el furni y esta condición comprueba
dónde ha llegado. Es lo que permite montar ascensores, plataformas y barreras que se abren por
altura.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/altitud.png" alt="Ventana de configuración de Altitud de Furni Coincide" class="ventana-wired" />
<!-- /ventana -->

**Selección de furnis**, uno a uno.

**Opciones**, con tres comparaciones: **Menor que**, **Igual a** y **Mayor que**.

**Seleccionar altitud**, entre **0.00 y 80.00**.

La casilla enseña el valor con dos decimales, así que lo que escribes es la altura tal cual la
ves en la sala: **1.00** es la altura de un furni de suelo normal.

**Cumplir condición si**, dentro de **Mostrar opciones avanzadas**: decide si la condición la tienen
que cumplir **todos** los furnis seleccionados, o si basta con uno. Viene exigiendo **todos**, y esa
es la causa número uno de que una condición parezca rota. Está contado en
[Opciones avanzadas](/conceptos/opciones-avanzadas/).

## Ejemplo

Un ascensor que avisa al llegar arriba:

```
Pila A:
  Causante:  Periodos                  [0,5 s]
  Condición: Altitud de Furni Coincide [la plataforma · igual a 2000]
  Efecto:    Mensaje                   ["Planta alta"]
```

## Notas

**La escala no son baldosas.** El rango llega a 8000, así que los valores útiles son mucho más
grandes de lo que parece. Prueba con el efecto de altura antes de fijar números.

---

# Aforo Coincide

> Comprueba cuánta gente hay en la sala.
>
> Página: https://wired.hartico.tv/condiciones/aforo/

Comprueba que el número de personas en la sala esté dentro de un rango.

## Cómo funciona

Cuenta la sala entera, no una zona. Para contar gente en un sitio concreto se usa un selector de área
más [Cantidad](/condiciones/cantidad/).

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/aforo.png" alt="Ventana de configuración de Aforo Coincide" class="ventana-wired" />
<!-- /ventana -->

**Mínimo** y **máximo**, cada uno entre **1 y 50**. Se cumple cuando el aforo cae entre los dos.

## Ejemplo

Un evento que no arranca hasta que haya gente suficiente:

```
Pila A:
  Causante:  Periodos Largos     [30 s]
  Condición: Aforo Coincide      [mínimo 10, máximo 50]
  Efecto:    Mensaje             ["¡Ya somos suficientes, empezamos!"]
  Efecto:    Control de Contador [el temporizador · iniciar]
```

## Notas

**Es un rango, no un mínimo.** Si dejas el máximo por debajo del aforo real, la condición deja de
cumplirse justo cuando más gente hay – que suele ser lo contrario de lo que se busca.

---

# Aforo NO Coincide

> Se cumple cuando la gente que hay en la sala queda fuera del rango que indiques.
>
> Página: https://wired.hartico.tv/condiciones/aforo-no/

Se cumple cuando el número de personas en la sala queda **fuera** del rango indicado.

## Cómo funciona

Cuenta la sala entera, no una zona. Al ser un rango, se cumple por los dos extremos: cuando hay
menos gente de la que pediste y también cuando hay más.

Eso la hace la condición natural para los dos avisos que necesita un evento: "todavía no somos
suficientes" y "esto está lleno".

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/aforo-no.png" alt="Ventana de configuración de Aforo NO Coincide" class="ventana-wired" />
<!-- /ventana -->

**Mínimo** y **máximo**, cada uno entre **1 y 50**.

## Ejemplo

Un evento que avisa mientras no hay quórum:

```
Pila A:
  Causante:  Periodos Largos   [60 s]
  Condición: Aforo NO Coincide [mínimo 10, máximo 50]
  Efecto:    Mensaje           ["Faltan participantes para empezar"]
```

## Notas

**Se cumple por los dos lados.** Si quieres distinguir "vacía" de "llena", no te vale una sola pila:
necesitas dos, cada una con su rango, o usar su gemela [Aforo Coincide](/condiciones/aforo/) con los
límites al revés.

---

# Fecha y Hora

> Comprueba que la hora actual caiga dentro de una franja. El día no cuenta.
>
> Página: https://wired.hartico.tv/condiciones/fecha-y-hora/

Comprueba que la hora actual caiga dentro de una franja que tú defines.

## Cómo funciona

Es la condición para que algo solo funcione en cierto horario: una tienda que abre por la tarde, una
zona nocturna, un pasaje que se cierra de madrugada.

**Del nombre, quédate solo con la hora.** Aunque la ventana te deje elegir fechas, el sistema se queda
únicamente con la **hora del día** de cada extremo y descarta el día: la franja vale **todos los
días**, no solo los que marcaste. Si necesitabas un evento de un fin de semana concreto, esta
condición no lo hace.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/fecha-y-hora.png" alt="Ventana de configuración de Fecha y Hora" class="ventana-wired" />
<!-- /ventana -->

**Fecha de inicio** y **fecha de fin**. Elige lo que quieras en el día: lo único que cuenta es la
**hora** de cada uno.

## Ejemplo

```
Pila A:
  Causante:  Sobre un Furni          [la alfombra]
  Condición: Fecha y Hora            [de 18:00 a 23:00]
  Efecto:    ¡Adiós!                 [al interior]
  Efecto:    Ejecutar pilas Negativo [la pila B]

Pila B (sin causante):
  Efecto: Mensaje ["Cerrado. Abrimos a las 18:00" · solo el usuario]
```

La **Pila B** es la rama del "si no":
[Ejecutar pilas Negativo](/efectos/ejecutar-pilas-negativo/) solo se activa cuando la condición falla,
y la pila que llama no necesita causante propio.


## Notas

**La franja puede cruzar la medianoche.** De 22:00 a 02:00 funciona: no hace falta partirla en dos.

**La hora es la del servidor**, no la del usuario. Si tu comunidad está repartida por varios husos,
lo que para ti son las seis de la tarde para otro puede ser medianoche. Para elegir zona horaria usa
[Hora](/condiciones/hora/).

---

# Fecha

> Comprueba el día de la semana, el día del mes o el mes.
>
> Página: https://wired.hartico.tv/condiciones/fecha/

Comprueba la fecha por partes: el día de la semana, el día del mes o el mes.

## Cómo funciona

A diferencia de [Fecha y Hora](/condiciones/fecha-y-hora/), que es una franja concreta, esta trabaja
con **partes** de la fecha. Eso permite cosas que se repiten: "todos los sábados", "todos los días 1",
"durante diciembre".

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/fecha.png" alt="Ventana de configuración de Fecha" class="ventana-wired" />
<!-- /ventana -->

Cada parte –día de la semana, día del mes y mes– se configura por separado con tres modos:

| Modo | Qué hace |
| --- | --- |
| **No usar filtro** | Ignora esa parte |
| **Exacto** | Solo ese valor |
| **Rango** | Entre dos valores |

**Día de la semana** y **Mes** se eligen por nombre.

## Ejemplo

Una decoración solo para diciembre:

```
Pila A:
  Causante:  ¡Ya!  [1 s]
  Condición: Fecha [mes: exacto, diciembre]
  Efecto:    Mutar [las luces]
```

## Notas

**Las partes se combinan con Y.** Si pones día de la semana sábado y mes diciembre, solo se cumple
los sábados de diciembre.

---

# Hora

> Comprueba la hora, con zona horaria a elegir.
>
> Página: https://wired.hartico.tv/condiciones/hora/

Comprueba la hora actual, y a diferencia del resto de condiciones de tiempo **te deja elegir la zona
horaria**.

## Cómo funciona

Es la que quieres si tu comunidad está repartida por varios países: fijas la zona de referencia y la
condición se comporta igual para todos, independientemente de dónde esté el servidor.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/hora.png" alt="Ventana de configuración de Hora" class="ventana-wired" />
<!-- /ventana -->

**Hora**, con tres modos: **No usar filtro**, **Exacto** o **Rango** entre dos valores.

**Zona horaria**, a elegir de la lista.

## Ejemplo

```
Pila A:
  Causante:  Sobre un Furni [la pista]
  Condición: Hora           [rango 22:00–04:00 · zona de Madrid]
  Efecto:    Mutar          [las luces]
```

## Notas

**No es la única con zona horaria.** [Fecha](/condiciones/fecha/) también la tiene; la que no la tiene
es [Fecha y Hora](/condiciones/fecha-y-hora/), que va siempre con la hora del servidor.


**Un rango que cruza medianoche** –de 22:00 a 04:00– es justo el caso que conviene probar antes de
confiar en él, porque es donde más fácilmente se cuela un error de configuración.

---

# Contador Coincide

> Comprueba el tiempo que marca un contador de la sala.
>
> Página: https://wired.hartico.tv/condiciones/contador-coincide/

Comprueba lo que marca un furni contador, comparándolo con el tiempo que indiques.

## Cómo funciona

A diferencia del causante [Contador Alcanza el Tiempo Establecido](/causantes/contador-llega-a-tiempo/),
que dispara al llegar a una marca, esta condición se puede consultar en cualquier momento. Sirve para
"solo si quedan menos de treinta segundos" o "solo en el primer minuto".

:::caution[Solo vale el Contador Wired]
De todos los relojes del catálogo, aquí solo sirven **Contador Wired Pequeño** y **Contador reloj
de arena**. Los temporizadores de partida —Contador Banzai, Contador Freeze, los Contador moderno
y los Temporizador de juego— **no valen**: si eliges uno, esto no se cumple nunca y no hay ningún
aviso.
:::


## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/contador-coincide.png" alt="Ventana de configuración de Contador Coincide" class="ventana-wired" />
<!-- /ventana -->

**Selección del contador**, que eliges clicándolo en la sala.

**Opciones**, con tres comparaciones: **Menor que**, **Igual a** y **Mayor que**.

**Minutos** y **segundos transcurridos**, que se suman.

Cuando seleccionas varios contadores puedes exigir que **todos coincidan** o que baste con
**cualquiera**.

**Cumplir condición si**, dentro de **Mostrar opciones avanzadas**: decide si la condición la tienen
que cumplir **todos** los furnis seleccionados, o si basta con uno. Viene exigiendo **todos**, y esa
es la causa número uno de que una condición parezca rota. Está contado en
[Opciones avanzadas](/conceptos/opciones-avanzadas/).

## Ejemplo

Un aviso de recta final:

```
Pila A:
  Causante:  Periodos          [5 s]
  Condición: Contador Coincide [el reloj · mayor que 2 min 30 s]
  Efecto:    Mensaje           ["¡Último minuto!"]
```

## Notas

**Con un causante periódico se repite.** El aviso del ejemplo saldrá cada cinco segundos mientras se
cumpla; si quieres que salga una sola vez, hace falta una variable que lo recuerde.

---

# Cantidad

> Comprueba cuántas cosas trajo el selector.
>
> Página: https://wired.hartico.tv/condiciones/cantidad/

Comprueba **cuántos** furnis o usuarios ha traído el selector de la pila.

## Cómo funciona

Es la condición que convierte un selector en una comprobación de verdad. El selector responde a
"¿quiénes?" y esta responde a "¿cuántos?".

Con ella se montan los mínimos de jugadores, los aforos por zona y las comprobaciones de "no hay
nadie".

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/cantidad.png" alt="Ventana de configuración de Cantidad" class="ventana-wired" />
<!-- /ventana -->

**Opciones**, con tres comparaciones: **Menor que**, **Igual a** y **Mayor que**.

**Comparar con**, entre **0 y 100**. Con la comparación de rango se usan dos valores.

## Ejemplo

Una zona que exige al menos dos personas:

```
Pila A:
  Causante:  Sobre un Furni          [la placa]
  Selector:  Usuarios en Área        [3x3 alrededor]
  Condición: Cantidad                [mayor que 1]
  Efecto:    Mutar                   [la puerta]
  Efecto:    Ejecutar pilas Negativo [la pila B]

Pila B (sin causante):
  Efecto: Mensaje ["Hacen falta dos" · solo el usuario]
```

La **Pila B** es la rama del "si no":
[Ejecutar pilas Negativo](/efectos/ejecutar-pilas-negativo/) solo se activa cuando la condición falla,
y la pila que llama no necesita causante propio.


## Notas

**Sin selector no hay nada que contar**, y entonces la cuenta es cero. Con "mayor que" eso hace que la
condición no se cumpla nunca, que es el error más común con esta pieza. Pero ojo, que con "menor que"
pasa lo contrario: se cumple **siempre**, y la pila se ejecuta cuando no debería. Los dos casos son el
mismo despiste y el segundo cuesta más de encontrar.

---

# Contiene variable

> Comprueba que exista una variable.
>
> Página: https://wired.hartico.tv/condiciones/contiene-variable/

Comprueba que una variable **exista**, sin mirar lo que vale.

## Cómo funciona

Existir y valer algo son cosas distintas. Una variable que no se ha creado nunca no es lo mismo que
una que vale cero, y esta condición distingue justo eso.

Se usa como marca: das la variable a alguien y luego compruebas que la tiene, sin importar su
contenido.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/contiene-variable.png" alt="Ventana de configuración de Contiene variable" class="ventana-wired" />
<!-- /ventana -->

**Escoge una variable**, de las disponibles en la sala.

## Ejemplo

Una puerta que recuerda quién ya entró:

```
Pila A:
  Causante:  Sobre un Furni          [la alfombra]
  Condición: Contiene variable       [visitante]
  Efecto:    Mensaje                 ["Ya has estado aquí" · solo el usuario]
  Efecto:    Ejecutar pilas Negativo [la pila B]

Pila B (sin causante):
  Efecto: Mensaje      ["¡Bienvenido por primera vez!" · solo el usuario]
  Efecto: Dar variable [visitante]
```

La **Pila B** es la rama del "si no":
[Ejecutar pilas Negativo](/efectos/ejecutar-pilas-negativo/) solo se activa cuando la condición falla,
y la pila que llama no necesita causante propio.


## Notas

**Para comprobar el contenido** usa [Valor de variable](/condiciones/valor-de-variable/). Esta solo
mira si está o no está.

---

# Contiene variable (Negativo)

> Se cumple cuando la variable no existe.
>
> Página: https://wired.hartico.tv/condiciones/no-contiene-variable/

Se cumple cuando la variable **no** existe. Ojo: no existir y valer cero son cosas distintas.

## Cómo funciona

Es la condición del "primera vez". Como una variable que nunca se creó no es lo mismo que una que
vale cero, esta condición distingue exactamente a quien todavía no ha pasado por aquí.

Con ella se montan los regalos de bienvenida, los tutoriales que solo se ven una vez y cualquier cosa
que deba ocurrir una única vez por persona.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/no-contiene-variable.png" alt="Ventana de configuración de Contiene variable (Negativo)" class="ventana-wired" />
<!-- /ventana -->

**Escoge una variable**, de las disponibles en la sala.

## Ejemplo

Un regalo de bienvenida que no se repite:

```
Pila A:
  Causante:  Entrada                      [cualquier avatar]
  Condición: Contiene variable (Negativo) [ya_vino]
  Efecto:    Mensaje                      ["¡Bienvenido por primera vez!"]
  Efecto:    Dar puntos                   [50 · aumentar]
  Efecto:    Dar variable                 [ya_vino]
```

Funciona aunque el efecto que da la variable esté en la misma pila, porque las condiciones se evalúan
**antes** que cualquier efecto: cuando se comprueba, la variable todavía no existe.

Y no intentes ponerla en un sitio concreto de la lista para que corra la última. No se puede: **Dar
variable va siempre en el primer escalón de efectos**, por delante del mensaje y del resto. Está
contado en [El orden de ejecución](/conceptos/orden-de-ejecucion/).

## Notas

**Es la pareja de [Edad de variable](/condiciones/edad-de-variable/)** para los premios periódicos:
esta cubre la primera vez, cuando todavía no hay variable que medir, y la otra las siguientes.

---

# Valor de variable

> Comprueba lo que vale una variable.
>
> Página: https://wired.hartico.tv/condiciones/valor-de-variable/

Comprueba el **contenido** de una variable, comparándolo con un valor fijo o con otra variable.

## Cómo funciona

Es la condición más potente del sistema de variables, porque permite comparar dos variables entre sí
y no solo contra un número escrito a mano. Con eso se montan marcadores, comparaciones entre
jugadores y máquinas de estados.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/valor-de-variable.png" alt="Ventana de configuración de Valor de variable" class="ventana-wired" />
<!-- /ventana -->

**Elegir variable**, la que se va a comprobar, con los botones de ámbito al lado para decir de dónde
sale.

**Elige tipo**, la comparación, con seis símbolos: mayor, mayor o igual, igual, menor o igual, menor
y distinto.

**Valor de referencia**, con dos modos:

- **Ajustar valor** – un número o texto escrito por ti.
- **Usar otra variable como referencia** – se compara contra otra variable, que eliges a
  continuación con su propio selector de ámbito.

**Cumplir condición si**, para cuando hay varias variables en juego: **todas las variables coinciden**
o **alguna variable coincide**.

**Escoge la fuente de la variable** y **Variable de referencia**, los dos ámbitos: de qué usuario o de
qué sitio se leen la variable comprobada y la de referencia. El segundo solo se habilita cuando has
elegido comparar contra otra variable.

## Ejemplo

Un marcador que anuncia al líder:

```
Pila A:
  Causante:  Periodos          [10 s]
  Condición: Valor de variable [puntos_rojo · mayor que · variable puntos_azul]
  Efecto:    Mensaje           ["Va ganando el equipo rojo"]
```

## Notas

**Comparar dos variables es lo que la hace especial.** Si te encuentras copiando valores a mano para
poder compararlos, es que no estabas usando este modo.

---

# Edad de variable

> Comprueba cuánto hace que una variable se creó o cambió.
>
> Página: https://wired.hartico.tv/condiciones/edad-de-variable/

Comprueba **cuánto tiempo hace** que una variable se creó o se modificó por última vez.

## Cómo funciona

No mira el valor, mira la antigüedad. Es lo que permite montar tiempos de espera sin contadores:
"solo puedes volver a usar esto pasada una hora", "el pase caduca a los tres días".

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/edad-de-variable.png" alt="Ventana de configuración de Edad de variable" class="ventana-wired" />
<!-- /ventana -->

**Elegir variable**, la que se va a comprobar.

**Comparar valor**, con dos referencias:

- **Fecha de creación** – cuánto hace que existe.
- **Fecha de última modificación** – cuánto hace que cambió.

**Elige tipo**: **Menor que** o **Mayor que**.

**Elegir duración**, el tiempo contra el que se compara.

## Ejemplo

Un premio diario:

```
Pila A:
  Causante:  Click en Furni            [el cofre]
  Condición: Edad de variable          [ultimo_premio · modificación · mayor que 24 h]
  Efecto:    Dar puntos                [50 · aumentar]
  Efecto:    Cambiar valor de variable [ultimo_premio]
  Efecto:    Ejecutar pilas Negativo   [la pila B]

Pila B (sin causante):
  Efecto: Mensaje ["Vuelve mañana" · solo el usuario]
```

La **Pila B** es la rama del "si no":
[Ejecutar pilas Negativo](/efectos/ejecutar-pilas-negativo/) solo se activa cuando la condición falla,
y la pila que llama no necesita causante propio.


## Notas

**Si la variable no existe, no hay edad que medir** y la condición no se cumple. Y como el efecto que
la crea vive en esta misma pila, que no llega a ejecutarse, sin ayuda **no cobraría nadie nunca**: ni
la primera vez ni las siguientes.

Por eso el premio diario son siempre **dos pilas**: una para la primera vez, con
[Contiene variable (Negativo)](/condiciones/no-contiene-variable/), que da el premio y crea la
variable; y esta para las siguientes.

---

# Efectos

> Los 48 efectos disponibles, agrupados por lo que hacen.
>
> Página: https://wired.hartico.tv/efectos/

Un **efecto** es lo único de una pila que hace algo. El causante decide cuándo, las condiciones deciden
si, el selector decide sobre quién — y el efecto es el que mueve, habla, teletransporta o puntúa.

Una pila puede llevar varios, y se ejecutan **todos**, no solo el primero.

## En qué orden se ejecutan

No salen en el orden en que los pusiste. El sistema los reparte en cinco escalones:

1. **[Dar variable](/efectos/dar-variable/)**
2. **[Cambiar valor de variable](/efectos/cambiar-valor-de-variable/)**
3. **[Eliminar variable](/efectos/eliminar-variable/)**
4. **Todo lo demás**, y aquí el orden **se sortea en cada ejecución**.
5. **[Ejecuta Pilas](/efectos/ejecuta-pilas/) y [Enviar Señal](/efectos/enviar-senal/)**, al final.

Los tres de variable van primero para que el resto de la pila vea los valores ya calculados. Y como
dentro del cuarto escalón el orden es aleatorio, si necesitas una secuencia usa el complemento
[Ejecutar en Orden](/complementos/ejecutar-en-orden/).

Está contado con más detalle en [El orden de ejecución](/conceptos/orden-de-ejecucion/).

## Los efectos negativos

Tres efectos se ejecutan justo cuando las condiciones **fallan**:
[Ejecutar pilas Negativo](/efectos/ejecutar-pilas-negativo/),
[Emisor de señales Negativo](/efectos/emisor-de-senales-negativo/) y
[Escribir en Registro Negativo](/efectos/escribir-en-registro-negativo/).

Conviven con los normales en la misma pila: cada ejecución toma un camino o el otro, nunca los dos.
Son la forma de montar un "si no, entonces" sin duplicar la pila.

## Estado de los furnis

| Efecto | Qué hace |
| --- | --- |
| [Mutar](/efectos/mutar/) | Pasa el furni a su siguiente estado |
| [Mutar Aleatorio](/efectos/mutar-aleatorio/) | Lo pone en un estado al azar |
| [Mutar Inverso](/efectos/mutar-inverso/) | Lo hace retroceder un estado |
| [A cero](/efectos/a-cero/) | Devuelve los furnis a como estaban al configurarlo |

## Movimiento de furnis

| Efecto | Qué hace |
| --- | --- |
| [Mover](/efectos/mover/) | Una baldosa en una dirección, con giro opcional |
| [Movimiento Relativo](/efectos/movimiento-relativo/) | Un desplazamiento medido desde donde está |
| [Cambiar dirección de Furni](/efectos/cambiar-direccion/) | Lo lanza a moverse y rebota al chocar |
| [Cambiar Altitud](/efectos/cambiar-altitud/) | Lo sube o lo baja |
| [Mover Furni a Furni](/efectos/mover-furni-a-furni/) | Lo lleva hasta otro furni |
| [Mover Furni a Usuario](/efectos/mover-furni-a-usuario/) | Lo lleva hasta una persona |
| [Caza](/efectos/caza/) | El furni persigue a quien tiene cerca |
| [Fuga](/efectos/fuga/) | El furni huye de quien tiene cerca |
| [Caza Azul](/efectos/caza-azul/) | Detecta a quien lo pisa, sin moverse |
| [Caza Amarillo](/efectos/caza-amarillo/) | Detecta también a quien está pegado |

## Mover personas

| Efecto | Qué hace |
| --- | --- |
| [¡Adiós!](/efectos/adios/) | Teletransporta al furni que elijas |
| [Mover Usuario a Furni](/efectos/mover-usuario-a-furni/) | La lleva andando hasta un furni |
| [Mover y Rotar Usuario](/efectos/mover-y-rotar-usuario/) | Un empujón de una baldosa, con giro |
| [Teletransportar a Sala](/efectos/teletransportar-a-sala/) | La envía a otra sala del hotel |
| [Expulsar Usuario](/efectos/expulsar-usuario/) | La echa de la sala |

## Hablar y avisar

| Efecto | Qué hace |
| --- | --- |
| [Mensaje](/efectos/mensaje/) | Un texto a la sala o solo a quien disparó |
| [Mutear usuario](/efectos/mutear-usuario/) | La deja sin poder hablar unos minutos |

## Congelar

| Efecto | Qué hace |
| --- | --- |
| [Congelar Usuario](/efectos/congelar-usuario/) | La deja clavada en su baldosa |
| [Descongelar Usuario](/efectos/descongelar-usuario/) | Le devuelve el movimiento |

## Bots

| Efecto | Qué hace |
| --- | --- |
| [Mensaje de Bot](/efectos/mensaje-de-bot/) | El bot habla o grita en la sala |
| [Bot habla o susurra a usuario](/efectos/bot-habla-a-usuario/) | Se dirige a una persona concreta |
| [Bot mover a furni](/efectos/bot-mover-a-furni/) | Lo manda caminando a un furni |
| [Teletransportar Bot a Furni](/efectos/teletransportar-bot-a-furni/) | Lo coloca al instante |
| [Bot Sigue a Usuario](/efectos/bot-sigue-a-usuario/) | Lo pone a perseguir a alguien |
| [Bot cambia ropa](/efectos/bot-cambia-ropa/) | Le cambia el aspecto |
| [Dar Item de mano](/efectos/dar-item-de-mano/) | Entrega un objeto de mano |

## Equipos y puntuación

| Efecto | Qué hace |
| --- | --- |
| [Unirse al Equipo](/efectos/unirse-al-equipo/) | Apunta a un equipo de color |
| [Abandonar Equipo](/efectos/abandonar-equipo/) | Saca del equipo que sea |
| [Dar puntos](/efectos/dar-puntos/) | Suma o resta puntuación personal |
| [Dar Puntos a Equipo](/efectos/dar-puntos-a-equipo/) | Suma al marcador del equipo |
| [Colisión de Equipo](/efectos/colision-de-equipo/) | Dispara la colisión sobre un equipo |
| [Wired Eventos](/efectos/wired-eventos/) | Otorga victorias del sistema de eventos |

## Contadores y tiempo

| Efecto | Qué hace |
| --- | --- |
| [Control de Contador](/efectos/control-de-contador/) | Inicia, para, pausa, reanuda o reinicia |
| [Ajustar reloj](/efectos/ajustar-reloj/) | Suma, resta o fija minutos y segundos |
| [Reset](/efectos/reset/) | Pone a cero el temporizador interno de la sala |

## Variables

| Efecto | Qué hace |
| --- | --- |
| [Dar variable](/efectos/dar-variable/) | Le da un valor de partida a quien tú digas |
| [Cambiar valor de variable](/efectos/cambiar-valor-de-variable/) | Opera sobre su valor |
| [Eliminar variable](/efectos/eliminar-variable/) | La borra |

## Llamar a otras pilas

| Efecto | Qué hace |
| --- | --- |
| [Ejecuta Pilas](/efectos/ejecuta-pilas/) | Ejecuta las pilas de los furnis que elijas |
| [Ejecutar pilas Negativo](/efectos/ejecutar-pilas-negativo/) | Igual, cuando la condición falla |
| [Enviar Señal](/efectos/enviar-senal/) | Avisa a las pilas que estén escuchando |
| [Emisor de señales Negativo](/efectos/emisor-de-senales-negativo/) | Igual, cuando la condición falla |

## Depuración

| Efecto | Qué hace |
| --- | --- |
| [Escribir en Registro](/efectos/escribir-en-registro/) | Anota un mensaje en el registro de la sala |
| [Escribir en Registro Negativo](/efectos/escribir-en-registro-negativo/) | Anota cuando la condición falla |

## Lo que cuestan

Los efectos son de lo más caro de una pila, y el precio se paga **por cada objetivo**: un efecto sobre
cincuenta furnis cuesta cincuenta veces uno solo. Los que mandan señales cuestan todavía más, porque
arrastran la ejecución de otras pilas.

Antes de montar algo grande, pásate por [Límites y rendimiento](/conceptos/limites/).

---

# Mutar

> Cambia el furni al siguiente estado, o al anterior.
>
> Página: https://wired.hartico.tv/efectos/mutar/

Cambia el estado de los furnis elegidos: enciende una lámpara, abre una puerta, gira un dado.

## Cómo funciona

Cada furni tiene una lista de estados propia. Este efecto **avanza por esa lista**, sin que tú tengas
que saber cuántos hay: cuando llega al último, vuelve al primero.

Es el efecto más usado del sistema y el que conviene entender primero, porque casi todo lo que
"enciende" o "abre" algo en una sala es esto.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/mutar.png" alt="Ventana de configuración de Mutar" class="ventana-wired" />
<!-- /ventana -->

**Selección de furnis**, uno a uno, por tipo o desde el contexto de la pila.

**Escoge el tipo de cambio**, con dos modos:

- **Cambiar al siguiente estado** – avanza en la lista.
- **Cambiar al estado anterior** – retrocede.

## Ejemplo

Un interruptor de luz:

```
Pila A:
  Causante: Click en Furni [el interruptor]
  Efecto:   Mutar          [la lámpara · siguiente]
```

## Notas

**Con un solo estado no hace nada.** Muchos furnis decorativos no tienen estados; si el tuyo no
reacciona, probablemente sea eso y no un fallo de la pila.

**Cuidado con los bucles.** Si el causante de la pila vigila el estado del mismo furni que mutas, se
dispara a sí misma. Vigila uno y muta otro.

---

# Mutar Aleatorio

> Pone el furni en un estado al azar.
>
> Página: https://wired.hartico.tv/efectos/mutar-aleatorio/

Pone los furnis elegidos en un estado **al azar** de los que tengan.

## Cómo funciona

A diferencia de [Mutar](/efectos/mutar/), que avanza en orden, este salta a cualquiera. Es lo que se
usa para luces de discoteca, carteles que cambian solos y cualquier cosa que deba ser impredecible.

**Con los furnis que ya sortean por su cuenta no funciona.** El dado, la ruleta, la botella y el Love
Shuffler están protegidos a propósito: este efecto los salta sin hacer nada. Si no fuera así, una pila
podría tirar el dado una y otra vez hasta sacar el número que le conviniera, y se acabó el azar.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/mutar-aleatorio.png" alt="Ventana de configuración de Mutar Aleatorio" class="ventana-wired" />
<!-- /ventana -->

**Selección de furnis**, uno a uno, por tipo o desde el contexto.

No tiene más opciones: el azar no se configura.

## Ejemplo

Unas luces de discoteca que van cambiando solas:

```
Pila A:
  Causante: Periodos        [1 s]
  Efecto:   Mutar Aleatorio [las luces del techo]
```

## Notas

**Puede repetir el estado que ya tenía.** Es azar de verdad, no "cualquiera menos el actual"; con
pocos estados verás repeticiones a menudo. Si necesitas que cambie sí o sí, usa
[Mutar](/efectos/mutar/).

---

# Mutar Inverso

> Hace retroceder el furni un estado, al revés que Mutar.
>
> Página: https://wired.hartico.tv/efectos/mutar-inverso/

Hace retroceder los furnis elegidos **un estado**, al revés que Mutar.

## Cómo funciona

No busca ningún opuesto: resta uno al estado actual, y cuando llega al primero **da la vuelta al
último**. Es la rueda de [Mutar](/efectos/mutar/) girando al contrario.

Sobre un furni de dos estados hace exactamente lo mismo que Mutar, porque ir hacia delante y hacia
atrás es lo mismo cuando solo hay dos. La diferencia aparece de tres estados en adelante: con una
farola de tres luces, Mutar va 1→2→3 y este va 3→2→1.

Con los dos juntos se montan las cosas que suben y bajan: un ascensor de varias plantas, un semáforo
que hace la secuencia al revés, un contador que descuenta.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/mutar-inverso.png" alt="Ventana de configuración de Mutar Inverso" class="ventana-wired" />
<!-- /ventana -->

**Selección de furnis**, uno a uno, por tipo o desde el contexto.

## Ejemplo

Dos puertas que se turnan:

```
Pila A:
  Causante: Periodos      [10 s]
  Efecto:   Mutar         [la puerta A]
  Efecto:   Mutar Inverso [la puerta B]
```

## Notas

**Con furnis de muchos estados el resultado no siempre es intuitivo.** Pruébalo antes de montar algo
que dependa de él; con dos estados es predecible, con siete no tanto.

---

# A cero

> Devuelve los furnis a la posición y el estado que tenían cuando lo configuraste.
>
> Página: https://wired.hartico.tv/efectos/a-cero/

Devuelve los furnis elegidos a **como estaban cuando configuraste el efecto**: su posición, su
dirección, su altura y su estado.

## Cómo funciona

Al guardar, el efecto se queda con una foto de los furnis. Al ejecutarse, los devuelve a esa foto.

Es la pieza que hace repetibles los juegos: al acabar una partida, un solo efecto deja el tablero
como al principio sin tener que mover cada ficha a mano.

**No tiene ninguna prioridad sobre los demás efectos.** Va en la misma tanda que todos y el orden
entre ellos se sortea en cada ejecución, así que no des por hecho que reposiciona antes de que otro
efecto toque los mismos furnis. Si necesitas que vaya primero, ponlo con el complemento
[Ejecutar en Orden](/complementos/ejecutar-en-orden/) a la altura más baja de la pila.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/a-cero.png" alt="Ventana de configuración de A cero" class="ventana-wired" />
<!-- /ventana -->

**Selección de furnis**, uno a uno.

**Qué restaurar**, con cuatro casillas combinables:

| Casilla | Restaura |
| --- | --- |
| **Estado actual** | Encendido, apagado, abierto… |
| **Dirección actual** | Hacia dónde estaba girado |
| **Posición actual** | En qué baldosa estaba |
| **Altura actual** | A qué altura estaba |

La posición de destino no se escribe en ningún sitio: es la foto. Las casillas solo deciden qué partes
de esa foto se aplican.

## Ejemplo

Reiniciar el tablero al empezar la partida:

```
Pila A:
  Causante: Comienza el juego
  Efecto:   A cero            [las fichas del tablero]
```

## Notas

**La foto se toma al guardar.** Coloca todo en su sitio de salida y guarda al final; si mueves los
furnis después de configurar el efecto, has cambiado el destino sin querer.

---

# Mover

> Mueve el furni una baldosa y lo gira.
>
> Página: https://wired.hartico.tv/efectos/mover/

Mueve los furnis elegidos una baldosa en la dirección que indiques, y opcionalmente los gira.

## Cómo funciona

Es el efecto de movimiento básico, y con un causante periódico detrás es lo que da vida a las salas:
furnis que patrullan, plataformas que van y vienen, objetos que persiguen.

Si el furni no puede avanzar —hay un muro, otro furni o el borde de la sala— se queda donde está,
y **no avisa a nadie**: este efecto no dispara el causante [Colisión](/causantes/colision/). Si
necesitas enterarte del choque, el que sí lo lanza es
[Cambiar dirección de Furni](/efectos/cambiar-direccion/).

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/mover.png" alt="Ventana de configuración de Mover" class="ventana-wired" />
<!-- /ventana -->

**Selección de furnis**, uno a uno, por tipo o desde el contexto.

**Mover furni**, la dirección del desplazamiento.

**Rotar furni**, el giro que se aplica además del movimiento.

## Ejemplo

Un furni que patrulla y rebota:

```
Pila A:
  Causante: Periodos [0,5 s]
  Efecto:   Mover    [la pelota · adelante]

Pila B:
  Causante: Colisión
  Efecto:   Mover    [la pelota · dirección contraria]
```

## Notas

**Los complementos de movimiento mandan sobre este efecto.** Si quieres que atraviese usuarios, que
se mueva en curva o sin animación, se configura con un complemento en la misma pila, no aquí.

---

# Movimiento Relativo de Furni

> Mueve el furni varias baldosas en X e Y de una vez.
>
> Página: https://wired.hartico.tv/efectos/movimiento-relativo/

Mueve los furnis elegidos un número de baldosas en cada eje, en un solo salto.

## Cómo funciona

Mientras [Mover](/efectos/mover/) avanza una baldosa en una dirección, este te deja decir "cinco a la
derecha y dos hacia abajo" de una vez. Es mucho más práctico para colocar cosas en sitios concretos
sin encadenar diez efectos.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/movimiento-relativo.png" alt="Ventana de configuración de Movimiento Relativo de Furni" class="ventana-wired" />
<!-- /ventana -->

**Selección de furnis**, uno a uno, por tipo o desde el contexto.

**Eje X**, entre **0 y 20** baldosas, con su dirección.

**Eje Y**, entre **0 y 20** baldosas, con su dirección.

## Ejemplo

Una plataforma que sube en diagonal:

```
Pila A:
  Causante: Periodos                     [2 s]
  Efecto:   Movimiento Relativo de Furni [la plataforma · X 3, Y 3]
```

## Notas

**Si el destino está ocupado, no se mueve.** No se queda a medio camino: o cabe el salto entero o no
hay movimiento. Con saltos largos es fácil que algo estorbe.

---

# Cambiar dirección de Furni

> Lanza el furni a moverse en una dirección, y decide cómo rebota cuando choca.
>
> Página: https://wired.hartico.tv/efectos/cambiar-direccion/

Pone los furnis elegidos **en marcha** en una dirección, y decide qué hacen cuando se topan con algo.

## Cómo funciona

El nombre engaña: esto no gira un furni en su sitio, lo **manda a andar**.

Cada ejecución lo adelanta una baldosa, y **la dirección se le queda guardada**. Por eso basta con un
causante periódico detrás: no hay que decirle a dónde va cada vez, sigue solo.

Lo interesante es lo que pasa cuando el camino se corta —un muro, otro furni, una persona—. Ahí
aplica el giro que le hayas puesto: cuarenta y cinco grados, noventa, media vuelta o uno al azar. Eso
es lo que hace que **rebote** y patrulle una sala sin ayuda de nadie.

Con esa mecánica se montan las bolas que van y vienen, los coches de un circuito, los enemigos que
recorren un pasillo y cualquier cosa que tenga que moverse sola sin una pila por baldosa.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/cambiar-direccion.png" alt="Ventana de configuración de Cambiar dirección de Furni" class="ventana-wired" />
<!-- /ventana -->

**Selección de furnis**, uno a uno, por tipo o desde el contexto.

**Dirección inicial**, hacia dónde sale, en una cuadrícula con las ocho.

**Cuando el movimiento se bloquea**, el giro que aplica al chocar:

| Opción | Al chocar |
| --- | --- |
| **Ninguno** | Se para y ahí se queda |
| **45° a la derecha** | Gira un octavo a la derecha y sigue |
| **90° a la derecha** | Gira un cuarto a la derecha |
| **45° a la izquierda** | Un octavo a la izquierda |
| **90° a la izquierda** | Un cuarto a la izquierda |
| **Media vuelta** | Se da la vuelta y desanda el camino |
| **Al azar** | Gira hacia donde le toque |

**Cuando colisiona un usuario**, con la casilla **Esperar**: si hay una persona en medio, el furni se
queda quieto y **no** dispara el causante [Colisión](/causantes/colision/). Sin marcarla, la dispara y
puedes reaccionar al choque.

## Ejemplo

Una bola que recorre la sala rebotando en las paredes:

```
Pila A:
  Causante: Periodos                   [1 s]
  Efecto:   Cambiar dirección de Furni [la bola · hacia el este · media vuelta]
```

Con "media vuelta" va y viene por el mismo pasillo. Cámbialo a "90° a la derecha" y recorre el
perímetro de la sala.

## Notas

**No funciona con furnis de pared.** Solo tiene sentido sobre la rejilla del suelo, que es donde se
puede rebotar; el cliente ni te deja seleccionarlos.

**"Esperar" es la diferencia entre un vehículo y una trampa.** Marcada, el furni respeta a la gente y
espera a que se aparte. Sin marcar, el choque salta como causante y puedes teletransportar, quitar
puntos o lo que quieras.

**Si quieres girarlo sin moverlo, este no es.** Para eso está [Mover](/efectos/mover/), que tiene su
propia cuadrícula de rotación y te deja dejar el movimiento a cero.

---

# Cambiar Altitud de Furni

> Sube o baja el furni.
>
> Página: https://wired.hartico.tv/efectos/cambiar-altitud/

Cambia la altura a la que están colocados los furnis elegidos.

## Cómo funciona

Es la pieza de los ascensores, las plataformas y las barreras que se abren hacia arriba. Combinado
con la condición [Altitud de Furni Coincide](/condiciones/altitud/) puedes montar recorridos
verticales completos.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/cambiar-altitud.png" alt="Ventana de configuración de Cambiar Altitud de Furni" class="ventana-wired" />
<!-- /ventana -->

**Selección de furnis**, uno a uno.

**Opciones**, con tres modos:

- **Aumentar** – suma a la altura actual.
- **Disminuir** – resta.
- **Establecer valor** – la pone en un número exacto.

**Seleccionar altitud**, entre **0.00 y 80.00**.

La casilla enseña el valor con dos decimales, así que lo que escribes es la altura tal cual la
ves en la sala: **1.00** es la altura de un furni de suelo normal.

## Ejemplo

Un ascensor que sube por pasos:

```
Pila A:
  Causante: Click en Furni           [el botón]
  Efecto:   Cambiar Altitud de Furni [la plataforma · aumentar 500]
```

## Notas

**La escala no son baldosas.** El rango llega a 8000, así que los valores útiles son mucho mayores de
lo que parece. Prueba con "establecer valor" antes de fiarte de los incrementos.

**Aumentar y establecer se comportan muy distinto en bucle.** Con un causante periódico, aumentar
sube sin parar; establecer deja el furni quieto en su sitio.

---

# Mover Furni a Furni

> Lleva unos furnis hasta la posición de otro.
>
> Página: https://wired.hartico.tv/efectos/mover-furni-a-furni/

Mueve los furnis elegidos hasta donde está otro furni que hace de destino.

## Cómo funciona

Es la forma de teletransportar objetos sin recorrer el camino: la mercancía que reaparece en el
mostrador, las fichas que vuelven a su casilla, el premio que salta a la mesa.

Cuando das **varias referencias de destino**, los furnis se reparten entre ellas de forma
equilibrada, no se amontonan en la primera. Está explicado en
[Fuentes y objetivos](/conceptos/fuentes-y-objetivos/).

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/mover-furni-a-furni.png" alt="Ventana de configuración de Mover Furni a Furni" class="ventana-wired" />
<!-- /ventana -->

**Furnis a mover**, los que se desplazan.

**Furni objetivo**, el destino.

## Ejemplo

Reponer la mercancía del mostrador:

```
Pila A:
  Causante:  Periodos                 [5 s]
  Condición: NO tiene un Furni encima [el mostrador]
  Efecto:    Mover Furni a Furni      [la mercancía → el mostrador]
```

## Notas

**Con varios orígenes y varios destinos, se reparten.** A cada furni que viaja le toca un destino, y
cuando hay más orígenes que destinos el sobrante se reparte al azar en vez de caer siempre en el
mismo. Los que coincidan en un destino **se apilan** encima; no se pierde ninguno.


**Si el destino está ocupado, el furni no llega.** Con varios furnis moviéndose al mismo sitio, solo
cabe uno; para el resto no pasa nada.

---

# Mover Furni a Usuario

> Trae unos furnis hasta donde está el usuario.
>
> Página: https://wired.hartico.tv/efectos/mover-furni-a-usuario/

Mueve los furnis elegidos hasta la posición del usuario.

## Cómo funciona

Es el inverso de teletransportar a la persona: en vez de llevarla al objeto, trae el objeto a ella.
Sirve para entregas, para que un furni aparezca a los pies de quien lo invoca, y para juegos donde el
escenario se monta alrededor del jugador.

Con **varios usuarios** de por medio, los furnis se reparten entre ellos de forma equilibrada.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/mover-furni-a-usuario.png" alt="Ventana de configuración de Mover Furni a Usuario" class="ventana-wired" />
<!-- /ventana -->

**Selección de furnis**, uno a uno, por tipo o desde el contexto.

## Ejemplo

Un pedestal que trae el premio a quien lo reclama:

```
Pila A:
  Causante: Click en Furni        [el pedestal]
  Efecto:   Mover Furni a Usuario [el cofre]
```

## Notas

**El furni acaba bajo los pies del usuario**, no al lado. Si es alto o bloquea el paso, la persona
puede quedarse encerrada encima; considera moverlo a una baldosa contigua con
[Movimiento Relativo](/efectos/movimiento-relativo/) después.

---

# Mover Usuario a Furni

> Lleva a los usuarios hasta la posición de un furni.
>
> Página: https://wired.hartico.tv/efectos/mover-usuario-a-furni/

Mueve a los usuarios hasta donde está el furni de destino.

## Cómo funciona

A diferencia del teletransporte, aquí importan las reglas de la sala: **dos personas no pueden ocupar
la misma baldosa**. Si mandas cinco usuarios a cuatro destinos, alguno se queda fuera.

Con varias referencias de destino, los usuarios se reparten entre ellas de forma equilibrada.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/mover-usuario-a-furni.png" alt="Ventana de configuración de Mover Usuario a Furni" class="ventana-wired" />
<!-- /ventana -->

**Selección de furnis**, uno a uno, por tipo o desde el contexto: los destinos.

**Si el usuario estaba caminando que**, para decidir qué pasa cuando la persona ya iba andando a
otro sitio:

- **Siga caminando si se movió cerca del objetivo** – respeta su camino si iba hacia allí.
- **Siga caminando** – lo mueve y le deja terminar su camino.
- **Deje de caminar** – lo mueve y lo deja parado.

## Ejemplo

Repartir a los jugadores por las casillas de salida:

```
Pila A:
  Causante: Comienza el juego
  Selector: Usuarios en Área      [la sala de espera]
  Efecto:   Mover Usuario a Furni [las casillas de salida]
```

## Notas

**Para que quepan todos**, añade el complemento de movimientos físicos con atravesar usuarios. Sin
él, el reparto decide a quién le toca cada destino, pero los que coincidan se estorban.

---

# Mensaje

> Muestra un texto en la sala o solo a quien disparó la pila.
>
> Página: https://wired.hartico.tv/efectos/mensaje/

Muestra un texto: o en la sala entera, o únicamente a la persona que disparó la pila.

## Cómo funciona

Es el efecto que más se usa de todo el sistema, porque es la única forma que tiene una pila de
hablarle al jugador. Sin él, todo lo que monta tu sala ocurre en silencio y la gente no entiende por
qué le pasan las cosas.

Merece la pena mandarlo en privado más a menudo de lo que se hace. Un mensaje que ve toda la sala se
convierte en ruido en cuanto hay diez personas jugando; el mismo mensaje dirigido solo a quien lo ha
provocado se lee perfectamente.


:::caution[No funciona con los causantes periódicos]
Con [Periodos](/causantes/periodos/), [Periodos Cortos](/causantes/periodos-cortos/) o
[Periodos Largos](/causantes/periodos-largos/), este efecto **se salta en silencio**. La salida es poner delante un selector de usuarios y dejar que el efecto trabaje sobre ellos: en una
pila periódica no hay desencadenante, así que es lo que quieres de todas formas.
:::

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/mensaje.png" alt="Ventana de configuración de Mensaje" class="ventana-wired" />
<!-- /ventana -->

**Mensaje**, hasta **200 caracteres**. La flecha de al lado abre el editor, con botones de formato y
una vista previa de cómo va a quedar.

**Visibilidad del mensaje**, con dos opciones:

- **Solo el usuario desencadenante** – lo ve únicamente quien disparó la pila.
- **Toda la sala** – lo ve todo el mundo.

**Estilo de notificación**, que cambia el aspecto y el icono del aviso:

| Grupo | Estilos |
| --- | --- |
| **Neutros** | Notificación por defecto, Notificación Azul, Notificación Roja, Notificación Verde |
| **Con icono** | Información, Advertencia, Alerta, Lupa |
| **Resultado** | Correcto, Correcto (Círculo), Incorrecto, Incorrecto (Círculo) |
| **Pregunta** | Interrogación, Interrogación (Círculo) |
| **Dirección** | Flecha ARRIBA, Flecha ARRIBA (Círculo), Flecha ABAJO, Flecha ABAJO (Círculo) |
| **Peligro** | Calavera, Calavera 2 |

## Dar formato al texto

El mensaje admite etiquetas. Se escriben rodeando el texto, como `[b]esto sale en negrita[/b]`, y el
editor tiene un botón para cada una:

| Tipo | Etiquetas |
| --- | --- |
| **Formato** | `[b]` negrita, `[i]` cursiva, `[u]` subrayado, `[s]` tachado |
| **Efectos** | `[wave]` las letras suben y bajan, `[shake]` tiemblan, `[pulse]` laten, `[cuss]` se sustituyen por símbolos |
| **Separador** | `[line]`, que dibuja una línea y no envuelve texto |

Y veintiún colores, que se usan igual: `[red]en rojo[/red]`. Están `red`, `orangered`, `orange`,
`yellow`, `yellowgreen`, `green`, `seagreen`, `teal`, `cyan`, `skyblue`, `blue`, `darkblue`, `indigo`,
`purple`, `violet`, `pk`, `brown`, `maroon`, `grey`, `white` y `black`.

Ojo con el rosa: la etiqueta es **`[pk]`**, no `[pink]`. Los saltos de línea se respetan tal cual los
escribas.

## Ejemplo

Un cofre que solo se abre con la llave:

```
Pila A:
  Causante:  Click en Furni    [el cofre]
  Condición: Contiene variable [tiene_llave]
  Efecto:    Mensaje           ["El cofre se abre" · solo el usuario · Correcto]
  Efecto:    Mutar             [el cofre]
```

Y la pila gemela con la condición negada y estilo Incorrecto explica por qué no se abrió.

## Notas

**No abuses del mensaje a toda la sala.** Con un causante periódico y un selector, un solo mensaje se
convierte en veinte líneas por segundo y la gente se va.

**El estilo es información, no decoración.** Si usas siempre Correcto e Incorrecto para lo mismo, el
jugador aprende a leer tu sala de un vistazo sin llegar a leer el texto.

---

# ¡Adiós!

> Teletransporta al usuario al furni que elijas.
>
> Página: https://wired.hartico.tv/efectos/adios/

Teletransporta a la persona hasta el furni indicado, al instante y sin caminar.

## Cómo funciona

Es el teletransporte de toda la vida y la pieza sobre la que se monta media sala: puertas secretas,
laberintos, expulsiones a la zona de espera, premios que te llevan a la sala del tesoro.

A diferencia de [Mover Usuario a Furni](/efectos/mover-usuario-a-furni/), aquí no hay caminata ni
posibilidad de que el camino esté cortado: la persona aparece directamente encima.


:::caution[No funciona con los causantes periódicos]
Con [Periodos](/causantes/periodos/), [Periodos Cortos](/causantes/periodos-cortos/) o
[Periodos Largos](/causantes/periodos-largos/), este efecto **se salta en silencio**. La salida es poner delante un selector de usuarios y dejar que el efecto trabaje sobre ellos: en una
pila periódica no hay desencadenante, así que es lo que quieres de todas formas.
:::

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/adios.png" alt="Ventana de configuración de ¡Adiós!" class="ventana-wired" />
<!-- /ventana -->

**Selección de furnis** de destino: uno a uno, por tipo o desde el contexto.

## Ejemplo

Una puerta secreta que solo abre quien lleva la placa:

```
Pila A:
  Causante:  Sobre un Furni         [el felpudo]
  Condición: Usuario Lleva la Placa ["VIP"]
  Efecto:    ¡Adiós!                [la baldosa del interior]
```

## Notas

**Si eliges varios furnis, se reparte.** Con varios destinos seleccionados, cada persona acaba en uno
de ellos; es la forma de repartir a la gente por un laberinto sin montar una pila por salida.

**Cuidado con teletransportar a la baldosa de otro causante.** Si el destino tiene encima un
[Sobre un Furni](/causantes/sobre-furni/) que a su vez teletransporta, has montado un bucle. El
sistema lo corta, pero la sala se queda con el wired frenado.

---

# Mover y Rotar Usuario

> Desplaza al usuario una baldosa y le cambia hacia dónde mira.
>
> Página: https://wired.hartico.tv/efectos/mover-y-rotar-usuario/

Desplaza a la persona una baldosa en la dirección que indiques y, si quieres, le cambia la dirección
en la que mira.

## Cómo funciona

Es el equivalente para personas de [Mover](/efectos/mover/): un empujón de una casilla, no un
teletransporte. Sirve para empujones, cintas transportadoras, corrientes de agua y todo lo que deba
arrastrar al jugador poco a poco.

Como es un movimiento real, respeta el mapa: si al otro lado hay un muro o un furni que no se puede
pisar, el empujón no ocurre.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/mover-y-rotar-usuario.png" alt="Ventana de configuración de Mover y Rotar Usuario" class="ventana-wired" />
<!-- /ventana -->

**Escoge el movimiento**, con las direcciones en una cuadrícula, más la opción de no moverse.

**Escoge la rotación**, con las mismas direcciones más **Sin rotación**, para dejar la mirada como
estaba.

## Ejemplo

Una cinta transportadora:

```
Pila A:
  Causante: Sobre un Furni        [las baldosas de la cinta]
  Efecto:   Mover y Rotar Usuario [hacia el norte · sin rotación]
```

Con el causante disparando cada vez que la persona pisa una baldosa nueva, la cinta la arrastra sola.

## Notas

**Rotar sin mover también vale.** Dejando el movimiento en su sitio y eligiendo solo la rotación,
tienes una forma de obligar a la gente a mirar donde te interesa: al escenario, a la puerta, al
cartel.

**Es más lento que el teletransporte, y eso es bueno.** El jugador ve que le empujan, así que entiende
lo que le está pasando; con [¡Adiós!](/efectos/adios/) aparece en otro sitio sin saber por qué.

---

# Teletransportar a Sala

> Envía al usuario a otra sala del hotel.
>
> Página: https://wired.hartico.tv/efectos/teletransportar-a-sala/

Envía a la persona a **otra sala** del hotel.

## Cómo funciona

Es el único efecto que saca al jugador de tu sala. Con él se montan hoteles enteros repartidos en
varias salas: un vestíbulo que reparte, un juego por niveles con una sala por nivel, un recorrido
temático que va de escenario en escenario.

La sala de destino se configura en el propio furni, no en la ventana del wired.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/teletransportar-a-sala.png" alt="Ventana de configuración de Teletransportar a Sala" class="ventana-wired" />
<!-- /ventana -->

**Selección de furnis**, para elegir el furni que lleva configurado el destino.

## Ejemplo

Un ascensor entre plantas:

```
Pila A:
  Causante:  Click en Furni         [el botón]
  Condición: Usuario Lleva la Placa ["PLANTA2"]
  Efecto:    Mensaje                ["Subiendo..." · solo el usuario]
  Efecto:    Teletransportar a Sala [con retardo 2 s]
```

El retardo da tiempo a leer el mensaje antes de que la pantalla cambie de sala.

## Notas

**Avisa antes de mover a nadie.** Cambiar de sala sin previo aviso se siente como un fallo del
cliente. Un mensaje y un retardo de uno o dos segundos arreglan la sensación por completo.

**Hay causantes con los que este efecto no funciona, y no avisa.** Son cuatro:
[Entrada](/causantes/entra-en-la-sala/), [Periodos](/causantes/periodos/),
[Periodos Cortos](/causantes/periodos-cortos/) y [Periodos Largos](/causantes/periodos-largos/). Con
cualquiera de ellos el efecto se salta sin más.

El de Entrada duele especialmente, porque es lo primero que se le ocurre a todo el mundo para encadenar
dos salas — y es justo la pareja que montaría un bucle infinito entre ellas. Si quieres reenviar a
quien llega, ponle una baldosa nada más entrar y usa [Sobre un Furni](/causantes/sobre-furni/).

Los tres periódicos sí valen **si el efecto trabaja sobre un selector** en vez de sobre el
desencadenante.

---

# Expulsar Usuario

> Echa al usuario de la sala con un mensaje.
>
> Página: https://wired.hartico.tv/efectos/expulsar-usuario/

Echa a la persona de la sala, con un mensaje de despedida.

## Cómo funciona

Es la sanción más dura que puede aplicar una pila: la persona sale a su vista de navegación y tiene
que volver a entrar. No es un baneo, así que puede regresar de inmediato.

Su uso honesto no es castigar sino **hacer cumplir un aforo o unas normas**: sacar a quien entra sin
la placa de acceso, vaciar la sala al terminar un evento, echar de una zona privada.


:::caution[No funciona con los causantes periódicos]
Con [Periodos](/causantes/periodos/), [Periodos Cortos](/causantes/periodos-cortos/) o
[Periodos Largos](/causantes/periodos-largos/), este efecto **se salta en silencio**. Y aquí no hay salida: ni con un selector delante. Si necesitas echar gente cada cierto tiempo, monta
el periódico en otra pila y que llame a esta con [Enviar Señal](/efectos/enviar-senal/).
:::

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/expulsar-usuario.png" alt="Ventana de configuración de Expulsar Usuario" class="ventana-wired" />
<!-- /ventana -->

**Mensaje** de expulsión, que se le muestra a quien sale.

## Ejemplo

Una sala solo para el grupo:

```
Pila A:
  Causante:  Entrada                 [cualquier avatar]
  Condición: NO es Miembro del Grupo [grupo actual]
  Efecto:    Expulsar Usuario        ["Esta sala es solo para el grupo"]
```

## Notas

**Explica siempre por qué.** Sin mensaje, el jugador vive la expulsión como un fallo y vuelve a entrar
una y otra vez.

**Deja margen de reacción.** Expulsar en el mismo instante de entrar es agresivo; un retardo de tres
segundos con un mensaje delante hace la misma función y no espanta a nadie.

**El dueño de la sala y el staff son inmunes.** Si pruebas tu propia pila en tu sala, no te va a echar
y vas a pensar que está rota. Pruébala con otra cuenta.

**No sirve contra quien insiste.** Puede volver a entrar acto seguido. Para vetos de verdad, habla con
el staff del hotel.

---

# Mutear usuario

> Deja al usuario sin poder hablar durante unos minutos.
>
> Página: https://wired.hartico.tv/efectos/mutear-usuario/

Deja a la persona sin poder hablar en la sala durante los minutos que indiques.

## Cómo funciona

Es la alternativa suave a [Expulsar Usuario](/efectos/expulsar-usuario/): la persona se queda en la
sala y puede seguir jugando, pero no puede escribir.

Su terreno natural son los juegos con turnos de palabra y los eventos con público: silenciar a los
espectadores mientras habla el presentador, callar al equipo que no está respondiendo, imponer el
silencio en una zona de biblioteca.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/mutear-usuario.png" alt="Ventana de configuración de Mutear usuario" class="ventana-wired" />
<!-- /ventana -->

**Duración**, entre **1 y 10 minutos**.

**Mensaje**, hasta 200 caracteres, para explicar el silencio.

## Ejemplo

Una zona de silencio:

```
Pila A:
  Causante: Clave          [cualquier cosa]
  Efecto:   Mutear usuario [1 minuto · "Silencio en la biblioteca"]
```

## Notas

**Un minuto es mucho tiempo en una sala.** Para llamar la atención, un solo minuto ya cumple; diez son
para expulsar de hecho sin expulsar.

**El silencio es solo de esta sala, pero no se quita saliendo.** La persona puede hablar en cualquier
otra parte del hotel; en esta se le acaba cuando pasan los minutos que pusiste, aunque salga y vuelva
a entrar.

---

# Congelar Usuario

> Deja al usuario clavado en su baldosa, con un efecto visual.
>
> Página: https://wired.hartico.tv/efectos/congelar-usuario/

Deja a la persona clavada en su baldosa: no puede caminar hasta que la descongeles.

## Cómo funciona

Es la pieza que hace posibles los juegos de "el que se mueve, pierde": estatuas, escondite, pruebas de
reflejos, castigos temporales.

Además de bloquear el movimiento, le pone un efecto visual al avatar para que se note desde fuera que
está congelado. Sin esa señal, el jugador cree que el hotel se ha colgado.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/congelar-usuario.png" alt="Ventana de configuración de Congelar Usuario" class="ventana-wired" />
<!-- /ventana -->

**Escoge un efecto**, el visual que se le pone al avatar mientras dura:

| Efecto | Aspecto |
| --- | --- |
| **Congelado** | Bloque de hielo |
| **Wired Freeze** | El efecto propio del sistema |
| **Trampa de arena** | Hundido en arena |
| **Rayos X** | Silueta |
| **Pajaritos** | Aturdido |

**Descongelar al teletransportarse**, una casilla que libera automáticamente a quien sea movido por un
teletransporte mientras está congelado.

## Ejemplo

Estatuas: cuando para la música, el que se mueve queda congelado.

```
Pila A:
  Causante: Periodos Largos     [30 s]
  Selector: Usuarios en Área    [la pista]
  Efecto:   Congelar Usuario    [Congelado]
  Efecto:   Descongelar Usuario [con retardo 10 s]
```

## Notas

**Marca siempre "Descongelar al teletransportarse" si en tu sala hay teletransportes.** Si no, alguien
puede acabar congelado en un sitio del que no puede salir y tendrás que reiniciar la sala.

**Ten preparado el descongelado antes de congelar a nadie.** Un congelado sin salida es un jugador
atrapado; la forma segura es poner el [Descongelar](/efectos/descongelar-usuario/) con retardo en la
misma pila, para que la liberación esté garantizada aunque el resto falle.

---

# Descongelar Usuario

> Devuelve el movimiento a quien estaba congelado.
>
> Página: https://wired.hartico.tv/efectos/descongelar-usuario/

Devuelve el movimiento a la persona y le quita el efecto visual de congelación.

## Cómo funciona

Es la mitad que libera de [Congelar Usuario](/efectos/congelar-usuario/), y no tiene ninguna opción:
descongela a quien le toque según la fuente de la pila.

Se usa de tres formas: con retardo en la misma pila que congela, para un congelado de duración fija;
en una pila aparte con su propio causante, para que la libertad la dé alguien; o sobre toda la sala con
un selector, para el "todos libres" de fin de ronda.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/descongelar-usuario.png" alt="Ventana de configuración de Descongelar Usuario" class="ventana-wired" />
<!-- /ventana -->

Sin opciones.

## Ejemplo

Un botón que libera a toda la sala:

```
Pila A:
  Causante: Click en Furni      [el botón rojo]
  Selector: Usuarios en Área    [toda la sala]
  Efecto:   Descongelar Usuario
  Efecto:   Mensaje             ["¡Todos libres!"]
```

## Notas

**Ten siempre una salida de emergencia.** Un botón como el del ejemplo, aunque tu juego descongele
solo, te ahorra tener que reiniciar la sala el día que algo se tuerza.

---

# Mensaje de Bot

> Hace que un bot hable o grite en la sala.
>
> Página: https://wired.hartico.tv/efectos/mensaje-de-bot/

Hace que un bot diga algo en la sala, hablando o gritando.

## Cómo funciona

Un bot que habla solo cuando el wired se lo manda vale mucho más que uno con frases automáticas,
porque puede responder a lo que está pasando: felicitar al que gana, avisar de que empieza la ronda,
regañar al que entra donde no debe.

El mensaje sale con el nombre y el aspecto del bot, así que la sala lo lee como a un personaje, no como
a un cartel.


:::caution[No funciona con Periodos Cortos]
Con [Periodos Cortos](/causantes/periodos-cortos/) este efecto **se salta en silencio**. Usa
[Periodos](/causantes/periodos/) o [Periodos Largos](/causantes/periodos-largos/), que sí valen.
:::

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/mensaje-de-bot.png" alt="Ventana de configuración de Mensaje de Bot" class="ventana-wired" />
<!-- /ventana -->

**Nombre del bot**, escrito tal cual se llama en la sala.

**Seleccionar fuente de bots**, para no depender del nombre escrito. Además de **Un bot
especificado por nombre**, que es lo que trae de fábrica, puede tomar el bot del usuario
desencadenante, de los del selector, de los de la señal, del usuario clicado o del usuario alcanzado.

**Modo**, con dos opciones:

- **Hablar** – mensaje normal.
- **Gritar** – el mensaje sale como un grito. No pasa el texto a mayúsculas: si lo quieres así,
  escríbelo tú.

**Mensaje**, el texto que dice.

## Ejemplo

Un presentador que anuncia la ronda:

```
Pila A:
  Causante: Periodos Largos [60 s]
  Efecto:   Mensaje de Bot  [Presentador · gritar · "¡Empieza la ronda!"]
```

## Notas

**Lo que dice el bot vuelve a entrar por [Clave](/causantes/dice-algo/).** Su chat se trata como el
de cualquiera, así que si el bot dice algo que casa con una palabra clave tuya, esa pila se dispara. Y
si esa pila hace hablar al mismo bot, tienes un bucle.

**El nombre del bot tiene que coincidir exactamente.** Si lo renombras, la pila deja de funcionar sin
avisar de nada. Es el fallo número uno de todos los efectos de bot.

**Si quieres hablarle a una persona en concreto**, usa
[Bot habla o susurra a usuario](/efectos/bot-habla-a-usuario/), que además puede susurrar.

---

# Bot habla o susurra a usuario

> Hace que un bot se dirija a una persona concreta, en voz alta o al oído.
>
> Página: https://wired.hartico.tv/efectos/bot-habla-a-usuario/

Hace que un bot se dirija a **una persona concreta**, hablándole delante de todos o susurrándole solo a
ella.

## Cómo funciona

Es lo que convierte a un bot en un personaje con el que se puede tratar. El susurro es la parte
interesante: permite darle información privada a un jugador —una pista, una contraseña, su puntuación—
sin que el resto de la sala se entere.

Con eso se montan misiones, gincanas con pistas distintas por persona y tiendas atendidas por un
personaje.


:::caution[No funciona con Periodos Cortos]
Con [Periodos Cortos](/causantes/periodos-cortos/) este efecto **se salta en silencio**. Usa
[Periodos](/causantes/periodos/) o [Periodos Largos](/causantes/periodos-largos/), que sí valen.
:::

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/bot-habla-a-usuario.png" alt="Ventana de configuración de Bot habla o susurra a usuario" class="ventana-wired" />
<!-- /ventana -->

**Nombre del bot**, escrito tal cual se llama en la sala.

**Seleccionar fuente de bots**, para no depender del nombre escrito. Además de **Un bot
especificado por nombre**, que es lo que trae de fábrica, puede tomar el bot del usuario
desencadenante, de los del selector, de los de la señal, del usuario clicado o del usuario alcanzado.

**Modo**, con dos opciones:

- **Hablar** – lo oye toda la sala, y el bot **antepone el nombre de la persona y dos puntos**: si
  escribes "Aquí tiene", en la sala se lee "Marco: Aquí tiene". Cuéntalo al redactar el mensaje.
- **Susurrar** – lo lee solo el destinatario.

**Mensaje**, el texto que dice.

## Ejemplo

Un guardián que da la contraseña a quien tiene la placa:

```
Pila A:
  Causante:  Click en Furni                [el guardián]
  Condición: Usuario Lleva la Placa        ["INICIADO"]
  Efecto:    Bot habla o susurra a usuario [Guardián · susurrar · "La palabra es: cobalto"]
```

## Notas

**El susurro se pierde si el jugador no está mirando.** No lo uses para información crítica sin
repetirla en algún sitio permanente, como un cartel o una variable que pueda consultar.

**Necesita saber a quién dirigirse.** Con un causante periódico no hay destinatario y no pasa nada. Y
no basta con añadir un selector: además hay que cambiar la **fuente de usuarios** del propio efecto
para que tome los del selector, dentro de
[Mostrar opciones avanzadas](/conceptos/opciones-avanzadas/).

---

# Bot mover a furni

> Manda a un bot caminando hasta el furni que elijas.
>
> Página: https://wired.hartico.tv/efectos/bot-mover-a-furni/

Manda a un bot **caminando** hasta el furni indicado.

## Cómo funciona

El bot va andando, no aparece: busca el camino, esquiva lo que puede y tarda lo que tarde. Eso es
justo lo que quieres para que parezca un personaje vivo — un camarero que va a la barra, un guardia que
hace la ronda, una mascota que sigue su recorrido.

Cuando llega, dispara el causante [Bot alcanza el furni](/causantes/bot-alcanza-furni/), que es la
forma de encadenar el siguiente paso del recorrido.


:::caution[No funciona con Periodos Cortos]
Con [Periodos Cortos](/causantes/periodos-cortos/) este efecto **se salta en silencio**. Usa
[Periodos](/causantes/periodos/) o [Periodos Largos](/causantes/periodos-largos/), que sí valen.
:::

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/bot-mover-a-furni.png" alt="Ventana de configuración de Bot mover a furni" class="ventana-wired" />
<!-- /ventana -->

**Nombre del bot**, escrito tal cual se llama en la sala.

**Seleccionar fuente de bots**, para no depender del nombre escrito. Además de **Un bot
especificado por nombre**, que es lo que trae de fábrica, puede tomar el bot del usuario
desencadenante, de los del selector, de los de la señal, del usuario clicado o del usuario alcanzado.

**Selección de furnis**, el destino. Si eliges varios, el bot va **a uno solo**, no los recorre: para
una ruta hay que encadenar pilas como en el ejemplo.

## Ejemplo

Un guardia que patrulla entre dos puntos.

Pon dos furnis **que se puedan pisar** en los extremos del recorrido —dos baldosas valen— y una pila
por cada uno. Si no se pueden pisar, el bot llega pero el causante de llegada no salta y la patrulla
se para en la primera parada.

```
Pila A:
  Causante: Bot alcanza furni [la baldosa sur]
  Efecto:   Bot mover a furni [Guardia → la baldosa norte]

Pila B:
  Causante: Bot alcanza furni [la baldosa norte]
  Efecto:   Bot mover a furni [Guardia → la baldosa sur]
```

Cada llegada lanza el viaje contrario, y la patrulla se mantiene sola.

## Notas

**Si el camino está cortado, el bot no llega y el causante de llegada nunca salta.** En una patrulla
como la del ejemplo, eso deja al bot parado para siempre. Un causante periódico de respaldo que
reordene el viaje evita el atasco.

**Para llegadas instantáneas** usa
[Teletransportar Bot a Furni](/efectos/teletransportar-bot-a-furni/); es feo, pero nunca se atasca.

---

# Teletransportar Bot a Furni

> Coloca un bot sobre el furni que elijas, sin que camine hasta él.
>
> Página: https://wired.hartico.tv/efectos/teletransportar-bot-a-furni/

Coloca al bot encima del furni indicado sin que camine hasta él.

## Cómo funciona

Es la versión sin caminata de [Bot mover a furni](/efectos/bot-mover-a-furni/). Lo que pierde en
naturalidad lo gana en fiabilidad: no hay camino que buscar, así que no hay forma de que se atasque.

Se usa para colocar bots al empezar una ronda, para recuperar a uno que se ha quedado tirado en una
esquina y para efectos deliberados de aparición.


:::caution[No funciona con Periodos Cortos]
Con [Periodos Cortos](/causantes/periodos-cortos/) este efecto **se salta en silencio**. Usa
[Periodos](/causantes/periodos/) o [Periodos Largos](/causantes/periodos-largos/), que sí valen.
:::

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/teletransportar-bot-a-furni.png" alt="Ventana de configuración de Teletransportar Bot a Furni" class="ventana-wired" />
<!-- /ventana -->

**Nombre del bot**, escrito tal cual se llama en la sala.

**Seleccionar fuente de bots**, para no depender del nombre escrito. Además de **Un bot
especificado por nombre**, que es lo que trae de fábrica, puede tomar el bot del usuario
desencadenante, de los del selector, de los de la señal, del usuario clicado o del usuario alcanzado.

**Selección de furnis**, el destino.

## Ejemplo

Colocar a los bots en su sitio al empezar la partida:

```
Pila A:
  Causante: Recibir Señal               [señal "inicio"]
  Efecto:   Teletransportar Bot a Furni [Árbitro → el centro]
  Efecto:   Teletransportar Bot a Furni [Portero → la portería]
```

## Notas

**Es la forma de arreglar bots perdidos.** Un periódico largo que recoloque a cada bot en su puesto
cada pocos minutos mantiene la sala en orden sin que nadie tenga que reiniciarla.

---

# Bot Sigue a Usuario

> Hace que un bot persiga a una persona, o que deje de hacerlo.
>
> Página: https://wired.hartico.tv/efectos/bot-sigue-a-usuario/

Hace que un bot **persiga** a una persona por la sala, o que deje de perseguirla.

## Cómo funciona

A diferencia de [Bot mover a furni](/efectos/bot-mover-a-furni/), que es un viaje con destino fijo,
aquí el bot recalcula el camino continuamente para seguir a la persona vaya donde vaya. La persecución
dura hasta que la pares.

Cuando el bot llega hasta su objetivo, dispara el causante
[Bot alcanza al usuario](/causantes/bot-alcanza-usuario/) — que es donde se resuelve lo que pasa al ser
atrapado.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/bot-sigue-a-usuario.png" alt="Ventana de configuración de Bot Sigue a Usuario" class="ventana-wired" />
<!-- /ventana -->

**Nombre del bot**, escrito tal cual se llama en la sala.

**Seleccionar fuente de bots**, para no depender del nombre escrito. Además de **Un bot
especificado por nombre**, que es lo que trae de fábrica, puede tomar el bot del usuario
desencadenante, de los del selector, de los de la señal, del usuario clicado o del usuario alcanzado.

**Modo**, con dos opciones:

- **Empezar a seguir** – arranca la persecución.
- **Dejar de seguir** – la detiene.

## Ejemplo

Un juego de pillar:

```
Pila A:
  Causante: Click en Furni      [el botón]
  Efecto:   Bot Sigue a Usuario [Monstruo · empezar a seguir]

Pila B:
  Causante: Bot alcanza usuario [Monstruo]
  Efecto:   Bot Sigue a Usuario [Monstruo · dejar de seguir]
  Efecto:   ¡Adiós!             [la mazmorra · fuente: El usuario alcanzado]
  Efecto:   Mensaje             ["¡Te ha pillado!" · fuente: El usuario alcanzado]
```

Fíjate en la fuente de los dos últimos efectos: en este causante el desencadenante es el **bot**, así
que sin cambiarla mandarías al monstruo a la mazmorra en vez de a su presa.

## Notas

**Una persecución que no se para nunca no termina.** Acuérdate siempre de poner el "dejar de seguir" en
la pila que resuelve la captura, o el bot seguirá a esa persona el resto de la sesión.

**Solo persigue a personas.** Si el desencadenante es otro bot, la orden se ignora.

**El deslizador de retardo no hace nada aquí.** La ventana lo enseña porque lo enseñan todas, pero la
orden de seguir o de dejar de seguir se aplica en el acto.

**La persecución también se corta sola** si la persona sale de la sala. No hace falta pararla a mano en
ese caso, pero sí en todos los demás.

---

# Bot cambia ropa

> Cambia el aspecto de un bot al look que le indiques.
>
> Página: https://wired.hartico.tv/efectos/bot-cambia-ropa/

Cambia el aspecto de un bot al look que le indiques.

## Cómo funciona

Sirve para que un personaje evolucione durante el juego en vez de ser siempre el mismo muñeco: el
guardia que se pone el uniforme, el monstruo que se transforma, el maniquí de una tienda que va
enseñando conjuntos.

El look se escribe en el formato interno del avatar. La ventana trae un botón para copiar el tuyo, que
es la forma cómoda de conseguirlo: vístete tú como quieres que vaya el bot, copia y pega.


:::caution[No funciona con Periodos Cortos]
Con [Periodos Cortos](/causantes/periodos-cortos/) este efecto **se salta en silencio**. Usa
[Periodos](/causantes/periodos/) o [Periodos Largos](/causantes/periodos-largos/), que sí valen.
:::

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/bot-cambia-ropa.png" alt="Ventana de configuración de Bot cambia ropa" class="ventana-wired" />
<!-- /ventana -->

**Nombre del bot**, escrito tal cual se llama en la sala.

**Seleccionar fuente de bots**, para no depender del nombre escrito. Además de **Un bot
especificado por nombre**, que es lo que trae de fábrica, puede tomar el bot del usuario
desencadenante, de los del selector, de los de la señal, del usuario clicado o del usuario alcanzado.

**Look**, la cadena del aspecto.

**Copiar mi look**, un botón que rellena el campo con el aspecto que llevas puesto en ese momento.

## Ejemplo

Un maniquí que cambia de conjunto:

```
Pila A:
  Causante: Periodos Largos [20 s]
  Efecto:   Bot cambia ropa [Maniquí · conjunto de verano]
  Efecto:   Bot cambia ropa [Maniquí · conjunto de invierno · con retardo 10 s]
```

## Notas

**Usa siempre el botón de copiar.** Escribir la cadena a mano es la vía rápida a un bot con la cabeza
flotando; vestirte tú y copiar no falla nunca.

---

# Dar Item de mano

> Hace que un bot entregue un objeto de mano a la persona.
>
> Página: https://wired.hartico.tv/efectos/dar-item-de-mano/

Hace que un bot le entregue a la persona un objeto de mano: una bebida, un helado, una flor.

## Cómo funciona

Es lo que convierte a un bot en camarero, en dependiente o en repartidor. La persona se queda con el
objeto en la mano y todo el mundo lo ve, así que sirve además como marca visible de que ya ha pasado
por ahí.

Va bien de la mano de la condición
[Usuario NO tiene item de mano](/condiciones/no-item-de-mano/), que evita quitarle sin querer lo que
ya llevaba.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/dar-item-de-mano.png" alt="Ventana de configuración de Dar Item de mano" class="ventana-wired" />
<!-- /ventana -->

**Nombre del bot**, escrito tal cual se llama en la sala.

**Seleccionar fuente de bots**, para no depender del nombre escrito. Además de **Un bot
especificado por nombre**, que es lo que trae de fábrica, puede tomar el bot del usuario
desencadenante, de los del selector, de los de la señal, del usuario clicado o del usuario alcanzado.

**Objeto de mano**, de la lista disponible, con **Ninguno** para vaciarle las manos.

**Copiar mi objeto de mano**, un botón que selecciona el que llevas tú en ese momento.

**Dar objeto de mano con bot**, una casilla que decide si la entrega la hace el bot —con su gesto y su
animación— o si el objeto aparece sin más.

## Ejemplo

Un camarero que sirve una copa:

```
Pila A:
  Causante:  Click en Furni                [la barra]
  Condición: Usuario NO tiene item de mano [la copa]
  Efecto:    Dar Item de mano              [Camarero · copa · con bot]
  Efecto:    Bot habla o susurra a usuario [Camarero · hablar · "Aquí tiene"]
```

## Notas

**Con "Ninguno" se le quita lo que lleve.** Es la forma de recoger los vasos al final del evento o de
desarmar a alguien en un juego.

**El objeto se pierde al salir de la sala.** No sirve como premio permanente; para eso están las placas
y las variables.

---

# Unirse al Equipo

> Apunta al usuario al equipo rojo, verde, azul o amarillo.
>
> Página: https://wired.hartico.tv/efectos/unirse-al-equipo/

Apunta a la persona a uno de los cuatro equipos de la sala.

## Cómo funciona

Los equipos son la base del sistema de juegos: mientras estás en uno, tus puntos cuentan para él, y
las condiciones de equipo pueden distinguirte del resto.

Hay cuatro y son fijos: **rojo**, **verde**, **azul** y **amarillo**. Al unirse, el avatar recibe el
efecto visual del color, así que desde fuera se ve de qué equipo es cada cual.

No hace falta que haya una partida en marcha para apuntarse, y **al terminarla los equipos no se
vacían**: la gente sigue en el suyo hasta que sale de la sala o usa
[Abandonar Equipo](/efectos/abandonar-equipo/).

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/unirse-al-equipo.png" alt="Ventana de configuración de Unirse al Equipo" class="ventana-wired" />
<!-- /ventana -->

**Equipo**, a elegir entre rojo, verde, azul y amarillo.

## Ejemplo

Una baldosa de alistamiento por color:

```
Pila A:
  Causante: Sobre un Furni   [la baldosa roja]
  Efecto:   Unirse al Equipo [rojo]
  Efecto:   Mensaje          ["Te has unido al equipo rojo" · solo el usuario]
```

Repite la pila con cada color en su baldosa y tienes el reclutamiento montado.

## Notas

**Unirse a un equipo saca del anterior.** No hace falta abandonar antes de cambiar de color.

**Hay un tope de cinco por equipo, pero solo si la sala tiene la puerta de ese color.** Sin puerta no
hay límite. Cuando lo hay y el equipo está lleno, el efecto no hace nada y no avisa de nada — la
persona simplemente se queda sin equipo.

**Se pierden al salir de la sala.** Aguantan el final de la partida, pero no una salida: para una marca
que de verdad dure, usa una variable de usuario o una placa.

---

# Abandonar Equipo

> Saca al usuario del equipo en el que esté.
>
> Página: https://wired.hartico.tv/efectos/abandonar-equipo/

Saca a la persona del equipo en el que esté, sea cual sea.

## Cómo funciona

No hay que decirle de qué equipo: saca del que sea. Con eso se monta la baldosa de rendición, la zona
neutral donde nadie compite y la limpieza de fin de ronda.

Al salir, el avatar pierde el efecto visual del color.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/abandonar-equipo.png" alt="Ventana de configuración de Abandonar Equipo" class="ventana-wired" />
<!-- /ventana -->

Sin opciones.

## Ejemplo

Una zona neutral de descanso:

```
Pila A:
  Causante: Sobre un Furni   [las baldosas del banco]
  Efecto:   Abandonar Equipo
  Efecto:   Mensaje          ["Estás fuera de juego mientras descanses" · solo el usuario]
```

## Notas

**Es la forma limpia de terminar una ronda, y hace falta.** Terminar la partida NO vacía los equipos:
quien jugó sigue apuntado hasta que sale de la sala. Un selector con toda la sala y este efecto es lo
que deja el reparto a cero para la siguiente.

---

# Dar puntos

> Suma o resta puntos a la persona.
>
> Página: https://wired.hartico.tv/efectos/dar-puntos/

Suma —o resta— puntos a la persona.

## Cómo funciona

Es la puntuación **individual**: cuenta para quien la recibe, no para su equipo. Con ella se montan las
clasificaciones personales, los marcadores de habilidad y los sistemas de monedas caseros.

Que pueda restar es la mitad del sistema: sin penalizaciones, cualquier juego se gana repitiendo la
acción que puntúa hasta el infinito.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/dar-puntos.png" alt="Ventana de configuración de Dar puntos" class="ventana-wired" />
<!-- /ventana -->

**Puntos**, entre **1 y 100** por ejecución.

**Modo**, con dos opciones:

- **Aumentar puntuación** – suma.
- **Disminuir puntuación** – resta.

## Ejemplo

Un juego de aciertos y fallos:

```
Pila A:
  Causante: Sobre un Furni [la baldosa verde]
  Efecto:   Dar puntos     [10 · aumentar]

Pila B:
  Causante: Sobre un Furni [la baldosa roja]
  Efecto:   Dar puntos     [5 · disminuir]
```

## Notas

**Para puntuación de equipo usa [Dar Puntos a Equipo](/efectos/dar-puntos-a-equipo/).** Son dos
marcadores distintos y no se suman entre sí.

**Cien por ejecución es el tope, pero puedes poner el efecto dos veces** en la misma pila si necesitas
premios más grandes.

---

# Dar Puntos a Equipo

> Suma puntos al equipo de la persona, con un límite de veces por partida.
>
> Página: https://wired.hartico.tv/efectos/dar-puntos-a-equipo/

Suma puntos al **equipo** al que pertenece la persona, con un tope de veces por partida.

## Cómo funciona

Es la puntuación clásica de los juegos de sala: los puntos van al marcador del equipo, no al de la
persona, así que la victoria es colectiva.

El límite de veces es lo que lo hace justo. Sin él, un jugador puede pisar la baldosa que puntúa una y
otra vez y ganar solo por insistir; con el límite puesto, cada uno aporta lo suyo y luego tiene que
buscar otra forma de sumar.

Si la persona no está en ningún equipo, no pasa nada.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/dar-puntos-a-equipo.png" alt="Ventana de configuración de Dar Puntos a Equipo" class="ventana-wired" />
<!-- /ventana -->

**Puntos**, entre **1 y 100** por ejecución.

**Veces por partida**, entre **1 y 10 000**, el número máximo de veces que una misma persona puede
puntuar con este efecto en una partida.

## Ejemplo

Una bandera que hay que capturar:

```
Pila A:
  Causante:  Sobre un Furni      [la bandera]
  Condición: Miembro del Equipo  [rojo]
  Efecto:    Dar Puntos a Equipo [50 · 3 veces por partida]
  Efecto:    Mensaje             ["¡Bandera capturada!"]
```

## Notas

**El contador de veces se reinicia al empezar la partida**, no al salir de la sala. Ten en cuenta cómo
arranca y termina tu juego, o el límite no significará lo que crees.

**Requiere que la persona esté en un equipo.** Es el fallo más común: la pila parece rota cuando lo que
pasa es que nadie se ha alistado todavía.

---

# Colisión de Equipo

> Dispara el causante de colisión sobre los miembros de un equipo.
>
> Página: https://wired.hartico.tv/efectos/colision-de-equipo/

Dispara el causante [Colisión](/causantes/colision/) sobre los miembros del equipo que indiques.

## Cómo funciona

Es un efecto poco habitual porque su resultado no es visible: lo que hace es **provocar un causante**
en otra pila. Sirve para tratar a un equipo entero como si acabara de chocar con algo.

Se activa para **todos** los miembros del equipo, estén donde estén. La ventana no tiene selección de
furnis, así que no se puede limitar a una zona: si quieres eso, filtra en la pila que recibe la
colisión con la condición
[Causante está Sobre el Furni](/condiciones/causante-sobre-furni/).

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/colision-de-equipo.png" alt="Ventana de configuración de Colisión de Equipo" class="ventana-wired" />
<!-- /ventana -->

**Equipo**, a elegir entre rojo, verde, azul y amarillo. Es la única opción de la ventana.

## Ejemplo

Una trampa que echa a los rojos que se metan en la zona prohibida. Como el efecto alcanza a todo el
equipo, el filtro de zona va en la pila que recibe:

```
Pila A:
  Causante: Periodos           [3 s]
  Efecto:   Colisión de Equipo [rojo]

Pila B:
  Causante:  Colisión
  Condición: Causante está Sobre el Furni [las baldosas prohibidas]
  Efecto:    ¡Adiós!                      [la salida]
  Efecto:    Mensaje                      ["Zona prohibida para los rojos" · solo el usuario]
```

## Notas

**No se puede encadenar consigo mismo.** Si la pila que lo contiene la disparó un causante de colisión,
el efecto se ignora. Es la protección que evita que dos pilas de colisión se llamen la una a la otra sin
parar.

**Es una pieza de fontanería, no de escena.** Si lo que quieres es simplemente actuar sobre un equipo,
te sale más barato el selector [Usuarios en Equipo](/selectores/usuarios-en-equipo/) en la misma pila.

---

# Caza

> Hace que el furni persiga al usuario más cercano.
>
> Página: https://wired.hartico.tv/efectos/caza/

Hace que los furnis elegidos **persigan** al usuario más cercano, una baldosa cada vez.

## Cómo funciona

En cada ejecución, el furni mira quién tiene cerca y da un paso hacia él. Es lo que convierte un mueble
en un monstruo.

Lo importante es **a quién considera cerca**: solo mira la cruz cardinal de tres baldosas en cada
dirección —norte, sur, este y oeste—. No ve en diagonal, ni siquiera la casilla diagonal pegada a él.
Si te acercas de esquina, no te caza.

Cuando alcanza a alguien, dispara el causante [Colisión](/causantes/colision/), que es donde se decide
qué pasa al ser atrapado.

**Y cuando no ve a nadie, no se queda quieto: deambula.** Se mueve a una cardinal libre al azar. Eso
es lo que hace que el monstruo parezca vivo aunque la sala esté vacía, pero también significa que
**no se queda donde lo dejaste**: si lo quieres parado hasta que aparezca alguien, tendrás que
encender y apagar la pila con una condición.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/caza.png" alt="Ventana de configuración de Caza" class="ventana-wired" />
<!-- /ventana -->

**Selección de furnis**, uno a uno, por tipo o desde el contexto.

## Ejemplo

Un monstruo que patrulla y atrapa:

```
Pila A:
  Causante: Periodos [1 s]
  Efecto:   Caza     [el monstruo]

Pila B:
  Causante: Colisión
  Efecto:   ¡Adiós!  [la mazmorra]
  Efecto:   Mensaje  ["¡Te ha atrapado!"]
```

## Notas

**El periodo es la dificultad.** Con un segundo, el monstruo es lento y esquivable; con medio segundo
da miedo de verdad. Bajar de ahí carga la sala sin hacerlo mucho más difícil.

**La ceguera diagonal no es un fallo, es el juego.** Los jugadores aprenden a moverse en diagonal para
escapar, y eso es parte de la gracia.

**Se va de su sitio solo.** Como deambula cuando no hay nadie cerca, a la larga acaba lejos de donde
lo pusiste. Si necesitas que vuelva, [A cero](/efectos/a-cero/) con un periódico largo lo devuelve.

---

# Fuga

> Hace que el furni huya del usuario más cercano.
>
> Página: https://wired.hartico.tv/efectos/fuga/

Hace que los furnis elegidos **huyan** del usuario más cercano.

## Cómo funciona

Es el reverso de [Caza](/efectos/caza/) y usa la misma vista: la cruz cardinal de tres baldosas, sin
diagonales. Si detecta a alguien ahí, se aleja.

Tiene una particularidad importante: **mantiene el rumbo**. Una vez que ha empezado a huir en una
dirección, sigue por ahí en lugar de recalcular cada paso. Eso es lo que hace que la huida parezca una
carrera y no un temblor en el sitio.

Cuando se topa con una persona de frente, dispara el causante [Colisión](/causantes/colision/) y para
el movimiento. **Esa es la forma real de "atraparlo"**: no acorralándolo contra una pared, sino
poniéndote en su camino.

Contra un muro no se para: **rebota y sigue avanzando en la misma ejecución**, sin perder turno. Así
que no cuentes con arrinconarlo.

Es la pieza de los juegos de atrapar: la gallina que se escapa, el tesoro que no se deja coger.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/fuga.png" alt="Ventana de configuración de Fuga" class="ventana-wired" />
<!-- /ventana -->

**Selección de furnis**, uno a uno, por tipo o desde el contexto.

## Ejemplo

Atrapar al escurridizo poniéndote en su camino:

```
Pila A:
  Causante: Periodos [1 s]
  Efecto:   Fuga     [el tesoro]

Pila B:
  Causante: Colisión
  Efecto:   Dar puntos [50 · aumentar]
  Efecto:   A cero     [el tesoro]
  Efecto:   Mensaje    ["¡Lo tienes!" · solo el usuario]
```

El tesoro huye de ti mientras lo persigas, así que el juego consiste en cortarle el paso: la Pila B
salta cuando el tesoro se te echa encima de frente. Perseguirlo por detrás no sirve de nada.

## Notas

**Diseña la sala con pasillos.** El furni rebota en los muros y sigue, así que en una sala abierta se
te escapa siempre. Con pasillos estrechos puedes anticiparte y ponerte donde va a salir, que es de lo
que va el juego.

**Chocar con un muro no lo detiene.** Rebota y avanza en el mismo turno, así que arrinconarlo no
funciona. Lo único que lo para es una persona delante, y eso dispara la colisión.

---

# Caza Azul

> Detecta a quien pisa el furni y dispara la colisión, sin mover nada.
>
> Página: https://wired.hartico.tv/efectos/caza-azul/

Detecta si hay alguien **encima** de los furnis elegidos y dispara el causante
[Colisión](/causantes/colision/). El furni no se mueve.

## Cómo funciona

Es la caza sin persecución. Repasa todas las baldosas que ocupa cada furni y, si encuentra a una
persona, lanza la colisión sobre ella.

Sirve como detector de presencia dentro de una pila que ya tiene su propio causante, sin depender del
[Sobre un Furni](/causantes/sobre-furni/). La diferencia práctica es que este comprueba cuando tú se
lo mandas, mientras que el causante salta cuando alguien pisa. Con un periódico detrás, detectas también
a quien ya llevaba un rato ahí quieto.

Solo detecta personas: los bots se ignoran.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/caza-azul.png" alt="Ventana de configuración de Caza Azul" class="ventana-wired" />
<!-- /ventana -->

**Selección de furnis**, uno a uno, por tipo o desde el contexto.

## Ejemplo

Una trampa que se arma cada pocos segundos:

```
Pila A:
  Causante: Periodos  [3 s]
  Efecto:   Caza Azul [las baldosas de la trampa]

Pila B:
  Causante: Colisión
  Efecto:   Mensaje  ["¡Has caído en la trampa!"]
  Efecto:   ¡Adiós!  [el foso]
```

## Notas

**Dispara una vez por furni.** Si hay tres personas encima del mismo furni, la colisión salta para una
de ellas, no para las tres.

**No se puede encadenar consigo mismo.** Si la pila la disparó un causante de colisión, el efecto se
ignora, para que dos pilas no se llamen la una a la otra sin parar.

---

# Caza Amarillo

> Como la Caza Azul, pero detectando también a quien está pegado al furni.
>
> Página: https://wired.hartico.tv/efectos/caza-amarillo/

Igual que [Caza Azul](/efectos/caza-azul/), pero detecta también a quien está en las baldosas
**pegadas** al furni.

## Cómo funciona

Comprueba las baldosas del furni **y las ocho que las rodean**, incluidas las diagonales. Con eso, no
hace falta pisar el furni: basta con acercarse.

Ese anillo de una baldosa es toda la diferencia entre las dos. La azul es una placa de presión; esta es
un sensor de proximidad. Sirve para guardias que notan que te acercas, alarmas perimetrales y zonas
donde no quieres que la gente ni ronde.

Como su hermana, no mueve el furni y solo detecta personas.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/caza-amarillo.png" alt="Ventana de configuración de Caza Amarillo" class="ventana-wired" />
<!-- /ventana -->

**Selección de furnis**, uno a uno, por tipo o desde el contexto.

## Ejemplo

Una alarma que salta si te acercas al tesoro:

```
Pila A:
  Causante: Periodos      [2 s]
  Efecto:   Caza Amarillo [el cofre]

Pila B:
  Causante: Colisión
  Efecto:   Mensaje  ["¡Alarma! Aléjate del cofre"]
  Efecto:   Mutar    [la sirena]
```

## Notas

**El anillo lo hace mucho más sensible de lo que parece.** Un furni de 2×2 con este efecto vigila
dieciséis baldosas. En un pasillo estrecho, eso es todo el pasillo.

**Dispara una vez por furni**, igual que la azul: con varias personas dentro del área, la colisión salta
para una.

---

# Control de Contador

> Inicia, para, pausa, reanuda o reinicia un contador de la sala.
>
> Página: https://wired.hartico.tv/efectos/control-de-contador/

Maneja un contador de la sala: lo inicia, lo para, lo pausa, lo reanuda o lo reinicia.

## Cómo funciona

Los contadores son los relojes visibles de la sala, y por sí solos no hacen nada: hay que arrancarlos.
Este efecto es el mando a distancia.

Con él se monta el temporizador de una partida, la cuenta atrás de un evento y el cronómetro de una
carrera. Y como los estados del contador son visibles, el jugador ve el tiempo correr sin que haya que
contárselo.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/control-de-contador.png" alt="Ventana de configuración de Control de Contador" class="ventana-wired" />
<!-- /ventana -->

**Selección de furnis**, el reloj que se va a manejar. Este efecto es el único que acepta **las dos
familias**: los **Contador Wired** y los **temporizadores de partida** (Contador Banzai, Contador
Freeze, los Contador moderno y los Temporizador de juego).

**Opciones**, con cinco modos:

| Modo | Qué hace |
| --- | --- |
| **Iniciar** | Lo pone a cero **y** lo arranca |
| **Parar** | Lo detiene y deja el valor donde está |
| **Reiniciar** | Lo pone a cero **sin** arrancarlo |
| **Pausar** | Lo detiene y deja el valor donde está |
| **Reanudar** | Sigue desde donde estaba, si le queda algo |

## Ejemplo

Una partida con cuenta atrás:

```
Pila A:
  Causante: Click en Furni      [el botón de empezar]
  Efecto:   Control de Contador [el temporizador · iniciar]
  Efecto:   Mensaje             ["¡Empieza la partida!"]
```

No hace falta reiniciar antes: **Iniciar ya pone el reloj a cero** y lo arranca. Y como el orden entre
los efectos de una misma pila se sortea, poner los dos sería además jugársela a que salgan al revés.

## Y con un temporizador de partida, dispara causantes

Cuando lo que manejas es un temporizador de partida, este efecto hace exactamente lo mismo que un dedo
pulsándolo, incluidos los causantes que salta:

| Lo que pides | Qué causante dispara |
| --- | --- |
| **Iniciar** | [Comienza el juego](/causantes/empieza-el-juego/) |
| **Parar** | [Acaba el juego](/causantes/termina-el-juego/) |
| **Reiniciar** | [Acaba el juego](/causantes/termina-el-juego/) |
| **Pausar** | Ninguno |
| **Reanudar** | Ninguno |

Por eso este es el efecto con el que se arranca y se termina una partida: **no existe ningún efecto de
"empezar juego"**. Y por eso hay que tener cuidado con Reiniciar, que además de poner el reloj a cero
cierra la partida en curso.

## Notas

**Parar y Pausar hacen lo mismo en un Contador Wired**: los dos lo detienen y le dejan el valor. La
diferencia está en los temporizadores de partida, donde Parar cierra la partida y Pausar no. Para una
pausa de verdad, usa Pausar y Reanudar en pareja.

**Reanudar no arranca un reloj agotado.** Si el valor está a cero no hace nada; ahí lo que quieres es
Iniciar.

**No pongas Reiniciar antes de Iniciar.** Iniciar ya deja el reloj a cero, y como el orden entre los
efectos de una pila es aleatorio, podrías acabar reiniciando justo después de arrancar. Con un
temporizador de partida es peor todavía: Reiniciar dispara "Acaba el juego".

---

# Ajustar reloj

> Suma, resta o fija los minutos de un contador.
>
> Página: https://wired.hartico.tv/efectos/ajustar-reloj/

Cambia el tiempo que marca un contador: le suma minutos, se los quita o le fija un valor.

## Cómo funciona

Mientras [Control de Contador](/efectos/control-de-contador/) maneja el reloj —arrancarlo, pararlo—,
este cambia **lo que marca**. Es lo que permite que el tiempo sea parte del juego y no solo su límite.

Con él se montan las recompensas de tiempo extra, las penalizaciones que te quitan minutos y los
eventos donde el reloj se ajusta según lo que hagan los jugadores.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/ajustar-reloj.png" alt="Ventana de configuración de Ajustar reloj" class="ventana-wired" />
<!-- /ventana -->

**Selección de furnis**, el contador que se va a ajustar. Solo acepta **Contador Wired Pequeño** y
**Contador reloj de arena**; a un temporizador de partida no le puedes tocar el tiempo con esto.

**Opciones**, con tres modos:

- **Aumentar** – suma el tiempo indicado.
- **Disminuir** – lo resta.
- **Establecer valor** – fija el contador a esa cantidad exacta.

**Minutos**, entre **0 y 99**, y **Segundos**, entre **0 y 119**. Son dos deslizadores distintos y el
ajuste es la suma de los dos, así que para quitar solo veinte segundos deja los minutos a cero.

## Ejemplo

Un premio que da tiempo extra:

```
Pila A:
  Causante: Click en Furni [el reloj de arena]
  Efecto:   Ajustar reloj  [el contador · aumentar · 2 minutos]
  Efecto:   Mensaje        ["¡Dos minutos más!"]
  Efecto:   Mutar          [el reloj de arena]
```

## Notas

**"Establecer valor" es el que quieres para preparar una partida**, porque deja el reloj en un número
conocido pase lo que pase antes. Aumentar y disminuir dependen de dónde estuviera.

**Los ajustes se ven al instante en el contador.** Aprovéchalo: un tiempo extra que el jugador ve
aparecer en el reloj se entiende sin necesidad de mensaje.

---

# Reset

> Pone a cero el temporizador interno de la sala.
>
> Página: https://wired.hartico.tv/efectos/reset/

Pone a cero el **temporizador interno de la sala**: el reloj que llevan por dentro los wireds, no un
contador que se vea.

## Cómo funciona

La sala lleva su propio reloj interno. De él salen dos cosas: el causante
[¡Ya!](/causantes/ya/), que se dispara cuando ese reloj llega a la marca que le
pusiste, y la referencia de tiempo que usan las condiciones que miden cuánto lleva pasando algo.

Este efecto lo devuelve a cero. Con eso puedes reiniciar la cuenta a mitad de camino: cada vez que
alguien hace lo que toca, el reloj vuelve a empezar y el aviso de inactividad no llega nunca.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/reset.png" alt="Ventana de configuración de Reset" class="ventana-wired" />
<!-- /ventana -->

Sin opciones.

## Ejemplo

Un aviso que solo salta si la sala lleva un rato parada:

```
Pila A:
  Causante: Clave [cualquier cosa]
  Efecto:   Reset

Pila B:
  Causante: ¡Ya!    [5 min]
  Efecto:   Mensaje ["¿Hay alguien ahí?"]
```

Mientras alguien hable, el reset devuelve el reloj a cero y el aviso no llega. En cuanto la sala se
queda callada cinco minutos, salta.

## Notas

**No confundir con [A cero](/efectos/a-cero/).** Aquel devuelve los furnis a su sitio; este solo toca el
reloj interno y no mueve nada.

**Afecta a toda la sala.** Si tienes varios temporizadores montados, el reset los reinicia todos a la
vez; no se puede poner a cero uno solo.

---

# Dar variable

> Crea una variable y le pone un valor inicial.
>
> Página: https://wired.hartico.tv/efectos/dar-variable/

Le da valor a una variable que ya exista, para quien tú digas.

## Cómo funciona

Es la puerta de entrada al sistema de variables, pero **no crea nada**: la variable tiene que estar ya
declarada con su [caja](/variables/variable-de-usuario/), puesta en la sala. Lo que hace este efecto
es dársela a alguien
—o a algo— con un valor de partida.

Si la variable no existe, el efecto **no hace absolutamente nada y no avisa**. Es la causa número uno
de que una pila de variables parezca rota: falta la caja.

Lo que decide para qué sirve es **a quién se le da**. La misma variable puede vivir en una persona
—y entonces cada jugador tiene la suya—, en un furni, o en el contexto de la sala, compartida por
todos. De esa elección depende que estés montando un inventario personal o un marcador común.

La casilla de sobrescritura es la que separa dos comportamientos muy distintos: sin ella, quien ya
tenga la variable conserva su valor y el efecto no hace nada; con ella, se la reinicias a todo el
mundo.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/dar-variable.png" alt="Ventana de configuración de Dar variable" class="ventana-wired" />
<!-- /ventana -->

**Selección de furnis**, cuando la variable va a vivir en un furni.

**Escoge una variable**, el nombre de la variable a crear.

**Valor inicial**, lo que va a valer al crearse.

**Escoge el objetivo de la variable**, de dónde cuelga:

| Objetivo | La variable vive en |
| --- | --- |
| **Usuario desencadenante** | Quien disparó la pila |
| **Usuario del Selector** | Cada persona que haya elegido el selector |
| **Usuario de la señal** | Cada persona que traiga la señal |
| **Usuario clicado** | La persona sobre la que se hizo clic |
| **El usuario alcanzado** | La persona a la que llegó un bot |
| **Furni desencadenante** | El furni que disparó la pila |
| **Furni del Selector** | Cada furni del selector |
| **Furni de la Señal** | Cada furni que traiga la señal |
| **Variables de Contexto** | La sala, compartida por todos |

**Sobrescribir la variable existente**, una casilla que decide si se pisa el valor de quien ya la
tenía.

## Ejemplo

Marcar a quien entra por primera vez:

```
Pila A:
  Causante:  Entrada
  Condición: Contiene variable (Negativo) [ya_vino]
  Efecto:    Mensaje                      ["¡Bienvenido por primera vez!"]
  Efecto:    Dar variable                 [ya_vino = 1 · usuario desencadenante · sin sobrescribir]
```

## Notas

**Sin sobrescritura, es seguro repetirlo.** Puedes poner este efecto en una pila que se ejecute mil
veces: quien ya tenga la variable la conserva. Es la forma correcta de garantizar que existe antes de
usarla.

**Elige bien el objetivo desde el principio.** Cambiarlo después no mueve las variables ya creadas:
te quedas con dos juegos de datos y una pila que parece funcionar a medias.

---

# Eliminar variable

> Borra una variable, dejándola en "no existe".
>
> Página: https://wired.hartico.tv/efectos/eliminar-variable/

Borra una variable. No la pone a cero: la deja en **no existe**, que es un estado distinto.

## Cómo funciona

Esa distinción es todo el sentido de este efecto. Una variable que vale cero existe; una borrada, no.
Y hay una condición que sabe distinguirlas:
[Contiene variable](/condiciones/contiene-variable/) y su versión negativa.

Con eso se monta lo que hay que poder repetir desde cero: quitar la marca de "ya ha jugado" para que
alguien pueda volver a intentarlo, limpiar los datos de una partida al terminar, retirar un permiso.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/eliminar-variable.png" alt="Ventana de configuración de Eliminar variable" class="ventana-wired" />
<!-- /ventana -->

**Selección de furnis**, cuando la variable vive en un furni.

**Elegir variable**, cuál se borra.

**Escoge el objetivo de la variable**, de dónde se borra: las mismas opciones que en
[Dar variable](/efectos/dar-variable/) — usuario desencadenante, del selector, de la señal, clicado,
alcanzado, furni desencadenante, del selector, de la señal, o variables de contexto.

## Ejemplo

Un botón que permite volver a jugar:

```
Pila A:
  Causante: Click en Furni    [el botón de reintentar]
  Efecto:   Eliminar variable [ya_jugo · usuario desencadenante]
  Efecto:   Mensaje           ["Puedes volver a intentarlo" · solo el usuario]
```

## Notas

**Borrar no es poner a cero.** Si tu pila comprueba el valor con
[Valor de variable](/condiciones/valor-de-variable/) y la variable no existe, no estás comparando
contra cero: no estás comparando contra nada. Para reiniciar un marcador, asígnale cero con
[Cambiar valor de variable](/efectos/cambiar-valor-de-variable/) en lugar de borrarlo.

**Al limpiar al final de una partida**, acuérdate de que cada persona tiene su copia si la variable es
de usuario: hace falta un selector para llegar a todas.

---

# Cambiar valor de variable

> Opera sobre una variable — asignar, sumar, restar, comparar y mucho más.
>
> Página: https://wired.hartico.tv/efectos/cambiar-valor-de-variable/

Cambia lo que vale una variable, con una lista larga de operaciones.

## Cómo funciona

Es la calculadora del sistema. Con [Dar variable](/efectos/dar-variable/) creas el dato y con este lo
haces evolucionar: marcadores que suben, vidas que bajan, valores aleatorios, topes que no se pueden
pasar.

Lo que lo hace realmente potente es poder operar **contra otra variable** en lugar de contra un número
escrito a mano. Eso permite comparar jugadores entre sí, acumular el marcador de uno en el de su equipo
y montar cualquier cuenta que dependa de algo que cambia.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/cambiar-valor-de-variable.png" alt="Ventana de configuración de Cambiar valor de variable" class="ventana-wired" />
<!-- /ventana -->

**Selección de furnis**, cuando la variable vive en un furni.

**Variable a cambiar** y **Escoge el objetivo de la variable**: cuál se toca y de quién es. Las
opciones de objetivo son las mismas que en [Dar variable](/efectos/dar-variable/), más las **variables
globales** del hotel.

**Operación**, con esta lista:

| Grupo | Operaciones |
| --- | --- |
| **Básicas** | Asignar, Suma, Resta, Multiplicación, Dividir, Módulo, Potencia |
| **Ajuste** | Valor absoluto, Definir mínimo, Definir máximo |
| **Azar** | Aleatorio con límite superior |
| **Bits** | Bitwise AND, OR, XOR, NOT, Desplazamiento a la izquierda, Desplazamiento a la derecha |
| **Bit suelto** | Set Bit, Clear Bit, Toggle Bit, Get Bit, Bit count |
| **Búsqueda de bits** | Next High Bit, Next Low Bit, Previous High Bit, Previous Low Bit |

**Ajustar valor**, el número contra el que se opera.

**Usar otra variable como referencia** y **Variable de referencia**: en lugar del número, se opera
contra el valor de otra variable, con su propio objetivo.

## Ejemplo

Un marcador personal con tope:

```
Pila A:
  Causante: Sobre un Furni            [la baldosa de premio]
  Efecto:   Cambiar valor de variable [puntos · Suma · 10]
  Efecto:   Cambiar valor de variable [puntos · Definir máximo · 100]
```

El segundo efecto es el tope: pase lo que pase, la variable no sube de cien.

## Notas

**"Definir mínimo" y "Definir máximo" son topes, no asignaciones.** Dejan el valor donde está si ya
cumple, y lo recortan si se ha pasado. Es la forma limpia de acotar un marcador sin condiciones.

**Las operaciones de bits son para casos avanzados.** Sirven para guardar muchos sí/no en una sola
variable —los niveles desbloqueados, las piezas conseguidas— y ahorrarse veinte variables. Si no
necesitas eso, no las mires.

**Dividir entre cero no revienta la sala**, pero tampoco hace lo que esperas. Si el divisor sale de otra
variable, comprueba antes que no valga cero.

---

# Ejecuta Pilas

> Ejecuta otras pilas de la sala como si fueran parte de esta.
>
> Página: https://wired.hartico.tv/efectos/ejecuta-pilas/

Ejecuta las pilas que hay en los furnis que elijas, como si fueran una continuación de la actual.

## Cómo funciona

Es la forma de reutilizar trabajo. Si tienes una secuencia que se usa desde cinco sitios distintos
—arrancar la partida, repartir premios, limpiar el tablero—, la montas una sola vez en su baldosa y
todas las demás la llaman.

La ventaja frente a copiar la pila cinco veces es evidente el día que hay que cambiarla: se toca en un
sitio.

A diferencia de las [señales](/conceptos/senales/), aquí no se anuncia nada: se ejecutan exactamente
las pilas de los furnis que hayas seleccionado, y ningún otro.

**La pila llamada no comprueba sus condiciones.** El sistema evalúa sus selectores y sus complementos,
pero se salta las condiciones y va derecho a los efectos. Es la trampa más cara de esta pieza: si
pones una condición en la pila llamada creyendo que la protege, no protege nada. Las condiciones
tienen que estar en la pila que llama.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/ejecuta-pilas.png" alt="Ventana de configuración de Ejecuta Pilas" class="ventana-wired" />
<!-- /ventana -->

**Selección de furnis**, uno a uno, por tipo o desde el contexto: los furnis cuyas pilas se van a
ejecutar.

## Ejemplo

Una rutina de inicio compartida:

```
Pila A (sin causante):
  Efecto: A cero              [el tablero]
  Efecto: Control de Contador [el temporizador · iniciar]
  Efecto: Mensaje             ["¡Nueva partida!"]

Pila B:
  Causante: Click en Furni [el botón]
  Efecto:   Ejecuta Pilas  [la pila A]
```

**La pila llamada no necesita causante.** Es la clave de este efecto: una pila con solo condiciones
y efectos no se ejecuta nunca por su cuenta, y es exactamente lo que quieres para una rutina que solo
debe correr cuando alguien la llama.

## Notas

**Se ejecuta al final de la pila.** Como todos los efectos que llaman a otras pilas, el sistema lo
coloca en la última tanda, para que lo que hace la pila actual esté terminado antes de que arranque la
siguiente.

**Cuidado con los círculos.** Si A llama a B y B llama a A, has montado un bucle. El sistema tiene
topes que lo cortan, pero el precio es una sala con el wired frenado; revisa las llamadas antes de
darlas por buenas.

**No confundir con [Enviar Señal](/efectos/enviar-senal/).** Esto llama a pilas concretas; la señal
avisa a todas las que estén escuchando, las conozcas o no.

---

# Ejecutar pilas Negativo

> Ejecuta otras pilas cuando las condiciones de esta NO se cumplen.
>
> Página: https://wired.hartico.tv/efectos/ejecutar-pilas-negativo/

Como [Ejecuta Pilas](/efectos/ejecuta-pilas/), pero se activa cuando las condiciones de la pila **no**
se cumplen.

## Cómo funciona

Es uno de los tres efectos **negativos** del sistema, y funcionan todos igual: mientras el resto de
efectos esperan a que las condiciones salgan bien, estos esperan justo a lo contrario.

Con eso, una sola baldosa cubre los dos caminos. Sin ellos harían falta dos pilas, una con la condición
y otra con la condición negada, y mantenerlas sincronizadas a mano.

Es especialmente cómodo para el "si no, entonces" de los puzles: la respuesta correcta sigue por los
efectos normales, la incorrecta sale por aquí.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/ejecutar-pilas-negativo.png" alt="Ventana de configuración de Ejecutar pilas Negativo" class="ventana-wired" />
<!-- /ventana -->

**Selección de furnis**, uno a uno, por tipo o desde el contexto: los furnis cuyas pilas se van a
ejecutar cuando falle la condición.

## Ejemplo

Un cofre que reacciona de las dos maneras:

```
Pila A:
  Causante:  Click en Furni          [el cofre]
  Condición: Contiene variable       [tiene_llave]
  Efecto:    Mutar                   [el cofre]
  Efecto:    Mensaje                 ["El cofre se abre" · solo el usuario · Correcto]
  Efecto:    Ejecutar pilas Negativo [la pila B]

Pila B (sin causante):
  Efecto: Mensaje               ["Está cerrado con llave" · solo el usuario · Incorrecto]
  Efecto: Mover y Rotar Usuario [un paso atrás]
```

## Notas

**Solo hay tres efectos negativos**: este,
[Emisor de señales Negativo](/efectos/emisor-de-senales-negativo/) y
[Escribir en Registro Negativo](/efectos/escribir-en-registro-negativo/). Cualquier otra cosa que quieras
hacer en el caso "no se cumple" tiene que ir en la pila llamada, no aquí.

**Convive con los efectos normales en la misma pila.** No estorban entre sí: cada ejecución toma un
camino o el otro, nunca los dos.

---

# Enviar Señal

> Lanza una señal a las pilas que estén escuchando, con furnis y usuarios adjuntos.
>
> Página: https://wired.hartico.tv/efectos/enviar-senal/

Lanza una señal que recogen todas las pilas que tengan un
[Recibir Señal](/causantes/recibir-senal/) escuchando, y les pasa furnis y usuarios.

## Cómo funciona

Es la pieza que permite que una sala grande no sea un plato de espaguetis. En vez de que cada baldosa
sepa a qué otras baldosas tiene que llamar, la que sabe que ha pasado algo lo anuncia, y las
interesadas reaccionan.

Lo verdaderamente potente no es el aviso, sino **lo que viaja con él**. Una señal puede llevar consigo
furnis y personas, y la pila que la recibe puede trabajar sobre ellos como si los hubiera seleccionado
ella misma. Así se pasa el contexto de una pila a otra.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/enviar-senal.png" alt="Ventana de configuración de Enviar Señal" class="ventana-wired" />
<!-- /ventana -->

**Opciones señal**, dos casillas que cambian cuántas veces se emite:

- **Enviar señal para cada furni** – una señal por cada furni adjunto, en vez de una sola con todos.
- **Enviar señal para cada usuario** – una señal por cada persona.

**Antenas**, la selección de furnis que marca por dónde sale la señal.

**Furnis para avanzar**, qué furnis viajan con la señal:

- **Usar furni desencadenante** – el que disparó esta pila.
- **Usar furnis del Selector** – los que eligió el selector.
- **Usar furnis de Señal** – los que llegaron con la señal que activó esta pila.
- **Usar furnis seleccionados** – una selección propia.

**Usuarios para avanzar**, qué personas viajan con la señal: el usuario desencadenante, los del
selector, los de la señal, el usuario clicado o el usuario alcanzado.

## Ejemplo

Un final de partida que reparte trabajo:

```
Pila A:
  Causante: Contador Alcanza el Tiempo Establecido [el reloj]
  Selector: Usuarios en Área                       [toda la sala]
  Efecto:   Enviar Señal                           [usuarios del selector · una señal por usuario]

Pila B:
  Causante: Recibir Señal
  Efecto:   Dar puntos    [10 · aumentar]
  Efecto:   Mensaje       ["Gracias por jugar" · solo el usuario]
```

Con "una señal por usuario", la pila B se ejecuta una vez por persona y cada una recibe lo
suyo.

## Notas

**Las señales son caras.** Una señal por usuario en una sala llena son veinte ejecuciones de golpe; si
además la pila que recibe tiene efectos sobre muchos furnis, la cuenta se dispara. Mira
[Límites y rendimiento](/conceptos/limites/) antes de montar cadenas largas.

**Se ejecuta al final de la pila**, junto con los demás efectos que llaman a otras pilas.

**Si no llega nada, revisa qué mandas.** El fallo más común no es que la señal no salga, sino que sale
vacía: la pila que recibe no tiene usuarios ni furnis sobre los que trabajar y parece que no ha pasado
nada.

---

# Emisor de señales Negativo

> Lanza una señal cuando las condiciones de la pila NO se cumplen.
>
> Página: https://wired.hartico.tv/efectos/emisor-de-senales-negativo/

Como [Enviar Señal](/efectos/enviar-senal/), pero se activa cuando las condiciones de la pila **no** se
cumplen.

## Cómo funciona

Es el hermano negativo del emisor de señales, y tiene exactamente las mismas opciones. Lo que cambia es
cuándo dispara: en el camino del "no", no en el del "sí".

Su uso más útil es centralizar los fallos. En vez de repetir el mensaje de error en veinte baldosas,
todas emiten la misma señal negativa y una sola pila se encarga de responder — con el mensaje, el
sonido y el castigo que sea.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/emisor-de-senales-negativo.png" alt="Ventana de configuración de Emisor de señales Negativo" class="ventana-wired" />
<!-- /ventana -->

Las mismas que [Enviar Señal](/efectos/enviar-senal/): **antenas**, **furnis para avanzar**,
**usuarios para avanzar** y las dos casillas de **opciones señal** para emitir una señal por furni o por
usuario.

## Ejemplo

Un sistema de puertas con un único mensaje de error:

```
Cada puerta cerrada:
  Causante:  Click en Furni             [la puerta]
  Condición: Usuario Lleva la Placa     [la placa de esa zona]
  Efecto:    ¡Adiós!                    [el interior]
  Efecto:    Emisor de señales Negativo [usuario desencadenante]

Pila A:
  Causante: Recibir Señal
  Efecto:   Mensaje       ["No tienes acceso a esta zona" · solo el usuario]
```

Cambiar el texto del aviso para todo el hotel es tocar una sola baldosa.

## Notas

**Cuidado con mezclar señales positivas y negativas sin distinguirlas.** Todas las pilas que escuchan
reciben todas las señales; si en la misma sala emites por los dos caminos, la pila que recibe no sabe
de cuál viene. Usa antenas distintas o una variable que marque el caso.

---

# Escribir en Registro

> Anota un mensaje en el registro de la sala, para depurar tus pilas.
>
> Página: https://wired.hartico.tv/efectos/escribir-en-registro/

Anota un mensaje en el registro de la sala. No lo ve nadie jugando: es para ti, mientras montas.

## Cómo funciona

Es la herramienta de depuración del sistema. Cuando una pila grande no hace lo que esperas, el problema
casi nunca es dónde crees: repartir mensajes de registro por los puntos clave te dice **qué se ejecutó
de verdad y en qué orden**, que es justo lo que no se ve mirando la sala.

Lo que escribes queda guardado en la sala y se consulta desde la ventana de herramientas de wired.

Los cuatro niveles no cambian lo que se guarda, sino cómo de fácil es encontrarlo después: filtrando
por nivel se separa el ruido de lo importante.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/escribir-en-registro.png" alt="Ventana de configuración de Escribir en Registro" class="ventana-wired" />
<!-- /ventana -->

**Nivel de registro**, con cuatro opciones:

| Nivel | Para |
| --- | --- |
| **DEBUG** | El detalle fino mientras montas |
| **INFO** | Los hitos normales: empezó la partida, alguien ganó |
| **WARN** | Lo que no debería pasar pero no rompe nada |
| **ERROR** | Lo que sí rompe algo |

**Mensaje de registro**, el texto que se anota.

## Ejemplo

Averiguar por qué una pila no llega al final:

```
Pila A:
  Causante:  Sobre un Furni       [la baldosa]
  Efecto:    Escribir en Registro [DEBUG · "entró en la pila"]
  Condición: Contiene variable    [tiene_llave]
  Efecto:    Escribir en Registro [DEBUG · "pasó la condición"]
  Efecto:    Mutar                [la puerta]
```

Si en el registro aparece la primera línea y no la segunda, ya sabes que el problema es la condición y
no el causante.

## Notas

**Quita los registros cuando termines.** Cada anotación cuesta, y una pila de depuración que se queda
puesta en una sala llena escribe cientos de líneas por minuto.

**El registro tiene tope.** La sala guarda las últimas anotaciones, no todas: si escribes sin parar,
las viejas se pierden antes de que puedas leerlas.

---

# Escribir en Registro Negativo

> Anota en el registro cuando las condiciones de la pila NO se cumplen.
>
> Página: https://wired.hartico.tv/efectos/escribir-en-registro-negativo/

Como [Escribir en Registro](/efectos/escribir-en-registro/), pero anota cuando las condiciones de la
pila **no** se cumplen.

## Cómo funciona

Es el que resuelve la pregunta que se hace todo el que monta wireds: *¿esta pila no se ejecuta, o se
ejecuta y falla la condición?* Son dos problemas completamente distintos —uno es del causante, el otro
de la condición— y desde fuera se ven igual.

Poniendo un registro normal y uno negativo en la misma pila, la respuesta es inmediata: si no
aparece ninguna línea, no llegó a entrar; si aparece la negativa, entró y falló la condición.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/escribir-en-registro-negativo.png" alt="Ventana de configuración de Escribir en Registro Negativo" class="ventana-wired" />
<!-- /ventana -->

Las mismas que su gemela: **nivel de registro** (DEBUG, INFO, WARN, ERROR) y **mensaje de registro**.

## Ejemplo

El diagnóstico de los dos caminos:

```
Pila A:
  Causante:  Sobre un Furni                [la baldosa]
  Condición: Contiene variable             [tiene_llave]
  Efecto:    Escribir en Registro          [DEBUG · "condición cumplida"]
  Efecto:    Escribir en Registro Negativo [WARN · "condición fallida"]
  Efecto:    Mutar                         [la puerta]
```

## Notas

**Ponlo en WARN, no en DEBUG.** El camino del fallo es justo lo que quieres poder filtrar sin tener que
leer todo lo demás.

**Es la forma más barata de depurar una condición.** Antes de desmontar la pila entera, mete este efecto
y mira el registro: la mayoría de las veces la respuesta aparece a la primera.

---

# Wired Eventos

> Otorga victorias del sistema de eventos del hotel.
>
> Página: https://wired.hartico.tv/efectos/wired-eventos/

Otorga **victorias** del sistema de eventos del hotel a quien corresponda.

## Cómo funciona

Es el puente entre tu sala y el sistema de eventos del hotel: lo que reparte este efecto no se queda en
la sala, cuenta en el historial del jugador.

Por eso el evento no se escribe a mano, sino que se elige de las listas que trae el hotel: primero la
categoría, después la familia dentro de ella y por último el evento concreto.

La frecuencia es la parte importante. Con **Once**, cada persona solo puede ganar una vez ese evento por
mucho que repita; con **Everytime**, gana cada vez que se cumpla. La primera es la de las competiciones
de verdad; la segunda, la de las actividades que se pueden repetir.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/wired-eventos.png" alt="Ventana de configuración de Wired Eventos" class="ventana-wired" />
<!-- /ventana -->

**Categoría**, **Familia** y **Evento**, las tres listas encadenadas que identifican el evento.

**Wins a otorgar**, cuántas victorias se entregan.

**Frecuencia de Recompensa**, con dos opciones:

- **Once** – una sola vez por persona.
- **Everytime** – cada vez que se cumpla.

## Ejemplo

Premiar al ganador de una carrera:

```
Pila A:
  Causante:  Sobre un Furni               [la línea de meta]
  Condición: Contiene variable (Negativo) [ya_gano]
  Efecto:    Wired Eventos                [carrera semanal · 1 win · Once]
  Efecto:    Dar variable                 [ya_gano]
  Efecto:    Mensaje                      ["¡Has ganado la carrera!"]
```

## Notas

**Comprueba las tres listas antes de guardar.** Si el evento no está bien elegido, el efecto no falla de
forma visible: simplemente no otorga nada.

**"Once" es del hotel, no de la sala.** Quien ya haya ganado ese evento en otra parte no vuelve a
ganarlo aquí, aunque tu sala sea nueva.

---

# Selectores

> Los 24 selectores disponibles, agrupados por lo que reúnen.
>
> Página: https://wired.hartico.tv/selectores/

Un **selector** decide **sobre qué** actúa la pila. Sin ninguno, los efectos trabajan con lo que traiga
el causante: quien pisó la baldosa, el furni al que se hizo clic. Con selectores, trabajan con lo que
tú reúnas — cincuenta furnis, media sala, los del equipo rojo.

Son lo que separa una pila que reacciona de una pila que gobierna la sala entera.

## Cómo se combinan

Puedes poner varios en la misma baldosa. Cada uno reúne lo suyo y, **por defecto, se suman**: el
resultado es todo lo que hayan encontrado entre todos.

Eso se cambia con las dos casillas que llevan **todos** los selectores, bajo "Opciones de selector":

| Casilla | Qué hace |
| --- | --- |
| **Filtrar la selección existente** | En vez de sumar, **recorta**: deja solo lo que ya estaba y además cumple este selector |
| **Invertir** | Se queda con todo lo de la sala que este selector **no** encontró |

La casilla de filtrar es la más importante de toda la familia y la que más se olvida. Es la diferencia
entre "los habbos **y** los de la zona" y "los habbos **que están en** la zona".

En las ventanas de vecinos las dos casillas se llaman "Filtrar la selección existente" e "Invertir",
sin más; hacen exactamente lo mismo.

## El orden no lo pones tú

Da igual en qué orden coloques los selectores en la baldosa: el sistema los evalúa siempre en tres
tandas.

1. **Los que reúnen**, primero.
2. **Los que filtran** —los que llevan marcada la casilla de filtrar—, después.
3. **Los que recortan cantidad** —[Filtrar a X](/selectores/filtrar-a-x-usuarios/) y los de variable
   más alta o baja—, al final.

Dentro de cada tanda, el orden es aleatorio. Por eso no puedes encadenar dos filtros contando con que
uno vaya antes que el otro: si necesitas ese control, parte la pila en dos y encadénalas con
[Enviar Señal](/efectos/enviar-senal/).

## Furnis

| Selector | Reúne |
| --- | --- |
| [Furnis Seleccionados](/selectores/furnis-seleccionados/) | Los que señales a mano |
| [Furnis por Tipo](/selectores/furnis-por-tipo/) | Todos los del mismo modelo |
| [Furnis en área](/selectores/furnis-en-area/) | Los que hay en una zona que dibujas |
| [Furnis sobre Furni](/selectores/furnis-sobre-furni/) | Lo apilado encima, debajo o a la misma altura |
| [Furnis por Altitud](/selectores/furnis-por-altitud/) | Los que estén a cierta altura |
| [Furnis Vecinos](/selectores/furnis-vecinos/) | Los de las casillas que dibujes alrededor de un punto |
| [Furnis desde Señal](/selectores/furnis-desde-senal/) | Los que llegaron con la señal |
| [Furnis con variable](/selectores/furnis-con-variable/) | Los que cumplan una comparación de variable |

## Usuarios

| Selector | Reúne |
| --- | --- |
| [Usuarios en Área](/selectores/usuarios-en-area/) | A los que hay en una zona que dibujas |
| [Usuarios sobre Furni](/selectores/usuarios-sobre-furni/) | A los que están encima de un furni |
| [Usuarios por Tipo](/selectores/usuarios-por-tipo/) | Solo habbos, solo mascotas o solo bots |
| [Usuarios por Nombre](/selectores/usuarios-por-nombre/) | A los que nombres |
| [Usuarios en Equipo](/selectores/usuarios-en-equipo/) | A los de un equipo, o de cualquiera |
| [Usuarios en Grupo](/selectores/usuarios-en-grupo/) | A los miembros de un grupo |
| [Usuarios por Acción](/selectores/usuarios-por-accion/) | A quien esté bailando, sentado o haciendo un gesto |
| [Usuarios con Objeto de Mano](/selectores/usuarios-con-objeto-de-mano/) | A quien lleve algo en la mano |
| [Usuarios Vecinos](/selectores/usuarios-vecinos/) | A los de las casillas que dibujes alrededor de un punto |
| [Usuarios desde Señal](/selectores/usuarios-desde-senal/) | A los que llegaron con la señal |
| [Usuarios con variable](/selectores/usuarios-con-variable/) | A los que cumplan una comparación de variable |

## Reutilizar y recortar

| Selector | Qué hace |
| --- | --- |
| [Selección Remota](/selectores/seleccion-remota/) | Hereda la selección de otras pilas |
| [Filtrar a X Furnis](/selectores/filtrar-a-x-furnis/) | Deja la selección en N furnis |
| [Filtrar a X Usuarios](/selectores/filtrar-a-x-usuarios/) | Deja la selección en N personas |
| [Furni con variable más alta o baja](/selectores/furni-con-variable-mas-alta/) | Se queda con el furni que va ganando |
| [Usuario con variable más alta o baja](/selectores/usuario-con-variable-mas-alta/) | Se queda con la persona que va ganando |

Las cuatro últimas aparecen en el catálogo como **Filtro WIRED** y **Wired extra**, no como selectores,
pero se colocan en la baldosa igual que los demás y actúan sobre la misma selección.

## Lo que cuestan

Los selectores son la pieza más cara del sistema, y no por lo que hacen ellos sino por lo que
provocan: **cada efecto de la pila se ejecuta una vez por cada cosa seleccionada**. Un selector que
reúne cincuenta furnis convierte un efecto en cincuenta.

Dos reglas que ahorran la mayoría de los sustos: recorta con la casilla de filtrar en vez de reunir de
más, y no pongas efectos caros —señales, llamadas a otras pilas— detrás de una selección grande.
Está contado en [Límites y rendimiento](/conceptos/limites/).

---

# Furnis Seleccionados

> Mete en la selección los furnis que elijas a mano.
>
> Página: https://wired.hartico.tv/selectores/furnis-seleccionados/

Mete en la selección los furnis que elijas a mano, uno a uno.

## Cómo funciona

Es el selector más sencillo y el que más se usa: no busca nada, simplemente pone en la selección lo
que tú le señales.

Su motivo de existir no es esquivar ningún tope: la caja de furnis de este selector tiene el mismo
límite que la de cualquier otro wired. Lo que aporta es **separar el "sobre qué" del "qué hacer"**:
reúnes aquí los furnis una vez y todos los efectos de la pila trabajan sobre ellos, sin tener que
repetir la selección en cada uno.

Y sobre todo, se puede combinar. Súmale un [Furnis por Tipo](/selectores/furnis-por-tipo/) o un
[Furnis en área](/selectores/furnis-en-area/) y llegas a conjuntos que a mano no cabrían.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/furnis-seleccionados.png" alt="Ventana de configuración de Furnis Seleccionados" class="ventana-wired" />
<!-- /ventana -->

**Selección de furnis**, uno a uno o por tipo.

**Opciones de selector**, las dos casillas comunes a toda la familia: **filtrar la selección
existente** e **invertir**.

## Ejemplo

Apagar veinte luces a la vez:

```
Pila A:
  Causante: Click en Furni       [el interruptor]
  Selector: Furnis Seleccionados [las veinte luces]
  Efecto:   Mutar
```

## Notas

**Invertido, es "todo menos esto".** Marcando la casilla de invertir, la selección pasa a ser todos los
furnis de la sala **excepto** los que señalaste. Es la forma corta de decir "todo lo demás".

---

# Furnis por Tipo

> Selecciona todos los furnis del mismo tipo que el que señales.
>
> Página: https://wired.hartico.tv/selectores/furnis-por-tipo/

Selecciona **todos los furnis de la sala del mismo tipo** que el que señales.

## Cómo funciona

Señalas un furni y el selector recoge a todos sus hermanos. No hay que enumerarlos: si mañana pones
diez baldosas más de ese mismo modelo, entran solas.

Eso es lo que lo hace la pieza de las salas que crecen. Una pila montada con este selector sigue
funcionando después de redecorar.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/furnis-por-tipo.png" alt="Ventana de configuración de Furnis por Tipo" class="ventana-wired" />
<!-- /ventana -->

**Selección de furnis**, para señalar el tipo.

**Solo selecciona furnis si el estado coincide**, una casilla que además exige que estén en el mismo
estado que el señalado: así distingues las luces encendidas de las apagadas dentro del mismo modelo.

**Opciones de selector**: **filtrar la selección existente** e **invertir**.

## Ejemplo

Apagar todas las luces de la sala, sean las que sean:

```
Pila A:
  Causante: Periodos Largos [60 s]
  Selector: Furnis por Tipo [una lámpara · solo si el estado coincide]
  Efecto:   Mutar
```

Con la casilla del estado puesta, solo entran las encendidas, así que el mutar no vuelve a encender
las que ya estaban apagadas.

## Notas

**Cuidado con los tipos muy comunes.** Si señalas una baldosa de suelo de las que hay ciento veinte en
la sala, el efecto que venga detrás se ejecuta ciento veinte veces. Mira
[Límites y rendimiento](/conceptos/limites/) antes de hacerlo con un efecto caro.

---

# Furnis en área

> Selecciona los furnis que hay dentro de una zona que dibujas.
>
> Página: https://wired.hartico.tv/selectores/furnis-en-area/

Selecciona todos los furnis que hay dentro de una zona que dibujas sobre el suelo de la sala.

## Cómo funciona

La zona se marca en la propia sala: pulsas **Seleccionar** y arrastras sobre las baldosas para
delimitar el rectángulo.

Al ser una zona y no una lista, funciona con lo que haya ahí en cada momento. Un furni que alguien mueva
dentro entra en la selección; uno que se saque, deja de estar.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/furnis-en-area.png" alt="Ventana de configuración de Furnis en área" class="ventana-wired" />
<!-- /ventana -->

**Selección de zona**, con los botones **Seleccionar** —para dibujarla— y **Borrar** —para empezar de
nuevo—.

**Opciones de selector**: **filtrar la selección existente** e **invertir**.

## Ejemplo

Devolver a su sitio todo lo que quede en la pista al acabar la ronda:

```
Pila A:
  Causante: Acaba el juego
  Selector: Furnis en área [la pista]
  Efecto:   A cero
```

## Notas

**La zona es un rectángulo**, no una forma libre. Para áreas raras, usa varios selectores de área
seguidos: se suman.

**Combina bien con el filtro.** Un "Furnis por Tipo" y detrás un "Furnis en área" con la casilla de
filtrar da exactamente "las lámparas que están en esta zona".

---

# Furnis sobre Furni

> Selecciona lo que está apilado encima, debajo o a la misma altura.
>
> Página: https://wired.hartico.tv/selectores/furnis-sobre-furni/

Selecciona los furnis que están **apilados** con relación al que señales.

## Cómo funciona

Trabaja en vertical, sobre la misma baldosa. Es la pieza de los puzles de colocación y de las mesas
que reaccionan a lo que les pongas encima: no necesitas saber qué objeto va a poner el jugador, solo
dónde.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/furnis-sobre-furni.png" alt="Ventana de configuración de Furnis sobre Furni" class="ventana-wired" />
<!-- /ventana -->

**Selección de furnis**, el furni de referencia.

**Opciones**, con cuatro modos:

| Modo | Selecciona |
| --- | --- |
| **Furni sobre Furni** | Lo que está encima |
| **Furni bajo Furni** | Lo que está debajo |
| **Furni a la misma altura** | Lo que comparte altura |
| **Todos los furnis en la baldosa** | Todo lo que ocupa esa casilla |

**Opciones de selector**: **filtrar la selección existente** e **invertir**.

## Ejemplo

Un pedestal que devuelve lo que le pongan encima:

```
Pila A:
  Causante: Estado de los Furnis Cambia [el pedestal]
  Selector: Furnis sobre Furni          [el pedestal · furni sobre furni]
  Efecto:   Mover Furni a Furni         [a la caja de devoluciones]
```

## Notas

**Es la pareja natural de [tiene un Furni encima](/condiciones/furni-encima/).** La condición te dice
que hay algo; este selector te dice **qué** es y te lo pone en la mano.

---

# Furnis por Altitud

> Selecciona los furnis que estén por encima, por debajo o justo a una altura.
>
> Página: https://wired.hartico.tv/selectores/furnis-por-altitud/

Selecciona los furnis según la **altura** a la que estén.

## Cómo funciona

Es el selector de las salas construidas en vertical: torres, plataformas a distintos niveles, edificios
de varios pisos montados con furnis apilados.

Con él se trabaja por plantas sin tener que enumerar qué hay en cada una.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/furnis-por-altitud.png" alt="Ventana de configuración de Furnis por Altitud" class="ventana-wired" />
<!-- /ventana -->

**Seleccionar altitud**, entre **0.00 y 40.00**. Ojo: aquí el tope es la mitad que en la condición
y en el efecto de altitud, que llegan a 80.00.

La casilla enseña el valor con dos decimales, así que lo que escribes es la altura tal cual la
ves en la sala: **1.00** es la altura de un furni de suelo normal.

**Opciones**, con tres comparaciones:

- **Mayor que** – todo lo que esté por encima.
- **Menor que** – todo lo que esté por debajo.
- **Igual a** – solo lo que esté justo a esa altura.

**Opciones de selector**: **filtrar la selección existente** e **invertir**.

## Ejemplo

Bajar de golpe todo lo que se haya quedado flotando:

```
Pila A:
  Causante: Click en Furni           [el botón de mantenimiento]
  Selector: Furnis por Altitud       [mayor que 100]
  Efecto:   Cambiar Altitud de Furni [a 0]
```

## Notas

**El tope aquí es 40.00, la mitad que en el efecto y la condición de altitud**, que llegan a 80.00. Si
trabajas con furnis muy altos, este selector no los alcanza.

**"Igual a" es exigente.** Un furni que esté un pelo por encima no entra. Para trabajar por plantas,
casi siempre quieres "mayor que" y "menor que" combinados con la casilla de filtrar.

---

# Furnis Vecinos

> Selecciona los furnis de las casillas que dibujes alrededor de un punto.
>
> Página: https://wired.hartico.tv/selectores/furnis-vecinos/

Selecciona los furnis que hay en las **casillas vecinas** que tú dibujes alrededor de un punto de
referencia.

## Cómo funciona

Es el selector más flexible de la familia y el que más cuesta entender la primera vez. En vez de una
zona fija de la sala, defines una **forma relativa**: qué casillas alrededor del centro te interesan.
Esa forma viaja con el centro.

Se dibuja en una cuadrícula, con tres herramientas:

- **Añadir** – marca una casilla como parte del vecindario.
- **Quitar** – la desmarca.
- **Origen** – coloca el centro, el punto desde el que se mide todo.

Los campos **x** e **y** de debajo permiten afinar la posición a mano.

Como el centro puede ser una persona, con esta pieza se montan cosas que ningún otro selector puede:
"los furnis que tengo justo delante", "las tres baldosas a mi derecha", "la cruz alrededor de quien ha
pisado".

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/furnis-vecinos.png" alt="Ventana de configuración de Furnis Vecinos" class="ventana-wired" />
<!-- /ventana -->

**Seleccionar las casillas vecinas**, la cuadrícula con las tres herramientas y los campos **x** e
**y**.

**Cerca de**, el centro del vecindario, con dos familias:

- **Un furni** – el desencadenante, los de la señal o los seleccionados.
- **Un usuario** – el desencadenante, los de la señal, el usuario clicado o el usuario alcanzado.

**Opciones del selector**: **filtrar la selección existente** e **invertir**.

## Ejemplo

Encender las baldosas que rodean a quien entra en la pista:

```
Pila A:
  Causante: Sobre un Furni [las baldosas de la pista]
  Selector: Furnis Vecinos [las ocho de alrededor · cerca del usuario desencadenante]
  Efecto:   Mutar
```

## Notas

**Dibuja siempre el origen.** Sin él, el vecindario no sabe desde dónde medirse y no selecciona nada.
Es el fallo número uno con esta pieza.

**Con el centro en un usuario, la forma no gira con él.** Las casillas se miden siempre en la misma
orientación de la sala, no según hacia dónde mire la persona.

---

# Furnis desde Señal

> Recoge los furnis que llegaron con la señal que despertó la pila.
>
> Página: https://wired.hartico.tv/selectores/furnis-desde-senal/

Recoge los furnis que **viajaban con la señal** que despertó esta pila.

## Cómo funciona

Es la otra mitad de [Enviar Señal](/efectos/enviar-senal/). El emisor decide qué furnis manda; este
selector es lo que los pone en la selección de la pila que recibe.

Sin él, la pila receptora sabe que la han llamado pero no sobre qué trabajar. Con él, hereda el
contexto del emisor y puede actuar sobre exactamente los mismos furnis.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/furnis-desde-senal.png" alt="Ventana de configuración de Furnis desde Señal" class="ventana-wired" />
<!-- /ventana -->

Solo las **opciones de selector**: **filtrar la selección existente** e **invertir**.

## Ejemplo

Una pila central que apaga lo que le manden:

```
Pila A:
  Causante: Click en Furni  [el interruptor]
  Selector: Furnis por Tipo [las lámparas]
  Efecto:   Enviar Señal    [furnis del selector]

Pila B:
  Causante: Recibir Señal
  Selector: Furnis desde Señal
  Efecto:   Mutar
```

## Notas

**Si no llega nada, la selección queda vacía** y los efectos no tienen sobre qué actuar. Cuando una
pila receptora "no hace nada", lo primero que hay que mirar es qué manda el emisor, no lo que hace
ella.

---

# Furnis con variable

> Selecciona los furnis cuya variable cumpla la comparación que indiques.
>
> Página: https://wired.hartico.tv/selectores/furnis-con-variable/

Selecciona los furnis según lo que valga una **variable** guardada en ellos.

## Cómo funciona

Cada furni puede llevar sus propias variables. Este selector recorre la sala comparándolas y se queda
con los que cumplen.

Con eso se hacen cosas que de otro modo exigirían una pila por furni: seleccionar los cofres que
todavía no se han abierto, las casillas del tablero que valen más de tres, las piezas que aún están sin
colocar.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/furnis-con-variable.png" alt="Ventana de configuración de Furnis con variable" class="ventana-wired" />
<!-- /ventana -->

**Elegir variable**, cuál se comprueba.

**Seleccionar por valor**, la casilla que enciende la comparación. Sin marcarla, el selector reúne a
todos los que tengan la variable, valga lo que valga. Sale en gris si la variable elegida no guarda
ningún valor.

**Elige tipo**, la comparación: mayor, mayor o igual, igual, menor o igual, menor y distinto.

**Seleccionar por valor**, el valor contra el que se compara, con dos modos: **ajustar valor**, un
número escrito por ti, o **usar variable como referencia**, con su propia **variable de referencia** y
su ámbito.

**Opciones de selector**: **filtrar la selección existente** e **invertir**.

## Ejemplo

Abrir de golpe todos los cofres que aún no se hayan abierto:

```
Pila A:
  Causante: Acaba el juego
  Selector: Furnis con variable [abierto · igual a · 0]
  Efecto:   Mutar
```

## Notas

**Solo mira furnis de suelo.** Los muebles de pared nunca entran en la selección, tengan la variable
o no.

**Los furnis que no tienen la variable no entran.** No existir no es lo mismo que valer cero: si
quieres alcanzarlos, dales la variable primero con
[Dar variable](/efectos/dar-variable/) sin sobrescribir.

---

# Usuarios en Área

> Selecciona a la gente que hay dentro de una zona que dibujas.
>
> Página: https://wired.hartico.tv/selectores/usuarios-en-area/

Selecciona a todas las personas que hay dentro de una zona que dibujas sobre el suelo de la sala.

## Cómo funciona

Es el selector más usado de la familia, y con razón: la mayoría de las pilas que tratan con gente
necesitan primero saber **quién está donde**.

La zona se marca en la propia sala, arrastrando sobre las baldosas. Al ser una zona y no una lista,
funciona con quien haya en cada momento: quien entre, entra; quien salga, deja de estar.

Es también la forma de dar destinatario a una pila con causante periódico, que por sí sola no tiene a
nadie a quien mirar.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/usuarios-en-area.png" alt="Ventana de configuración de Usuarios en Área" class="ventana-wired" />
<!-- /ventana -->

**Selección de zona**, con los botones **Seleccionar** —para dibujarla— y **Borrar** —para empezar de
nuevo—.

**Opciones de selector**: **filtrar la selección existente** e **invertir**.

## Ejemplo

Avisar cada minuto a quien esté en la pista:

```
Pila A:
  Causante: Periodos Largos  [60 s]
  Selector: Usuarios en Área [la pista]
  Efecto:   Mensaje          ["¡A bailar!" · solo el usuario]
```

## Notas

**Para toda la sala, dibuja toda la sala.** No hay una opción de "todos"; se marca el rectángulo
entero.

**Recoge también bots y mascotas.** No distingue: todo lo que esté dentro de la zona entra. Si tu pila
solo debe alcanzar a personas, ponle detrás
[Usuarios por Tipo](/selectores/usuarios-por-tipo/) con **Habbo** y la casilla de filtrar marcada.

**Es el selector que más cuesta**, porque cada efecto detrás se ejecuta una vez por persona. En una
sala llena, eso multiplica por veinte. Mira [Límites y rendimiento](/conceptos/limites/) antes de poner
efectos caros detrás.

---

# Usuarios sobre Furni

> Selecciona a quien esté encima de los furnis que señales.
>
> Página: https://wired.hartico.tv/selectores/usuarios-sobre-furni/

Selecciona a las personas que están **encima** de los furnis que señales.

## Cómo funciona

Es la placa de presión de la familia. Frente a la zona dibujada, aquí la selección la definen los
propios muebles: si mueves la plataforma, la zona se mueve con ella.

Eso lo hace mejor que el área para todo lo que sea móvil: plataformas que patrullan, alfombras que se
desplazan, tableros que se reordenan.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/usuarios-sobre-furni.png" alt="Ventana de configuración de Usuarios sobre Furni" class="ventana-wired" />
<!-- /ventana -->

**Selección de furnis**, uno a uno o por tipo.

**Opciones de selector**: **filtrar la selección existente** e **invertir**.

## Ejemplo

Una plataforma que se lleva consigo a los pasajeros:

```
Pila A:
  Causante: Periodos              [1 s]
  Selector: Usuarios sobre Furni  [la plataforma]
  Efecto:   Mover y Rotar Usuario [hacia el norte]
  Efecto:   Mover                 [la plataforma · hacia el norte]
```

## Notas

**Existe un complemento que hace esto solo.** Si lo único que quieres es que la gente viaje encima de
un furni que se mueve, mira el complemento de transportar usuarios en vez de montarlo a mano.

---

# Usuarios por Tipo

> Selecciona solo habbos, solo mascotas o solo bots.
>
> Página: https://wired.hartico.tv/selectores/usuarios-por-tipo/

Selecciona solo a los de un tipo: **habbos**, **mascotas** o **bots**.

## Cómo funciona

En una sala con bots y mascotas, "usuario" no siempre quiere decir persona. Este selector separa los
tres.

Su uso más habitual no es reunir, sino **filtrar**: se pone detrás de otro selector, con la casilla de
filtrar marcada, para quedarse solo con las personas de lo que ya se había reunido.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/usuarios-por-tipo.png" alt="Ventana de configuración de Usuarios por Tipo" class="ventana-wired" />
<!-- /ventana -->

**Escoge el tipo de usuario**: **Habbo**, **Mascota** o **Bot**.

**Opciones de selector**: **filtrar la selección existente** e **invertir**.

## Ejemplo

Repartir premios solo entre personas, ignorando bots y mascotas:

```
Pila A:
  Causante: Click en Furni    [el botón]
  Selector: Usuarios en Área  [toda la sala]
  Selector: Usuarios por Tipo [Habbo · filtrar la selección existente]
  Efecto:   Dar puntos        [10 · aumentar]
```

## Notas

**Sin la casilla de filtrar, suma en vez de restringir.** Es el error clásico: en el ejemplo de arriba,
sin marcarla, el selector añadiría a **todos** los habbos de la sala a los que ya había, en vez de
recortar.

---

# Usuarios por Nombre

> Selecciona a las personas cuyo nombre escribas.
>
> Página: https://wired.hartico.tv/selectores/usuarios-por-nombre/

Selecciona a las personas cuyo nombre escribas, tal cual.

## Cómo funciona

Es el selector directo: se escriben los nombres y se trabaja con esa gente. Nada de zonas ni de
condiciones.

Su sitio son las salas con papeles fijos: el presentador de un evento, los jueces de un concurso, los
dueños de la sala. Gente que no cambia entre partidas.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/usuarios-por-nombre.png" alt="Ventana de configuración de Usuarios por Nombre" class="ventana-wired" />
<!-- /ventana -->

**Introducir nombres de usuarios**, un nombre **por línea**. Caben **20** como mucho, y la ventana
lleva el contador a la vista.

**Opciones de selector**: **filtrar la selección existente** e **invertir**.

## Ejemplo

Dar un aviso privado solo a los organizadores:

```
Pila A:
  Causante: Contador Alcanza el Tiempo Establecido [el reloj]
  Selector: Usuarios por Nombre                    [los tres organizadores]
  Efecto:   Mensaje                                ["Quedan 5 minutos" · solo el usuario]
```

## Notas

**Los nombres se rompen si alguien se cambia el suyo**, y la pila deja de funcionar sin avisar de
nada. Para papeles que duren, marca a la gente con una variable de usuario o con una placa y usa el
selector de variable.

**Invertido, es "todos menos estos".** La forma corta de excluir al staff de un castigo general.

---

# Usuarios en Equipo

> Selecciona a los jugadores de un equipo, o de cualquiera.
>
> Página: https://wired.hartico.tv/selectores/usuarios-en-equipo/

Selecciona a los jugadores que están apuntados a un equipo.

## Cómo funciona

Es la pieza que hace posibles los juegos por equipos: premiar al equipo ganador, teletransportar a los
rojos a su base, contar cuántos quedan de cada color.

Tiene además una opción que no está en las condiciones equivalentes: **cualquier equipo**, que reúne a
todo el que esté jugando sin importar el color. Es la forma limpia de separar a los jugadores del
público.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/usuarios-en-equipo.png" alt="Ventana de configuración de Usuarios en Equipo" class="ventana-wired" />
<!-- /ventana -->

**Escoge el equipo**: rojo, verde, azul, amarillo o **cualquier equipo**.

**Opciones de selector**: **filtrar la selección existente** e **invertir**.

## Ejemplo

Devolver a su base a todo el equipo rojo:

```
Pila A:
  Causante: Recibir Señal      [señal "ronda nueva"]
  Selector: Usuarios en Equipo [rojo]
  Efecto:   ¡Adiós!            [la base roja]
```

## Notas

**Los equipos aguantan el final de la partida.** No se vacían solos, así que un selector de equipo
puede seguir reuniendo gente mucho después de acabar el juego. Si tu ronda tiene que empezar con todo
el mundo fuera, vacíalos tú con [Abandonar Equipo](/efectos/abandonar-equipo/) y un selector de toda
la sala.

**Con "cualquier equipo" e invertir tienes al público**: todos los que están en la sala sin jugar.

---

# Usuarios en Grupo

> Selecciona a los miembros de un grupo.
>
> Página: https://wired.hartico.tv/selectores/usuarios-en-grupo/

Selecciona a las personas que pertenecen a un grupo.

## Cómo funciona

A diferencia de las placas, la pertenencia a un grupo no depende de llevar nada puesto: o se está o no
se está. Eso lo hace el selector fiable para las salas de comunidad.

Con él se montan zonas de socios, avisos solo para los del grupo y ventajas para los miembros.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/usuarios-en-grupo.png" alt="Ventana de configuración de Usuarios en Grupo" class="ventana-wired" />
<!-- /ventana -->

**Escoge un grupo**, con dos modos:

- **Grupo actual** – el grupo asociado a la sala. El que quieres casi siempre, porque no hay que
  reconfigurar nada si cambias de grupo.
- **Seleccionar de la lista** – un grupo concreto.

**Opciones de selector**: **filtrar la selección existente** e **invertir**.

## Ejemplo

Una ventaja diaria para los miembros:

```
Pila A:
  Causante: Periodos Largos   [10 min]
  Selector: Usuarios en Área  [toda la sala]
  Selector: Usuarios en Grupo [grupo actual · filtrar la selección existente]
  Efecto:   Dar puntos        [5 · aumentar]
```

## Notas

**Si desvinculas la sala del grupo**, "grupo actual" se queda sin grupo y el selector **se desentiende**:
deja la selección tal como estuviera, sin sumar ni quitar a nadie. Ni siquiera la casilla de invertir
hace nada. Es más benigno de lo que parece, pero también más difícil de notar: la pila sigue
funcionando y deja de filtrar.

**No alcanza a bots ni mascotas.** Solo tienen grupo las personas, así que quedan fuera por definición.

---

# Usuarios por Acción

> Selecciona a quien esté bailando, sentado, tumbado o haciendo un gesto.
>
> Página: https://wired.hartico.tv/selectores/usuarios-por-accion/

Selecciona a las personas según lo que estén **haciendo** en ese momento.

## Cómo funciona

Mira el estado actual, no un cambio: reúne a quien esté ahora mismo bailando, sentado, ausente o
haciendo un gesto concreto.

Es la pieza de los juegos de reacción y de las pistas de baile: premiar a quien participa, echar a
quien está quieto, contar cuántos han saludado.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/usuarios-por-accion.png" alt="Ventana de configuración de Usuarios por Acción" class="ventana-wired" />
<!-- /ventana -->

**Acción desencadenante**, con estas opciones:

| Grupo | Opciones |
| --- | --- |
| **Gestos** | Saludar, Lanzar Beso, Risas |
| **Estado** | Confirmado, Despierto, Ausente |
| **Postura** | Sentarse, De pie, Tumbado |
| **Otros** | Señales, Bailar |

Al elegir **Señales** o **Bailar** aparece un segundo bloque para afinar; con el resto de acciones no
sale nada más:

- **Filtrar por señal** y **Señal**, para exigir una señal concreta —incluidas las de fútbol: tarjeta
  amarilla, tarjeta roja y demás—.
- **Filtrar por baile** y **Baile**, para exigir un baile concreto en vez de "cualquiera".

**Opciones de selector**: **filtrar la selección existente** e **invertir**.

## Ejemplo

Premiar a quien esté bailando cuando suena la campana:

```
Pila A:
  Causante: Periodos Largos     [30 s]
  Selector: Usuarios en Área    [la pista]
  Selector: Usuarios por Acción [bailar · filtrar la selección existente]
  Efecto:   Dar puntos          [5 · aumentar]
```

## Notas

**Los gestos duran un suspiro.** Saludar, Lanzar Beso, Risas y Confirmado solo cuentan mientras dura
la animación, que son unos segundos. Un periódico cada diez segundos casi nunca pillará a nadie
saludando: para eso está el causante [Usuario realiza acción](/causantes/usuario-realiza-accion/), que
salta en el momento. Las posturas —sentado, de pie, tumbado— y la ausencia sí son estados que duran, y
ahí este selector va perfecto.

**Es una foto, no un aviso.** Si quieres enterarte del momento en que alguien empieza a bailar, el que
buscas es el causante [Usuario realiza acción](/causantes/usuario-realiza-accion/).

**"Ausente" te da a los que se han ido sin salir.** Es la forma de liberar sitios en una sala llena de
gente parada.

---

# Usuarios con Objeto de Mano

> Selecciona a quien lleve en la mano el objeto que indiques.
>
> Página: https://wired.hartico.tv/selectores/usuarios-con-objeto-de-mano/

Selecciona a las personas que llevan en la mano el objeto indicado.

## Cómo funciona

Como el objeto de mano se ve desde fuera, es una marca perfecta para los juegos: quien lleva la
antorcha, quien tiene la llave, quien va con la bandera.

Su ventaja frente a una variable es justo esa visibilidad: los demás jugadores saben quién es sin que
haya que contárselo.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/usuarios-con-objeto-de-mano.png" alt="Ventana de configuración de Usuarios con Objeto de Mano" class="ventana-wired" />
<!-- /ventana -->

**Objeto de mano**, de la lista disponible.

**Copiar mi objeto de mano**, un botón que selecciona el que llevas tú en ese momento.

**Opciones de selector**: **filtrar la selección existente** e **invertir**.

## Ejemplo

Una puerta que solo se abre para quien lleve la llave:

```
Pila A:
  Causante: Periodos                    [2 s]
  Selector: Usuarios sobre Furni        [el felpudo]
  Selector: Usuarios con Objeto de Mano [la llave · filtrar la selección existente]
  Efecto:   ¡Adiós!                     [el interior]
```

## Notas

**El objeto se pierde al salir de la sala.** Sirve para marcar dentro de una partida, no entre
sesiones.

**Cualquiera puede soltarlo**, así que no es un candado. Para algo que deba resistir, usa una variable
de usuario.

---

# Usuarios Vecinos

> Selecciona a la gente de las casillas que dibujes alrededor de un punto.
>
> Página: https://wired.hartico.tv/selectores/usuarios-vecinos/

Selecciona a las personas que hay en las **casillas vecinas** que tú dibujes alrededor de un punto de
referencia.

## Cómo funciona

Es el gemelo de [Furnis Vecinos](/selectores/furnis-vecinos/) para la gente, y comparte con él lo que
lo hace especial: en vez de una zona fija de la sala, defines una **forma relativa** que viaja con el
centro.

Se dibuja en una cuadrícula, con tres herramientas: **añadir** casilla, **quitar** casilla y **origen**,
que coloca el centro desde el que se mide todo. Los campos **x** e **y** afinan la posición a mano.

Como el centro puede ser una persona, con esta pieza se montan cosas imposibles con los demás
selectores: "quien tengo pegado", "los de la fila de delante", "todo el que esté a dos baldosas de
quien pisó la trampa".

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/usuarios-vecinos.png" alt="Ventana de configuración de Usuarios Vecinos" class="ventana-wired" />
<!-- /ventana -->

**Seleccionar las casillas vecinas**, la cuadrícula con las tres herramientas y los campos **x** e
**y**.

**Cerca de**, el centro del vecindario, con dos familias:

- **Un furni** – el desencadenante, los de la señal o los seleccionados.
- **Un usuario** – el desencadenante, los de la señal, el usuario clicado o el usuario alcanzado.

**Opciones del selector**: **filtrar la selección existente** e **invertir**.

## Ejemplo

Una explosión que alcanza a todo el que esté alrededor:

```
Pila A:
  Causante: Sobre un Furni   [la mina]
  Selector: Usuarios Vecinos [las ocho de alrededor · cerca del usuario desencadenante]
  Efecto:   ¡Adiós!          [la enfermería]
  Efecto:   Mensaje          ["¡Te ha pillado la explosión!" · solo el usuario]
```

## Notas

**Dibuja siempre el origen**, o el vecindario no sabe desde dónde medirse y no selecciona a nadie.

**La forma no gira con la persona.** Las casillas se miden siempre en la orientación de la sala, no
según hacia dónde mire.

**El propio centro entra o no según lo dibujes.** Si no quieres alcanzar a quien pisó la mina, no
marques la casilla del origen.

---

# Usuarios desde Señal

> Recoge a las personas que llegaron con la señal que despertó la pila.
>
> Página: https://wired.hartico.tv/selectores/usuarios-desde-senal/

Recoge a las personas que **viajaban con la señal** que despertó esta pila.

## Cómo funciona

Es la otra mitad de [Enviar Señal](/efectos/enviar-senal/) para la gente. El emisor decide a quién
manda; este selector es lo que los pone en la selección de la pila que recibe.

Es lo que permite repartir el trabajo entre baldosas sin perder de vista de quién se estaba hablando.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/usuarios-desde-senal.png" alt="Ventana de configuración de Usuarios desde Señal" class="ventana-wired" />
<!-- /ventana -->

Solo las **opciones de selector**: **filtrar la selección existente** e **invertir**.

## Ejemplo

Una pila central de premios que sirve a toda la sala:

```
Pila A:
  Causante: Sobre un Furni [la línea de meta]
  Efecto:   Enviar Señal   [usuario desencadenante]

Pila B:
  Causante: Recibir Señal
  Selector: Usuarios desde Señal
  Efecto:   Dar puntos           [100 · aumentar]
  Efecto:   Mensaje              ["¡Enhorabuena!" · solo el usuario]
```

Cambiar el premio de todo el hotel es tocar una sola baldosa.

## Notas

**Si el emisor no manda usuarios, aquí no llega nadie.** Cuando una pila receptora no hace nada,
revisa primero qué tiene marcado el emisor en "usuarios para avanzar".

---

# Usuarios con variable

> Selecciona a las personas cuya variable cumpla la comparación que indiques.
>
> Página: https://wired.hartico.tv/selectores/usuarios-con-variable/

Selecciona a las personas según lo que valga una **variable** suya.

## Cómo funciona

Es el selector más potente de la familia para las salas con progreso. Como cada jugador puede llevar
sus propias variables, esta pieza permite reunir por lo que han hecho, no por dónde están.

Con él se hacen los rangos —los que llevan más de diez puntos—, las misiones —los que ya tienen la
pieza uno— y los sistemas de niveles.

Y a diferencia de las placas o los objetos de mano, el jugador no puede quitarse una variable, así que
es la marca que de verdad resiste.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/usuarios-con-variable.png" alt="Ventana de configuración de Usuarios con variable" class="ventana-wired" />
<!-- /ventana -->

**Elegir variable**, cuál se comprueba.

**Seleccionar por valor**, la casilla que enciende la comparación. Sin marcarla, el selector reúne a
todos los que tengan la variable, valga lo que valga. Sale en gris si la variable elegida no guarda
ningún valor.

**Elige tipo**, la comparación: mayor, mayor o igual, igual, menor o igual, menor y distinto.

**Seleccionar por valor**, el valor contra el que se compara, con dos modos: **ajustar valor**, un
número escrito por ti, o **usar variable como referencia**, con su propia **variable de referencia** y
su ámbito.

**Opciones de selector**: **filtrar la selección existente** e **invertir**.

## Ejemplo

Abrir la zona VIP a quien haya pasado de cien puntos:

```
Pila A:
  Causante: Periodos              [3 s]
  Selector: Usuarios sobre Furni  [el felpudo]
  Selector: Usuarios con variable [puntos · mayor que · 100 · filtrar la selección existente]
  Efecto:   ¡Adiós!               [la zona VIP]
```

## Notas

**Quien no tiene la variable no entra.** No existir no es lo mismo que valer cero. Si quieres alcanzar
también a los nuevos, dales la variable al entrar con
[Dar variable](/efectos/dar-variable/) sin sobrescribir.

**Comparar contra otra variable es lo que lo hace especial.** Así se montan los duelos —"los que llevan
más puntos que el líder"— sin escribir ningún número a mano.

---

# Selección Remota

> Reutiliza la selección que calculan otras pilas.
>
> Página: https://wired.hartico.tv/selectores/seleccion-remota/

Reutiliza la selección que calculan **otras pilas** de la sala, en vez de calcular una propia.

## Cómo funciona

Es la pieza de reutilización de la familia. Si tienes una baldosa cuyos selectores ya calculan "los
jugadores del equipo rojo que están en la zona", no hace falta repetir ese montaje en cada sitio: se
señala esa baldosa y se hereda su resultado.

Además puede combinar varias: quedarse con **todo** lo que reúnan entre ellas, o solo con lo que
aparezca en **todas**.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/seleccion-remota.png" alt="Ventana de configuración de Selección Remota" class="ventana-wired" />
<!-- /ventana -->

**Selección de furnis**, las baldosas cuyas pilas se van a leer.

**Tipo de selección**, con dos modos:

- **Unión** – todo lo que reúnan entre todas.
- **Intersección** – solo lo que esté en todas a la vez.

**Filtra las pilas**, con dos modos:

- **Usar todas las pilas seleccionadas**.
- **Usar una cantidad aleatoria**, y cuántas. Viene con **0**, y con cero no recorta nada: se leen
  todas. Si marcas este modo, acuérdate de subir el número.

**Opciones de selector**: **filtrar la selección existente** e **invertir**.

## Ejemplo

Un premio que va a parar a uno de los grupos de jugadores al azar:

```
Pila A:
  Causante: Contador Alcanza el Tiempo Establecido [el reloj]
  Selector: Selección Remota                       [las tres baldosas de equipo · cantidad aleatoria 1]
  Efecto:   Dar puntos                             [50 · aumentar]
```

## Notas

**La cantidad aleatoria elige pilas, no personas.** Con "1" se queda con una de las baldosas señaladas
y toma **toda** su selección, no un individuo suelto. Para eso está
[Filtrar a X Usuarios](/selectores/filtrar-a-x-usuarios/).

**La pila leída no se ejecuta**, solo se le pide su selección. No dispara sus efectos.

**No puede leerse a sí misma.** Si señalas la propia pila donde está la Selección Remota, se ignora.
Tiene que apuntar a otras.

---

# Filtrar a X Furnis

> Recorta la selección a un número concreto de furnis.
>
> Página: https://wired.hartico.tv/selectores/filtrar-a-x-furnis/

Recorta la selección ya calculada, dejándola en el número de furnis que indiques.

## Cómo funciona

No busca nada: **recorta**. Se pone detrás de los selectores que reúnen y limita el resultado.

Sirve para dos cosas muy distintas. Una es el sorteo: de todos los cofres, abre solo tres. La otra es
la protección: si tu pila mueve cien furnis a la vez, un recorte a diez evita que la sala se ahogue.

En el catálogo aparece como **Filtro WIRED**, aunque se usa exactamente igual que un selector.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/filtrar-a-x-furnis.png" alt="Ventana de configuración de Filtrar a X Furnis" class="ventana-wired" />
<!-- /ventana -->

**Cantidad a filtrar**, cuántos furnis se conservan, con dos modos: **establecer valor**, un número
escrito por ti, o **usar valor de la variable**, con su **variable de referencia** y su ámbito.

## Ejemplo

Abrir tres cofres al azar de todos los que haya:

```
Pila A:
  Causante: Click en Furni     [el botón]
  Selector: Furnis por Tipo    [los cofres]
  Selector: Filtrar a X Furnis [3]
  Efecto:   Mutar
```

## Notas

**El recorte es al azar.** No se queda con los primeros que encontró ni con los más cercanos: baraja y
corta. Si necesitas elegir por un criterio, usa
[Furni con variable más alta o baja](/selectores/furni-con-variable-mas-alta/).

**Se evalúa siempre el último**, da igual dónde lo pongas en la pila: el sistema deja los recortes
para el final, cuando el resto de selectores ya han terminado de reunir.

**Que la cantidad salga de una variable es lo que lo hace interesante.** Un juego puede repartir más o
menos premios según cuánta gente haya, sin tocar la pila.

---

# Filtrar a X Usuarios

> Recorta la selección a un número concreto de personas.
>
> Página: https://wired.hartico.tv/selectores/filtrar-a-x-usuarios/

Recorta la selección ya calculada, dejándola en el número de personas que indiques.

## Cómo funciona

Es el gemelo de [Filtrar a X Furnis](/selectores/filtrar-a-x-furnis/) para las personas, y su uso
estrella es el sorteo: de todos los que están en la sala, elige a uno.

Eso es lo que hace posibles las ruletas, los premios al azar y los juegos que van eliminando gente sin
tener que montar nada complicado.

En el catálogo aparece como **Filtro WIRED**, aunque se usa exactamente igual que un selector.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/filtrar-a-x-usuarios.png" alt="Ventana de configuración de Filtrar a X Usuarios" class="ventana-wired" />
<!-- /ventana -->

**Cantidad a filtrar**, cuántas personas se conservan, con dos modos: **establecer valor**, un número
escrito por ti, o **usar valor de la variable**, con su **variable de referencia** y su ámbito.

## Ejemplo

Sortear un premio entre los presentes:

```
Pila A:
  Causante: Click en Furni       [el botón]
  Selector: Usuarios en Área     [toda la sala]
  Selector: Filtrar a X Usuarios [1]
  Efecto:   Mensaje              ["¡Has ganado el sorteo!" · solo el usuario]
  Efecto:   Dar puntos           [100 · aumentar]
```

## Notas

**El recorte es al azar**, no por orden de llegada ni por nada que puedas predecir. Si necesitas elegir
por un criterio, usa [Usuario con variable más alta o baja](/selectores/usuario-con-variable-mas-alta/).

**Se evalúa siempre el último**, después del resto de selectores.

---

# Furni con variable más alta o baja

> Se queda con el furni que tenga el valor mayor o menor.
>
> Página: https://wired.hartico.tv/selectores/furni-con-variable-mas-alta/

De todos los furnis seleccionados, se queda con el que tenga el valor **más alto** —o el más bajo— en
una variable.

## Cómo funciona

Es el selector que resuelve los marcadores. Cuando cada furni lleva su cuenta, esta pieza encuentra al
que va ganando sin necesidad de compararlos a mano.

Con él se montan podios, "la casilla más pisada", "el cofre que más veces se ha abierto" y cualquier
récord guardado en furnis.

En el catálogo aparece como **Wired extra**, aunque actúa como un recorte de la selección.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/furni-con-variable-mas-alta.png" alt="Ventana de configuración de Furni con variable más alta o baja" class="ventana-wired" />
<!-- /ventana -->

**Elegir variable**, cuál se compara.

**Filtrar por**, con seis criterios, no dos:

| Criterio | Se queda con |
| --- | --- |
| **Mayor valor** | El furni que más tiene |
| **Menor valor** | El furni que menos tiene |
| **Fecha de creación más antigua** | El furni que antes recibió la variable |
| **Fecha de creación más reciente** | El furni que la recibió el último |
| **Fecha de modificación más antigua** | El furni que lleva más tiempo sin tocarla |
| **Fecha de modificación más reciente** | El furni que la cambió hace menos |

Los cuatro criterios de fecha solo se pueden elegir si la variable guarda esa información; si no,
salen en gris.

**Cantidad a filtrar**, con cuántos furnis te quedas: entre **1 y 1000**, o sacada de una variable.
No es un "quédate con uno" fijo — puedes pedir el podio de los tres primeros.

## Ejemplo

Iluminar la casilla más pisada del tablero:

```
Pila A:
  Causante: Periodos Largos                    [30 s]
  Selector: Furnis por Tipo                    [las casillas]
  Selector: Furni con variable más alta o baja [pisadas · Mayor valor · 1]
  Efecto:   Mutar
```

## Notas

**Necesita selectores delante.** Por sí solo no reúne nada: elige de entre lo que otros hayan reunido.

**Los empates no se resuelven.** Si dos furnis van igualados, no hay garantía de cuál sale; añade un
criterio de desempate en la variable si te importa.

---

# Usuario con variable más alta o baja

> Se queda con la persona que tenga el valor mayor o menor.
>
> Página: https://wired.hartico.tv/selectores/usuario-con-variable-mas-alta/

De todas las personas seleccionadas, se queda con la que tenga el valor **más alto** —o el más bajo— en
una variable.

## Cómo funciona

Es la pieza que corona al ganador. Cuando cada jugador lleva su puntuación en una variable, este
selector encuentra al mejor sin comparar de uno en uno.

Es la forma correcta de terminar una partida: reúnes a los jugadores, te quedas con el que más tiene y
le das el premio.

En el catálogo aparece como **Wired extra**, aunque actúa como un recorte de la selección.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/usuario-con-variable-mas-alta.png" alt="Ventana de configuración de Usuario con variable más alta o baja" class="ventana-wired" />
<!-- /ventana -->

**Elegir variable**, cuál se compara.

**Filtrar por**, con seis criterios, no dos:

| Criterio | Se queda con |
| --- | --- |
| **Mayor valor** | La persona que más tiene |
| **Menor valor** | La persona que menos tiene |
| **Fecha de creación más antigua** | La persona que antes recibió la variable |
| **Fecha de creación más reciente** | La persona que la recibió el último |
| **Fecha de modificación más antigua** | La persona que lleva más tiempo sin tocarla |
| **Fecha de modificación más reciente** | La persona que la cambió hace menos |

Los cuatro criterios de fecha solo se pueden elegir si la variable guarda esa información; si no,
salen en gris.

**Cantidad a filtrar**, con cuántas personas te quedas: entre **1 y 1000**, o sacada de una variable.
No es un "quédate con uno" fijo — puedes pedir el podio de los tres primeros.

## Ejemplo

Premiar al que más puntos tenga al acabar:

```
Pila A:
  Causante: Contador Alcanza el Tiempo Establecido [el reloj]
  Selector: Usuarios en Área                       [toda la sala]
  Selector: Usuario con variable más alta o baja   [puntos · Mayor valor · 1]
  Efecto:   Mensaje                                ["¡Has ganado la partida!"]
  Efecto:   Dar puntos                             [100 · aumentar]
```

## Notas

**Con "Menor valor" tienes el modo eliminación**: el que menos puntos lleva es el que se va. Es el mismo
selector con la otra opción.

**Necesita selectores delante** que reúnan a la gente; por sí solo no busca a nadie.

---

# Complementos

> Los 15 complementos disponibles, agrupados por lo que cambian.
>
> Página: https://wired.hartico.tv/complementos/

Un **complemento** no hace nada por sí solo: cambia **cómo se comporta el resto de la pila**. No
dispara, no filtra y no mueve nada — modifica las reglas de la baldosa en la que está.

Por eso son la familia que más cuesta descubrir y la que más problemas resuelve. Casi todo lo que en
una sala parece imposible —que los efectos vayan en orden, que una pila no se ejecute cien veces por
segundo, que un mensaje diga tu nombre— es un complemento.

Se colocan en la baldosa como cualquier otra pieza, y afectan a todos los demás wireds que estén ahí.

## Reglas de ejecución

| Complemento | Qué cambia |
| --- | --- |
| [Lógica de Condición](/complementos/logica-de-condicion/) | La regla de "todas las condiciones" pasa a ser la que tú digas |
| [Límite de Ejecución](/complementos/limite-de-ejecucion/) | Cuántas veces puede correr la pila y cada cuánto |
| [Ejecutar en Orden](/complementos/ejecutar-en-orden/) | Los efectos se ejecutan según su altura, no al azar |
| [Efecto aleatorio](/complementos/efecto-aleatorio/) | Solo se ejecutan unos pocos efectos, sorteados |
| [Efecto no visto](/complementos/efecto-no-visto/) | Se ejecuta uno distinto en cada pasada, por turnos |

## Movimiento

| Complemento | Qué cambia |
| --- | --- |
| [Tiempo de Animación](/complementos/tiempo-de-animacion/) | Lo que tardan los movimientos en verse |
| [Cancelar Animación de Movimiento](/complementos/cancelar-animacion-de-movimiento/) | Los furnis saltan en vez de deslizarse |
| [Curva de Movimiento](/complementos/curva-de-movimiento/) | El movimiento acelera o frena en vez de ir fijo |
| [Movimientos Físicos](/complementos/movimientos-fisicos/) | Qué bloquea a los furnis en movimiento y qué no |
| [Transportar Usuario](/complementos/transportar-usuario/) | La gente viaja encima de los furnis que se mueven |

## Textos y variables

| Complemento | Qué añade |
| --- | --- |
| [Identificar Nombres](/complementos/identificar-nombres/) | Meter el nombre de una persona en un mensaje |
| [Identificar Nombres de Furni](/complementos/identificar-nombres-de-furni/) | Meter el nombre de un furni en un mensaje |
| [Marcador de posición de variable](/complementos/marcador-de-posicion-de-variable/) | Meter el valor de una variable en un mensaje |
| [Capturador de variables](/complementos/capturador-de-variables/) | Guardar en una variable lo que el usuario escriba |
| [Conector de texto](/complementos/conector-de-texto/) | Ponerle un nombre legible a cada valor de una variable |

Los tres primeros de esa tabla trabajan igual: le pones un nombre al identificador y, escribiéndolo en
el texto de cualquier efecto de la misma pila, se sustituye por el valor real. La propia ventana te
enseña cómo hay que escribirlo.

## Los que más se echan de menos

Si estás peleándote con algo, mira si es uno de estos cuatro antes de montar nada:

- La sala va lenta → [Límite de Ejecución](/complementos/limite-de-ejecucion/).
- Los efectos no van en el orden que quieres → [Ejecutar en Orden](/complementos/ejecutar-en-orden/).
- Necesitas un "o" entre condiciones → [Lógica de Condición](/complementos/logica-de-condicion/).
- Un efecto de mover no hace nada porque el destino está ocupado →
  [Movimientos Físicos](/complementos/movimientos-fisicos/).

---

# Lógica de Condición

> Cambia la regla de "todas las condiciones" por la que tú quieras.
>
> Página: https://wired.hartico.tv/complementos/logica-de-condicion/

Cambia la regla por defecto de las condiciones: en vez de exigirlas **todas**, pide las que tú digas.

## Cómo funciona

Normalmente, una pila con tres condiciones exige que se cumplan las tres. Este complemento rompe esa
regla y te deja pedir "al menos una", "ninguna", "exactamente dos" y unas cuantas más.

Es lo que hace posible el "o": tres llaves distintas y basta con tener una. Sin él, tendrías que
montar tres pilas idénticas cambiando solo la condición.

Además puede leer las condiciones de **otra baldosa**, no solo las suyas, con lo que se pueden montar
bloques de lógica reutilizables.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/logica-de-condicion.png" alt="Ventana de configuración de Lógica de Condición" class="ventana-wired" />
<!-- /ventana -->

**Condiciones que deben coincidir**, con siete modos:

| Modo | Se cumple si |
| --- | --- |
| **Todas** | Se cumplen todas — la regla normal |
| **Al menos una** | Se cumple una o más |
| **No todas** | Falla al menos una |
| **Ninguna** | No se cumple ninguna |
| **Menos de** | Se cumplen menos de N |
| **Exactamente** | Se cumple justo el número que indiques |
| **Más de** | Se cumplen más de N |

**Selección de furnis**, opcional, para aplicar la regla a las condiciones que haya en **otras** pilas.

Cuidado con esto último, que no hace lo que parece. En cuanto seleccionas furnis, la pila se parte en
dos mitades con reglas distintas:

- **Las condiciones de tu propia pila siguen exigiéndose todas**, como si el complemento no estuviera.
- **La regla que elegiste se aplica solo a las de fuera**, las de los furnis seleccionados.

O sea que no sustituye tus condiciones: las suma. Si querías un "al menos una" entre tres condiciones
tuyas, **no selecciones ningún furni** y déjalas en la misma pila que el complemento.

## Ejemplo

Una puerta que abre con cualquiera de las tres llaves:

```
Pila A:
  Complemento: Lógica de Condición [al menos una]
  Causante:    Click en Furni      [la puerta]
  Condición:   Contiene variable   [llave_roja]
  Condición:   Contiene variable   [llave_azul]
  Condición:   Contiene variable   [llave_verde]
  Efecto:      Mutar               [la puerta]
```

## Notas

**"Ninguna" es más útil de lo que parece.** Con él, una pila se ejecuta justo cuando todo lo que
comprueba falla — el caso "no cumples ningún requisito" de un solo golpe.

**"Exactamente" sirve para los puzles de combinación**, del tipo "tienes que pisar dos de las cuatro
baldosas, ni una más".

---

# Límite de Ejecución

> Limita cuántas veces puede correr la pila y cada cuánto.
>
> Página: https://wired.hartico.tv/complementos/limite-de-ejecucion/

Limita cuántas veces puede ejecutarse la pila dentro de un intervalo de tiempo.

## Cómo funciona

Es el freno del sistema. Una pila con un causante que se dispara mucho —un chat, una baldosa muy
pisada, un periódico corto— puede acabar ejecutándose decenas de veces por segundo, y eso es lo que
ahoga una sala.

Con este complemento, la pila corre lo que tú digas y el resto de disparos se descartan.

También sirve como regla de juego: "solo se puede pulsar el botón tres veces por minuto" no es una
optimización, es una mecánica.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/limite-de-ejecucion.png" alt="Ventana de configuración de Límite de Ejecución" class="ventana-wired" />
<!-- /ventana -->

**Cantidad de ejecuciones**, entre **1 y 100**.

**Establecer intervalo**, el tiempo en el que cuentan esas ejecuciones, en pasos de medio segundo.

## Ejemplo

Un botón que no se puede machacar:

```
Pila A:
  Complemento: Límite de Ejecución [1 vez cada 5 segundos]
  Causante:    Click en Furni      [el botón]
  Efecto:      Dar puntos          [10 · aumentar]
```

## Notas

**Es la primera herramienta que hay que sacar cuando una sala va lenta.** Antes de recortar efectos o
quitar furnis, mira qué pila se está ejecutando de más y ponle un límite.

**Los disparos de sobra se pierden, no se encolan.** No se ejecutarán más tarde: simplemente no
ocurren.

---

# Ejecutar en Orden

> Ejecuta los efectos de la pila según la altura a la que los coloques.
>
> Página: https://wired.hartico.tv/complementos/ejecutar-en-orden/

Ejecuta los efectos de la pila en un orden que tú controlas: **el de su altura**.

## Cómo funciona

Sin este complemento, los efectos de una baldosa se ejecutan en el orden que decide el sistema, y no
puedes contar con él. Con él, se ejecutan de abajo arriba: primero el furni de efecto que esté más
bajo, después el siguiente, y así.

O sea que el orden se decide **apilando**: colocas los efectos a distintas alturas y ese es el guion.

Eso es imprescindible para todo lo que sea una secuencia: una animación por pasos, un diálogo con
varias frases, un montaje donde el segundo efecto necesita que el primero ya haya pasado.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/ejecutar-en-orden.png" alt="Ventana de configuración de Ejecutar en Orden" class="ventana-wired" />
<!-- /ventana -->

Sin opciones.

## Ejemplo

Una secuencia de apertura que tiene que ir en orden:

```
Pila A:
  Complemento: Ejecutar en Orden
  Causante:    Click en Furni                                             [la palanca]
  Efecto:      Mensaje         ["Se oye un mecanismo..."]   ← el más bajo
  Efecto:      Mutar           [la puerta]                  ← en medio
  Efecto:      ¡Adiós!         [el interior]                ← el más alto
```

## Notas

**La altura la pones tú al colocar los furnis**, apilándolos o subiéndolos con la herramienta de la
sala. Si están todos a la misma altura, no hay orden que valga.

**No afecta a los retardos.** Un efecto con retardo sigue esperando lo suyo, aunque le toque ir el
primero.

---

# Efecto aleatorio

> De todos los efectos de la pila, ejecuta unos pocos al azar.
>
> Página: https://wired.hartico.tv/complementos/efecto-aleatorio/

De todos los efectos de la pila, ejecuta solo unos cuantos, elegidos **al azar**.

## Cómo funciona

Es lo que hace que una sala no sea siempre igual. Pones diez efectos posibles en la baldosa y en cada
ejecución salen dos: diez frases de un bot, diez trampas repartidas, diez premios de una ruleta.

Tiene además una segunda opción que es la que de verdad lo hace bueno: una **memoria** de las últimas
ejecuciones, para no repetir lo mismo dos veces seguidas. Sin ella, el azar puro repite más de lo que
la gente considera "aleatorio", y la sala parece rota.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/efecto-aleatorio.png" alt="Ventana de configuración de Efecto aleatorio" class="ventana-wired" />
<!-- /ventana -->

**Usar N Efectos WIRED**, cuántos se ejecutan en cada pasada.

**Evitar los Efectos WIRED de las últimas N ejecuciones**, la memoria: los efectos usados hace poco
quedan fuera del sorteo. Con **0** no hay memoria y todo puede repetirse.

## Ejemplo

Un bot con diez frases que no se repite:

```
Pila A:
  Complemento: Efecto aleatorio [1 efecto · evitar los últimos 5]
  Causante:    Periodos Largos  [30 s]
  Efecto:      Mensaje de Bot   ["Bienvenidos al hotel"]
  Efecto:      Mensaje de Bot   ["¿Habéis probado el juego?"]
  Efecto:      Mensaje de Bot   ["Hoy hace buen día"]
  ... y siete más
```

## Notas

**La memoria no puede ser tan grande como el número de efectos.** Si tienes diez frases y le pides
evitar las diez últimas, no queda ninguna disponible; el sistema entonces vuelve a permitirlas todas,
pero has perdido el efecto de la memoria. Deja siempre un margen.

**Si quieres que salgan todas antes de repetir**, el que buscas es
[Efecto no visto](/complementos/efecto-no-visto/).

---

# Efecto no visto

> Ejecuta un efecto distinto en cada pasada, por turnos.
>
> Página: https://wired.hartico.tv/complementos/efecto-no-visto/

Ejecuta **un solo efecto** en cada pasada, y va rotando: uno distinto cada vez.

## Cómo funciona

No es azar, es **turno**. Recorre los efectos de la baldosa uno tras otro, y cuando llega al último
vuelve a empezar. Todos salen, ninguno se repite antes de tiempo.

El orden del turno es el de la **altura** de los furnis, igual que en
[Ejecutar en Orden](/complementos/ejecutar-en-orden/): el más bajo primero.

Eso lo hace la pieza de las secuencias que se repiten: un semáforo que va cambiando, una historia por
capítulos, una animación en bucle.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/efecto-no-visto.png" alt="Ventana de configuración de Efecto no visto" class="ventana-wired" />
<!-- /ventana -->

Sin opciones.

## Ejemplo

Un semáforo de tres tiempos:

```
Pila A:
  Complemento: Efecto no visto
  Causante:    Periodos                                    [5 s]
  Efecto:      Mutar         [luz verde]     ← el más bajo
  Efecto:      Mutar         [luz ámbar]     ← en medio
  Efecto:      Mutar         [luz roja]      ← el más alto
```

## Notas

**No lo confundas con el aleatorio.** Este garantiza que salgan todos, y en orden; el otro sortea. Para
una secuencia quieres este; para variedad, el otro.

**Si añades o quitas efectos, el turno vuelve al principio.** No es un fallo: el complemento se da
cuenta de que la lista ha cambiado y reinicia la cuenta.

---

# Tiempo de Animación

> Cambia lo que tardan los movimientos en verse.
>
> Página: https://wired.hartico.tv/complementos/tiempo-de-animacion/

Cambia el tiempo que tardan en verse los movimientos de los furnis de la pila.

## Cómo funciona

Cuando un furni se mueve, no salta: se desliza. Este complemento decide cuánto dura ese deslizamiento.

Es puramente visual, pero cambia por completo la sensación de una sala. Un ascensor que sube en dos
segundos es un ascensor; el mismo movimiento en cincuenta milisegundos es un parpadeo.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/tiempo-de-animacion.png" alt="Ventana de configuración de Tiempo de Animación" class="ventana-wired" />
<!-- /ventana -->

**Tiempo de animación**, entre **50 y 2000 milisegundos**.

## Ejemplo

Una plataforma que se desliza despacio:

```
Pila A:
  Complemento: Tiempo de Animación [1500 ms]
  Causante:    Periodos            [2 s]
  Efecto:      Mover               [la plataforma · hacia el norte]
```

## Notas

**Que la animación dure más que el periodo es pedir problemas.** Si el furni tarda 1500 ms en llegar y
le mandas moverse otra vez cada segundo, la animación se corta a la mitad. Deja siempre el periodo por
encima del tiempo de animación.

**Para quitar la animación del todo** está
[Cancelar Animación de Movimiento](/complementos/cancelar-animacion-de-movimiento/).

---

# Cancelar Animación de Movimiento

> Hace que los furnis salten a su destino sin deslizarse.
>
> Página: https://wired.hartico.tv/complementos/cancelar-animacion-de-movimiento/

Quita el deslizamiento: los furnis de la pila aparecen directamente en su destino.

## Cómo funciona

Por defecto, un furni que se mueve se desliza hasta la casilla siguiente. Este complemento quita ese
tránsito.

Sirve para dos cosas. La primera es de efecto: cosas que aparecen y desaparecen, teletransportes de
objetos, fantasmas. La segunda es práctica: con movimientos muy rápidos o muchos furnis a la vez, las
animaciones se atropellan y se ve peor que sin ellas.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/cancelar-animacion-de-movimiento.png" alt="Ventana de configuración de Cancelar Animación de Movimiento" class="ventana-wired" />
<!-- /ventana -->

Sin opciones.

## Ejemplo

Un tablero que se recoloca de golpe:

```
Pila A:
  Complemento: Cancelar Animación de Movimiento
  Causante:    Acaba el juego
  Selector:    Furnis por Tipo                  [las fichas]
  Efecto:      A cero
```

## Notas

**Con muchos furnis, esto va mejor que la animación.** Cincuenta objetos deslizándose a la vez se ve
peor —y cuesta más— que cincuenta objetos que simplemente están ya en su sitio.

---

# Movimientos Físicos

> Decide qué bloquea a los furnis en movimiento y qué no.
>
> Página: https://wired.hartico.tv/complementos/movimientos-fisicos/

Decide qué **bloquea** a los furnis que mueve la pila: los muebles, la gente, o nada.

## Cómo funciona

Normalmente, un furni que se mueve se para al encontrarse cualquier cosa. Este complemento cambia esas
reglas una por una.

Es lo que hace posibles los proyectiles que atraviesan a la gente, las plataformas que pasan por encima
de los muebles y los objetos que ignoran las paredes de decoración.

También resuelve un problema muy concreto: mover a una persona a una baldosa donde ya hay otra. Sin
este complemento no se puede, porque dos avatares no comparten casilla.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/movimientos-fisicos.png" alt="Ventana de configuración de Movimientos Físicos" class="ventana-wired" />
<!-- /ventana -->

**Opciones**, con tres casillas:

- **Mover a través de furnis** – los muebles dejan de bloquear.
- **Mover a través de usuarios** – la gente deja de bloquear.
- **Mantener la altura de los furnis** – el furni conserva su altura al pasar por encima de otros en
  vez de subirse a ellos.

**Mover por los furnis** y **Mover a través de usuarios**, para elegir a qué furnis y a qué personas se
aplica cada permiso: todos los de la sala, el desencadenante, los del selector, los de la señal o una
selección propia.

**Bloqueado por furnis**, la lista de lo que sí debe seguir frenando el movimiento pese a todo lo
anterior.

## Ejemplo

Una bala que atraviesa a la gente pero choca con las paredes:

```
Pila A:
  Complemento: Movimientos Físicos [a través de usuarios · bloqueado por: los muros]
  Causante:    Periodos            [500 ms]
  Efecto:      Mover               [la bala · hacia el norte]
```

## Notas

**Es el complemento que necesita [Mover Usuario a Furni](/efectos/mover-usuario-a-furni/)** cuando el
destino puede estar ocupado. Sin él, el efecto simplemente no hace nada y parece roto.

**"Bloqueado por furnis" manda sobre lo demás.** Es la forma de decir "atraviesa todo menos esto", que
suele ser lo que quieres: sin ninguna barrera, los objetos se van de la sala.

---

# Transportar Usuario

> Hace que la gente viaje encima de los furnis que se mueven.
>
> Página: https://wired.hartico.tv/complementos/transportar-usuario/

Hace que las personas **viajen** encima de los furnis que mueve la pila, en vez de quedarse atrás.

## Cómo funciona

Sin él, un furni que se mueve se va y deja plantada a la persona que tenía encima. Con él, la persona
va montada.

Es la pieza de los ascensores, las cintas transportadoras, las barcas y las plataformas móviles: todo
lo que en una sala se comporta como un vehículo.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/transportar-usuario.png" alt="Ventana de configuración de Transportar Usuario" class="ventana-wired" />
<!-- /ventana -->

**Transportar usuarios cuando**, con dos criterios:

- **Están encima del furni en movimiento** – solo quien esté montado.
- **Están en la misma baldosa que el furni en movimiento** – también quien comparta casilla sin estar
  encima.

**Permitir transportar usuarios**, a quién se aplica: todos los de la sala, el desencadenante, los del
selector, los de la señal, el usuario clicado o el alcanzado.

## Ejemplo

Un ascensor que sube con sus pasajeros:

```
Pila A:
  Complemento: Transportar Usuario      [encima del furni · todos los usuarios de la sala]
  Causante:    Click en Furni           [el botón]
  Efecto:      Cambiar Altitud de Furni [la plataforma · subir]
```

## Notas

**Con "todos los usuarios de la sala" no hace falta selector.** Es lo que quieres en un vehículo
público; deja el desencadenante para los que sean de un solo pasajero.

**Es mucho más simple que hacerlo a mano.** La alternativa —un selector de usuarios sobre el furni más
un efecto de mover usuario— funciona, pero se desincroniza en cuanto el movimiento es rápido.

---

# Curva de Movimiento

> Hace que el movimiento acelere o frene en vez de ir a velocidad fija.
>
> Página: https://wired.hartico.tv/complementos/curva-de-movimiento/

Cambia el **ritmo** del movimiento: en vez de ir siempre igual, puede arrancar despacio, acelerar o
frenar al llegar.

## Cómo funciona

Un movimiento a velocidad constante se ve mecánico. Una curva de movimiento le da inercia, y con eso
una plataforma parece pesada, una pelota parece que rebota y un ascensor parece un ascensor.

El valor puede salir de una variable, con lo que el ritmo puede cambiar durante la partida: un vehículo
que va acelerando ronda tras ronda.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/curva-de-movimiento.png" alt="Ventana de configuración de Curva de Movimiento" class="ventana-wired" />
<!-- /ventana -->

**Curva de movimiento**, con dos modos: **establecer valor**, un número escrito por ti, o **usar valor
de la variable**, con su **variable de referencia** y su ámbito.

## Ejemplo

Una plataforma con inercia:

```
Pila A:
  Complemento: Tiempo de Animación [1200 ms]
  Complemento: Curva de Movimiento [una curva suave]
  Causante:    Periodos            [2 s]
  Efecto:      Mover               [la plataforma · hacia el este]
```

## Notas

**No se nota sin [Tiempo de Animación](/complementos/tiempo-de-animacion/).** Si el movimiento dura 50
milisegundos, no hay tiempo material para ver ninguna curva. Sube primero la duración.

**Los valores hay que probarlos.** No hay una tabla de curvas: ajusta mirando el resultado en la sala.

---

# Identificar Nombres

> Permite meter el nombre de una persona dentro de un mensaje.
>
> Página: https://wired.hartico.tv/complementos/identificar-nombres/

Permite escribir el nombre de una persona **dentro** de los mensajes de la pila.

## Cómo funciona

Un mensaje fijo le habla a todo el mundo igual. Con este complemento, el mensaje puede decir el nombre
de quien lo recibe, y eso cambia por completo cómo se siente una sala.

Se le pone un nombre al identificador —por ejemplo `nombre`— y a partir de ahí, escribiendo ese
identificador en el texto de cualquier efecto de la pila, se sustituye por el nombre real.

Puede trabajar con una persona o con varias a la vez. Cuando son varias, el delimitador es lo que
separa los nombres en la lista.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/identificar-nombres.png" alt="Ventana de configuración de Identificar Nombres" class="ventana-wired" />
<!-- /ventana -->

**Nombre del identificador**, cómo se va a llamar. La ventana muestra debajo exactamente cómo hay que
escribirlo en el texto.

**Tipo de identificador**, con dos modos:

- **Individual** – una sola persona.
- **Múltiples usuarios** – la lista de todos los seleccionados.

**Establecer delimitador**, lo que va entre nombre y nombre cuando son varios.

## Ejemplo

Un saludo con nombre y propio:

```
Pila A:
  Complemento: Identificar Nombres [nombre · individual]
  Causante:    Entrada
  Efecto:      Mensaje             ["Hola nombre, bienvenido"]
```

## Notas

**Con "múltiples usuarios" tienes el anuncio de los ganadores** en una sola línea: "Han ganado Ana,
Luis y Marta" sale de un mensaje y un selector, sin montar nada más.

**Elige un identificador que no puedas escribir por accidente.** Si lo llamas "el", cualquier "el" del
texto se convertirá en un nombre.

---

# Identificar Nombres de Furni

> Permite meter el nombre de un furni dentro de un mensaje.
>
> Página: https://wired.hartico.tv/complementos/identificar-nombres-de-furni/

Permite escribir el nombre de un furni **dentro** de los mensajes de la pila.

## Cómo funciona

Es el gemelo de [Identificar Nombres](/complementos/identificar-nombres/) para los muebles. En vez del
nombre de una persona, mete el del furni con el que está trabajando la pila.

Sirve para las salas que explican lo que pasa: "has recogido *la llave dorada*", "*el cofre* está
cerrado". El texto se escribe una sola vez y vale para todos los objetos.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/identificar-nombres-de-furni.png" alt="Ventana de configuración de Identificar Nombres de Furni" class="ventana-wired" />
<!-- /ventana -->

**Nombre del identificador**, cómo se va a llamar. La ventana muestra debajo cómo escribirlo en el
texto.

**Tipo de identificador**, con dos modos: **un solo furni** o **múltiples furnis**.

**Establecer delimitador**, lo que va entre nombre y nombre cuando son varios.

**Selección de furnis**, de qué furni sale el nombre.

## Ejemplo

Un mensaje que dice qué has recogido:

```
Pila A:
  Complemento: Identificar Nombres de Furni [objeto · un solo furni]
  Causante:    Click en Furni               [el objeto]
  Efecto:      Mensaje                      ["Has recogido objeto" · solo el usuario]
```

## Notas

**Sale el nombre del catálogo**, no el que le hayas puesto tú en la sala. Si el nombre público de un
furni es feo o está mal escrito, aquí se nota.

---

# Marcador de posición de variable

> Permite meter el valor de una variable dentro de un mensaje.
>
> Página: https://wired.hartico.tv/complementos/marcador-de-posicion-de-variable/

Permite escribir el **valor de una variable** dentro de los mensajes de la pila.

## Cómo funciona

Es lo que convierte las variables en algo que el jugador puede ver. Sin él, una puntuación guardada en
una variable existe pero no se puede enseñar; con él, el mensaje dice el número.

Con esta pieza se montan los marcadores, los "te quedan N intentos", los "llevas N puntos" y cualquier
texto que tenga que reflejar el estado de la partida.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/marcador-de-posicion-de-variable.png" alt="Ventana de configuración de Marcador de posición de variable" class="ventana-wired" />
<!-- /ventana -->

**Escoge una variable** y **Escoge la fuente de la variable**: cuál se muestra y de quién es.

**Nombre del identificador**, cómo se escribe en el texto. La ventana muestra debajo el formato exacto.

**Escoge el tipo de visualización**, con dos modos: **numérica** o **textual**.

**Tipo de identificador**, **individual** o **múltiple**, y **establecer delimitador** para cuando son
varios valores.

## Ejemplo

Un marcador personal:

```
Pila A:
  Complemento: Marcador de posición de variable [puntos · del usuario · puntos_txt]
  Causante:    Click en Furni                   [el marcador]
  Efecto:      Mensaje                          ["Llevas puntos_txt puntos" · solo el usuario]
```

## Notas

**Es la única forma de enseñar una variable.** Todo lo demás del sistema de variables trabaja por
dentro; esta pieza es la ventana.

**Si el mensaje sale con el identificador sin sustituir**, es que el complemento no está en la misma
pila que el efecto, o que el nombre no coincide exactamente.

**Y si sale la palabra `null`**, es que esa persona o ese furni todavía no tienen valor en la variable.
No sale en blanco: sale `null` tal cual, que en un mensaje al jugador queda fatal. Asegúrate de darles
la variable antes, o filtra con [Contiene variable](/condiciones/contiene-variable/).

---

# Capturador de variables

> Guarda en una variable lo que el usuario escribe en el chat.
>
> Página: https://wired.hartico.tv/complementos/capturador-de-variables/

Guarda en una variable **lo que el usuario escriba** en el chat.

## Cómo funciona

Es la única forma que tiene el sistema de recibir algo que el jugador teclee. Todo lo demás reacciona a
lo que hace; esto reacciona a lo que dice, y además se lo queda.

Con él se montan contraseñas, apuestas con cantidad, encuestas, formularios y máquinas que piden un
número.

Va de la mano del causante [Usuario dice](/causantes/dice-algo/), que es quien dispara la pila cuando
alguien habla.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/capturador-de-variables.png" alt="Ventana de configuración de Capturador de variables" class="ventana-wired" />
<!-- /ventana -->

**Capturar nombre**, la palabra que marca lo que hay que capturar. La ventana muestra debajo cómo se
escribe.

**Escoge una variable**, dónde se guarda lo capturado.

**Variable de entrada**, con dos tipos: **numérica** o **textual**.

## Ejemplo

Una apuesta con la cantidad que diga el jugador:

```
Pila A:
  Complemento: Capturador de variables [apostar · variable apuesta · numérica]
  Causante:    Clave                   ["apostar"]
  Efecto:      Mensaje                 ["Apuesta aceptada" · solo el usuario]
```

Quien escriba "apostar 50" deja un 50 en la variable.

## Notas

**Si la captura falla, la pila entera no se ejecuta.** No es que la variable se quede como estaba: el
causante se corta antes de los efectos. Con tipo numérica, quien escriba una palabra donde esperabas
una cantidad no dispara nada — ni siquiera el mensaje de error, si lo tenías en la misma pila. Ponlo
en una pila aparte con otra clave.

**Valida siempre lo que llegue.** El jugador puede escribir lo que quiera, incluidos números enormes o
negativos; una condición de
[Valor de variable](/condiciones/valor-de-variable/) detrás te ahorra el disgusto.

---

# Conector de texto

> Le pone un nombre legible a cada valor de una variable.
>
> Página: https://wired.hartico.tv/complementos/conector-de-texto/

Le pone un **nombre** a cada valor de una variable, para que en los mensajes salga una palabra en vez
de un número.

## Cómo funciona

Es una tabla de traducción. Escribes qué texto le corresponde a cada valor —`0=rojo`, `1=verde`,
`2=azul`— y a partir de ahí, cuando esa variable aparezca en un mensaje, sale la palabra y no la
cifra.

Eso resuelve un problema que aparece siempre: por dentro, todo lo que guarda una variable acaba siendo
un número, pero al jugador hay que contarle las cosas con palabras. Sin esto, tu marcador dice "Equipo
2" y con esto dice "Equipo verde".

**Se coloca sobre la caja de la variable**, no en la pila donde se usa. La tabla se queda pegada a esa
variable y vale para todos los sitios donde la enseñes.

En el catálogo aparece como **Wired variable**, aunque se comporta como un complemento.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/conector-de-texto.png" alt="Ventana de configuración de Conector de texto" class="ventana-wired" />
<!-- /ventana -->

**Conectar texto con la variable**, un cuadro de texto con **una pareja por línea**, en el formato
`valor=texto`:

```
0=Sin empezar
1=En juego
2=Terminada
```

Caben **255 caracteres** en total, así que no da para tablas enormes.

## Ejemplo

Un marcador que dice el color del equipo en vez de su número. Sobre la caja de la variable
`equipo_lider` pones el conector con esta tabla:

```
1=rojo
2=verde
3=azul
4=amarillo
```

Y luego, en la pila del panel:

```
Pila A:
  Causante:    Periodos Largos                  [10 s]
  Complemento: Marcador de posición de variable [equipo_lider · lider_txt]
  Efecto:      Mensaje                          ["Va ganando el equipo lider_txt"]
```

## Notas

**Los valores que no estén en la tabla salen como el número.** No hace falta cubrirlos todos: pon los
que te importen.

**No compone textos ni concatena nada.** Si lo que buscas es meter el valor de una variable dentro de
una frase, eso lo hace
[Marcador de posición de variable](/complementos/marcador-de-posicion-de-variable/). Este solo decide
**cómo se lee** ese valor cuando salga.

---

# Variables

> Las 6 cajas de variables, y de quién es cada dato.
>
> Página: https://wired.hartico.tv/variables/

Una **caja de variable** declara un dato: cómo se llama, de quién es y cuánto dura. Se coloca en la
sala una sola vez y a partir de ahí las condiciones y los efectos pueden leerla y escribirla.

Sin una caja no hay variable. Es lo primero que hay que poner cuando una sala pasa de reaccionar a
recordar.

## De quién es el dato

Esta es la única decisión que importa de verdad, y la que hay que tomar antes de escribir nada. La
misma variable llamada `puntos` significa cosas distintas según dónde viva.

| Caja | El dato pertenece a | Sirve para |
| --- | --- | --- |
| [Variable de usuario](/variables/variable-de-usuario/) | Cada persona | Puntuación, progreso, permisos |
| [Variable de furni](/variables/variable-de-furni/) | Cada mueble | Contadores de una casilla, estado de un cofre |
| [Variable global](/variables/variable-global/) | La sala, o el hotel | Marcadores comunes, fase del juego |
| [Variable de contexto](/variables/variable-de-contexto/) | Nadie: se borra al terminar la pila | Cálculos intermedios |

Cambiar de caja después no arrastra los datos ya guardados: te quedas con dos juegos y una sala que
funciona a medias. Piénsalo al principio.

## Las dos especiales

| Caja | Qué hace |
| --- | --- |
| [Variable heredada](/variables/variable-heredada/) | Trae una variable compartida de otra sala tuya |
| [Echo](/variables/echo/) | Le pone nombre propio a una variable del sistema |

## Cuánto duran

Las cajas de usuario, de furni y global traen opciones de disponibilidad:

- **Mientras la sala esté activa** (o el usuario esté en ella) — se pierde al vaciarse la sala. Ojo:
  una sala se descarga en cuanto lleva un rato sin gente, así que esto dura menos de lo que parece.
- **Permanente** — se conserva en esta sala entre visitas.
- **Permanente, compartida entre salas** — el dato viaja por el hotel. Potente y peligroso: ponle un
  nombre que nadie más vaya a usar.

La de contexto no tiene disponibilidad porque no dura, y eso es justo su gracia: nada que limpiar.

## Cómo se usan

La caja solo declara. El trabajo lo hacen las otras familias:

| Para | Usa |
| --- | --- |
| Crearla con un valor | [Dar variable](/efectos/dar-variable/) |
| Cambiar lo que vale | [Cambiar valor de variable](/efectos/cambiar-valor-de-variable/) |
| Borrarla | [Eliminar variable](/efectos/eliminar-variable/) |
| Comprobar si existe | [Contiene variable](/condiciones/contiene-variable/) |
| Comprobar cuánto vale | [Valor de variable](/condiciones/valor-de-variable/) |
| Reunir a quien cumpla | [Usuarios con variable](/selectores/usuarios-con-variable/) |
| Enseñarla en un mensaje | [Marcador de posición](/complementos/marcador-de-posicion-de-variable/) |

## Existir y valer cero no es lo mismo

Es la trampa que más se paga en todo el sistema. Una variable borrada **no existe**; una que vale cero
**existe y vale cero**. [Contiene variable](/condiciones/contiene-variable/) distingue las dos cosas, y
de ahí salen los "solo la primera vez" que funcionan de verdad.

Si lo que quieres es reiniciar un marcador, asígnale cero — no lo borres.

## Las variables internas

Además de las tuyas, el sistema trae variables ya hechas que puedes leer sin declarar nada: la
puntuación, la hora, el nombre, el efecto que lleva puesto el avatar. Se reconocen porque empiezan por
arroba, como `@effect`.

Algunas se pueden **escribir**, y eso es lo que permite hacer cosas que no tienen efecto propio:
asignarle un número a `@effect` con
[Cambiar valor de variable](/efectos/cambiar-valor-de-variable/) es la forma de ponerle un efecto a un
avatar, y asignarle 0 se lo quita.

---

# Variable de usuario

> Guarda un dato en cada persona — su puntuación, su progreso, sus permisos.
>
> Página: https://wired.hartico.tv/variables/variable-de-usuario/

Declara una variable que vive **en cada persona**: cada jugador tiene su propia copia con su propio
valor.

## Cómo funciona

Es la caja más usada de la familia y la base de casi todo lo que sea progreso. Con ella cada jugador
lleva encima su puntuación, sus vidas, las piezas que ha conseguido o el hecho de haber pasado ya por
una zona.

Lo importante es la **disponibilidad**: cuánto dura el dato. De eso depende que estés montando una
partida o una carrera de fondo.

Y a diferencia de una placa o de un objeto de mano, el jugador no puede quitarse una variable. Es la
marca que de verdad resiste.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/variable-de-usuario.png" alt="Ventana de configuración de Variable de usuario" class="ventana-wired" />
<!-- /ventana -->

**Nombre de la variable**, cómo se llama.

**Opciones de la variable**, con **Tiene valor**, que declara si la variable guarda un contenido o solo
sirve como marca de sí/no.

**Opciones de disponibilidad**, con tres duraciones:

| Duración | El dato vive |
| --- | --- |
| **Mientras el usuario esté en la sala** | Se borra al salir |
| **Permanente** | Se conserva entre visitas a esta sala |
| **Permanente, compartida entre salas** | Le acompaña por todo el hotel |

**Borrar datos de variables**, un botón que aparece solo cuando bajas la duración de permanente a
temporal: te avisa de que vas a tirar lo que había guardado.

## Ejemplo

Una sala con progreso que se conserva entre visitas:

```
Caja de variable:
  Variable de usuario  [puntos · permanente · tiene valor]

Pila A:
  Causante: Sobre un Furni            [la baldosa]
  Efecto:   Cambiar valor de variable [puntos · Suma · 10]
```

## Notas

**La duración es la decisión importante y hay que tomarla al principio.** Cambiarla después no arrastra
los datos ya guardados.

**"Compartida entre salas" es potente y hay que usarla con cuidado.** Un dato que viaja por todo el
hotel afecta a salas de otra gente; para lo que sea solo tuyo, "permanente" a secas ya cumple.

**Bajar de permanente a temporal tira lo guardado**, y no de un jugador: de todos. Por eso el cliente
te lo avisa antes de dejarte guardar el cambio.

---

# Variable de furni

> Guarda un dato en cada mueble — su estado, sus veces usadas, su turno.
>
> Página: https://wired.hartico.tv/variables/variable-de-furni/

Declara una variable que vive **en cada furni**: cada mueble tiene su propia copia.

## Cómo funciona

Es lo que convierte un mueble en algo con memoria. Una casilla de tablero que sabe cuántas veces la
han pisado, un cofre que recuerda si ya lo abrieron, una máquina que lleva su cuenta.

Su compañero natural es el selector
[Furnis con variable](/selectores/furnis-con-variable/), que permite reunir muebles por lo que valga su
variable: "los cofres sin abrir", "las casillas con más de tres".

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/variable-de-furni.png" alt="Ventana de configuración de Variable de furni" class="ventana-wired" />
<!-- /ventana -->

**Nombre de la variable**, cómo se llama.

**Opciones de la variable**, con **Tiene valor**, que declara si guarda un contenido o solo es una
marca.

**Opciones de disponibilidad**, con dos duraciones:

- **Mientras la sala esté activa** – se pierde cuando la sala se descarga.
- **Permanente** – se conserva.

**Borrar datos de variables**, un botón que aparece solo cuando bajas la duración de permanente a
temporal: te avisa de que vas a tirar lo que había guardado.

## Ejemplo

Un tablero que recuerda las casillas pisadas:

```
Caja de variable:
  Variable de furni  [pisadas · permanente · tiene valor]

Pila A:
  Causante: Sobre un Furni            [las casillas]
  Efecto:   Cambiar valor de variable [pisadas · Suma · 1 · furni desencadenante]
```

## Notas

**Si el furni se recoge, su variable se va con él.** No es un dato de la sala: es del mueble.

**"Mientras la sala esté activa" no es "para siempre menos un poco".** Una sala se descarga en cuanto se
queda vacía un rato, así que ese modo es en la práctica "mientras haya gente".

---

# Variable de contexto

> Un dato temporal que vive solo durante la ejecución de la pila.
>
> Página: https://wired.hartico.tv/variables/variable-de-contexto/

Declara una variable **temporal**: vive solo mientras la pila se está ejecutando y desaparece al
terminar.

## Cómo funciona

Es el bloc de notas del sistema. Sirve para guardar un cálculo intermedio —una suma a medias, un valor
que hay que comparar dos veces— sin ensuciar los datos de la sala ni de los jugadores.

Como no se guarda en ningún sitio, es la más barata de todas y la que puedes usar sin pensártelo.

Una cosa importante sobre su alcance: cuando una pila llama a otra con
[Ejecuta Pilas](/efectos/ejecuta-pilas/), la llamada corre **dentro de la misma ejecución** y ve las
mismas variables de contexto. Con las señales no: allí cada pila trae las suyas.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/variable-de-contexto.png" alt="Ventana de configuración de Variable de contexto" class="ventana-wired" />
<!-- /ventana -->

**Nombre de la variable**, cómo se llama.

**Opciones de la variable**, con **Tiene valor**.

## Ejemplo

Calcular un premio antes de darlo:

```
Caja de variable:
  Variable de contexto  [premio · tiene valor]

Pila A:
  Causante: Sobre un Furni            [la meta]
  Efecto:   Cambiar valor de variable [premio · Asignar · 100]
  Efecto:   Cambiar valor de variable [premio · Multiplicación · variable racha]
  Efecto:   Cambiar valor de variable [puntos · Suma · variable premio]
```

## Notas

**No tiene opciones de disponibilidad porque no dura**, y esa es toda su gracia: nada que limpiar, nada
que se quede colgado entre partidas.

**Es la que hay que usar para los cálculos.** Guardar un valor intermedio en una variable permanente
funciona, pero deja basura y cuesta más.

---

# Variable global

> Un dato de la sala, o del hotel, compartido por todos.
>
> Página: https://wired.hartico.tv/variables/variable-global/

Declara una variable **compartida**: no pertenece a nadie en concreto, la ven todos.

## Cómo funciona

Es el dato común de la sala: el marcador general, la ronda en la que va la partida, el estado del
juego, cuánta gente lleva ganado hoy.

Con la opción compartida entre salas se convierte en un dato **del hotel**: un contador que suma lo que
hagan todas tus salas a la vez, un evento global, un jackpot común.

Trae además algo que las otras cajas no tienen: la **inspección**, para ver el valor actual sin montar
una pila que lo enseñe.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/variable-global.png" alt="Ventana de configuración de Variable global" class="ventana-wired" />
<!-- /ventana -->

**Nombre de la variable**, cómo se llama.

**Opciones de disponibilidad**, con tres duraciones:

| Duración | El dato vive |
| --- | --- |
| **Mientras la sala esté activa** | Se pierde al descargarse la sala |
| **Permanente** | Se conserva en esta sala |
| **Permanente, compartida entre salas** | Es un dato del hotel entero |

**Inspección de la variable**, para consultar su valor actual.

## Ejemplo

Un marcador de la sala que todos ven:

```
Caja de variable:
  Variable global  [ronda · permanente]

Pila A:
  Causante: Comienza el juego
  Efecto:   Cambiar valor de variable [ronda · Suma · 1]
  Efecto:   Mensaje                   ["Empieza la ronda ronda_txt"]
```

## Notas

**"Compartida entre salas" hay que pensarla dos veces.** Ese dato lo tocan todas las salas que lo
declaren, incluidas las que monte otra persona con el mismo nombre. Para algo tuyo, ponle un nombre que
no vaya a repetir nadie.

**La inspección es tu amiga al depurar.** Antes de montar mensajes para ver qué está pasando, mira el
valor directamente aquí.

---

# Variable heredada

> Trae a esta sala una variable que vive en otra.
>
> Página: https://wired.hartico.tv/variables/variable-heredada/

Trae a esta sala una variable que vive en **otra sala**, para poder leerla aquí.

## Cómo funciona

Es la pieza que conecta salas entre sí. Con ella, un hotel repartido en varias salas puede compartir
estado: el progreso de una gincana, el marcador de un torneo, la fase de un evento que se juega en
varios sitios.

La variable original sigue viviendo donde estaba; aquí se le pone un **nombre local**, que es el que
usarás en tus pilas. No es una copia: es la misma variable vista desde aquí.

Dos límites que hay que saber antes de montar nada:

**Solo tus salas.** El desplegable trae las salas de las que eres dueño. No se puede enganchar con la
sala de otra persona.

**Y solo variables compartidas de verdad.** En la sala de origen, la variable tiene que estar puesta
como **Permanente, compartida entre salas**. Con "Permanente" a secas o con la temporal no aparece
siquiera en la lista, por mucho que exista.

Se puede traer en **solo lectura**, y en la mayoría de los casos es lo que quieres: la sala que manda
escribe, las demás leen.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/variable-heredada.png" alt="Ventana de configuración de Variable heredada" class="ventana-wired" />
<!-- /ventana -->

**Elegir sala**, de dónde viene la variable. Solo salen las tuyas.

**Variable compartida**, cuál de las de esa sala. Solo salen las que allí estén marcadas como
"Permanente, compartida entre salas".

**Nombre local de la variable**, cómo se va a llamar aquí.

**Solo lectura**, una casilla que impide que esta sala la modifique. **Viene marcada**, y déjala así
salvo que sepas lo que haces.

## Ejemplo

Una segunda sala que muestra el marcador de la principal:

```
Caja de variable:
  Variable heredada  [sala "Arena" · variable ganador · nombre local ganador · solo lectura]

Pila A:
  Causante: Click en Furni [el cartel]
  Efecto:   Mensaje        ["Va ganando ganador_txt" · solo el usuario]
```

## Notas

**Si quitas la caja de origen, aquí deja de llegar** y tus pilas se quedan sin dato, sin más aviso. El
enlace apunta a esa caja concreta, así que recogerla del suelo rompe la referencia — pero renombrar la
variable no, porque no va por el nombre.

**Marca "solo lectura" salvo que tengas un motivo muy claro.** Dos salas escribiendo el mismo dato a la
vez es la receta de un marcador que va a saltos.

---

# Echo

> Le pone nombre propio a una variable del sistema para poder tratarla como una tuya.
>
> Página: https://wired.hartico.tv/variables/echo/

Coge una variable **que tú no creaste** —de las que trae el sistema— y le pone un nombre propio en tu
sala, para poder usarla donde solo se admiten variables tuyas.

## Cómo funciona

Las variables del sistema, las que empiezan por arroba como `@effect` o `@puntos`, existen siempre y
se pueden leer sin declarar nada. Pero hay sitios que **solo aceptan variables creadas por ti**: los
complementos que se apilan encima de una caja, como el
[Conector de texto](/complementos/conector-de-texto/), no saben ponerse sobre una del sistema.

Esta caja resuelve eso. La envuelves, le das un nombre, y a partir de ahí se comporta como si la
hubieras creado tú: puedes apilarle complementos y usarla donde antes no entraba.

**No es una copia.** Es la misma variable con dos nombres. No guarda ningún valor propio: cuando la
lees, te devuelve el de la envuelta; cuando escribes en ella, escribes en la envuelta. Si esperabas
una foto congelada o un espejo de una variable tuya, esta pieza no hace eso.

## Configuración

<!-- ventana -->
<img src="/wireds/ventanas/echo.png" alt="Ventana de configuración de Echo" class="ventana-wired" />
<!-- /ventana -->

**Nombre de la variable**, cómo se va a llamar en tu sala.

**Escoge una variable**, cuál envuelve. Aquí solo salen las del sistema; las tuyas no, porque no lo
necesitan.

No tiene opciones de disponibilidad: hereda el ámbito de la variable que envuelve.

## Ejemplo

Enseñar el efecto que lleva puesto un avatar con palabras en vez de con su número. La variable del
sistema `@effect` no admite complementos, así que primero la envuelves:

```
Caja de variable:
  Echo  [efecto_avatar ← @effect]
```

Ahora ya puedes apilarle encima un [Conector de texto](/complementos/conector-de-texto/) con la tabla
de nombres, y en la pila:

```
Pila A:
  Causante:    Click en Furni                   [el espejo]
  Complemento: Marcador de posición de variable [efecto_avatar · efecto_txt]
  Efecto:      Mensaje                          ["Llevas el efecto efecto_txt" · solo el usuario]
```

## Notas

**Escribir en el eco escribe en el original.** No hay copia que se quede aparte: son el mismo dato. Con
las variables del sistema que se pueden escribir, eso es justo lo que quieres.

**Si lo que buscas es sacar un dato privado a un sitio público**, esto no lo hace. Para eso lee la
variable de usuario y escribe su valor en una global con
[Cambiar valor de variable](/efectos/cambiar-valor-de-variable/).

---

# Todos los wireds

> El listado completo de furnis wired del hotel, agrupados por familia.
>
> Página: https://wired.hartico.tv/referencia/todos-los-wireds/

Este es el catálogo completo, con el nombre tal y como aparece en el furni. Los que ya tienen ficha
están enlazados desde el menú de la izquierda; el resto se irá documentando.

Los nombres van sin el prefijo "Causante WIRED:", "Efecto WIRED:" y demás, que en el hotel verás
delante de cada uno.

:::note[Si no encuentras uno]
Puede que ese wired no esté disponible en el hotel todavía, o que el furni exista pero sin el
comportamiento activado. Eso último no se ve desde dentro de la sala: pregunta al staff.
:::

## Causantes

- ¡Ya!
- Ausencia Negativa
- Ausencia Positiva
- Bot alcanza furni
- Bot alcanza usuario
- Cambiar estado de Furni
- Cambio de variable
- Click en Baldosa
- Click en Furni
- Colisión
- Contador Alcanza el Tiempo Establecido
- Entra en colisión con Usuario
- Estado de los Furnis Cambia
- Furni es Usado
- Periodos
- Periodos Cortos
- Periodos Largos
- Puntos Conseguidos
- Recibir Señal
- Salida
- Sobre un Furni
- Usuario AFK
- Usuario AFK Dormido
- Usuario Da Click a Usuario
- Usuario entra en colisión
- Usuario Realiza Acción
- Vete

## Condiciones

- Aforo Coincide
- Altitud de Furni Coincide
- Cantidad
- Causante está Sobre el Furni
- Condición Negativa WIRED: Aforo NO Coincide
- Condición Negativa WIRED: Causante NO está Sobre el Furni
- Condición Negativa WIRED: Furni NO Coincide
- Condición Negativa WIRED: Furnis SIN Usuarios
- Condición Negativa WIRED: NO es Miembro del Equipo
- Condición Negativa WIRED: NO es Miembro del Grupo
- Condición Negativa WIRED: NO tiene un Furni encima
- Condición Negativa WIRED: Posición o Estado NO Coincide
- Condición Negativa WIRED: Usuario NO está Realizando Acción
- Condición Negativa WIRED: Usuario NO Lleva la Placa
- Condición Negativa WIRED: Usuario NO tiene Efecto
- Condición Negativa WIRED: Usuario NO tiene item de mano
- Contiene variable
- Contiene variable (Negativo)
- Dirección del Usuario
- Edad de variable
- Fecha
- Fecha y Hora
- Furni Coincide
- Furni encima
- Furnis con Usuarios
- Hora
- Miembro del Equipo
- Miembro del Grupo
- Posición o Estado Coincide
- Usuario está Realizando Acción
- Usuario Lleva la Placa
- Usuario tiene Efecto
- Usuario tiene item de mano
- Valor de variable

## Efectos

- ¡Adiós!
- A cero
- Abandonar Equipo
- Bot cambia ropa
- Bot habla o susurra a usuario
- Bot mover a furni
- Bot Sigue a Usuario
- Bot sigue usuario
- Cambiar Altitud de Furni
- Cambiar dirección de Furni
- Caza
- Colisión de Equipo
- Congelar
- Control de Contador
- Dar Item de mano
- Dar puntos
- Dar variable
- Descongelar
- Efecto Negativo WIRED: Ejecuta Pilas
- Efecto Negativo WIRED: Enviar Señal
- Efecto Negativo WIRED: Escribir en Registro
- Ejecuta Pilas
- Eliminar variable
- Enviar Señal
- Escribir en Registro
- Expulsar Usuario
- Fuga
- Mensaje
- Mensaje de Bot
- Mover
- Mover Furni a Furni
- Mover Furni a Usuario
- Mover Usuario a Furni
- Mover y Rotar Usuario
- Mutar
- Mutar Aleatorio
- Mutar Inverso
- Mutear usuario
- Reset
- SuperWired
- Teletransportar a Sala
- Teletransportar Bot a Furni
- Unirse al Equipo
- Wired Eventos

## Selectores

- Furnis con variable
- Furnis desde Señal
- Furnis por Altitud
- Furnis Seleccionados
- Furnis sobre Fruni
- Furnis Vecinos
- Selección Remota
- Usuarios con Objeto de Mano
- Usuarios con variable
- Usuarios desde Señal
- Usuarios en Área
- Usuarios en Equipo
- Usuarios en Grupo
- Usuarios por Acción
- Usuarios por Nombre
- Usuarios por Tipo
- Usuarios sobre Furni
- Usuarios Vecinos

## Complementos

- Cancelar Animación de Movimiento
- Complemento de Texto WIRED: Identificar Nombres
- Complemento de Texto WIRED: Identificar Nombres de Furni
- Conector de texto
- Curva de Movimiento
- Efecto aleatorio
- Ejecutar en Orden
- Filtro WIRED: Filtrar a X Furnis
- Filtro WIRED: Filtrar a X Usuarios
- Límite de Ejecución
- Lógica de Condición
- Movimientos Físicos
- Tiempo de Animación
- Transportar Usuario
- Wired extra: Capturador de variables
- Wired extra: Furni con variable más alta/baja
- Wired extra: Marcador de posición de variable
- Wired extra: Usuario con variable más alta/baja

## Variables

- Echo
- Variable de contexto
- Variable de furni
- Variable de usuario
- Variable global
- Variable heredada

---
