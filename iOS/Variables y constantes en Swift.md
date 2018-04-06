# Variables y constantes en Swift

## Introudcción 
En este manual se dará a conocer los **aspectos fundamentales** del lenguaje de progrmación _Swift_, como la declaración de variables y el tipo de datos.

### Playgrounds
Los 'playground' son pequeños archivos y espacios de trabajo en donde yo puedo escribir pruebas de concepto para nuestro proyecto. Dentro de estos 'playground' yo puedo agregar archivos puedo agregar cualquier tipo de información y después utilizarlo como prueba de concepto para nuestro lenguaje.


### Declaración de variables y constantes

Como su nombre lo dice una variable será aquella que su valor pueda ser alterado a lo largo de nuestro código, es decir que pueda cambiar:
  
```swift
var SiCambio = "Hola, Proteco" 
```
En cambio, si declaramos nuestra variable como **let** haremos que su valor permanezaca "constante" y de esta forma no pueda sufrir ningún tipo de alteración, la forma de declarción es la siguiente: 

```swift
let NoCambio = "Hi, Rob"
```

### Tipos de datos

En _Swift_, al igual que en otros lenguajes existen los datos de tipo Int, Float, String y booleanos, a continuación se explicará la forma de declarar cada uno

#### Int / Enteros
Los enteros serán los tipos de datos NO decimales que pueden ser utilizados en Swift y la forma de declarlos es la siguiente
```swift
var entero = 8
```
Así como en otros lenguajes, en swift también se pueden realizar operaciones dentro de la declaracionde nuestra variable 
```swift
var dato1 = 50

let dato2 = 60

dato1 = 100 * 50
```

#### Float Y Double
_Swfit_ al momento de detectar una variable con punto decimal la convierte en una variable de tipo Flotante, sin necesidad de espeficiarlo nosotros mismos como se muestra a continuacion:
```swift
var  = 8.9
```

Si queremos utilizar una variable de tipo Double en lugar de Float la forma de declararlo es de la siguiente forma:

```swift
var a: Double = 8.73
```
La diferencia radica en el número de decimales que maneja cada uno. Si hablamos de exactitud, un Double manejará mas decimales que un flotante, si desea compronbarlo, compile la siguiente linea de código y vea el resultado:
```swift
var longitude: Float
longitude = -86.783333
longitude = -186.783333
longitude = -1286.783333
longitude = -12386.783333
longitude = -123486.783333

var longitude1: Double
longitude1 = -86.783333
longitude1 = -186.783333
longitude1 = -1286.783333
longitude1 = -12386.783333
longitude1 = -123486.783333
```

#### String 
```swift
let cadena = "Aprendiendo swift!"
```


#### Booleanos
```swift
let AprendoSwift = true
```

_Swift_ nos permite hacer uso de estas variables de una forma muy sencilla gracias a que el lenguaje fue hecho para personas que inican en la progrmación.
Ahora se mostrará un pequeño ejemplo dónde se hace uso de las variables vistas y ademas de un *print* para mostrar nuestros datos en pantalla

```swift
let nombre = "Jordy"
let apellido = "Pazaran"
var edad = 21
var estatura = 1.68

print("Mi nombre es \(nombre), mi apellido \(Pazaran) y tengo \(edad) años de edad, también mido \(estatura)")

```

Ahora que se han abarcado estos temas y además se ejemplificó la forma en como imprimir nuestros datos en pantalla con el uso de *print*, realice el siguiente ejercicio:

Imprimir en una sola linea de pantalla su IMG


#### Respuesta 
```swift
var peso = 54
let edad = 21
let nombre = "Jordy Xavier"
let altura = 1.89

print("Hola "+nombre+" tu IMC es de: \(Double(peso) * altura)")
```