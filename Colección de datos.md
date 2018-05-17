
# Colección de datos

En **Swift** existen 4 tipos de colecciones de datos y en este manual se explicará cada uno de ellos con diferentes ejemplos. 

Las colecciones son de gran utilidad cuando se desea almacenar un arreglo de valores: 

* Arreglos
* Diccionarios
* Conjuntos
* Tuplas

Entonces podemos decir que, las colecciones de datos en **Swift** nos permiten agrupar  datos u objetos de una manera particular, ya sea como una lista de elementos únicos o repetidos, o sencillamente una lista de conjuntos

![Colecciones de datos en Swift](colecciones.png)

##Arreglos (Arrays)

En **Swift** también podemos hacer uso de los areglos y podemos definirlos como un un conjunto de datos de un mismo tipo ordenados de forma lineal. 
Los componentes de un array se han de referenciar por medio del nombre del array y un índice de desplazamiento para indicar el componente deseado.
La forma de declarar nuestro arreglo se hace de la siguientes formas:

```swift
let pais: Array = ["México", "Colombia", "Perú"]
 
let nombres: [String] = ["Jordy", "Luis", "Alejandro"]

```
Podemos notar que en ambos casos estamos declarando un Array de cadenas, "país" y "nombres" representan una constante por la cual es nombrada cada uno de nuestros arreglos

## Creación de un Array vacío
**Swift** nos permite crear arreglos vacíos de un tipo de dato en específico haciendo uso de la siguiente sintaxys

```swift
var miArreglo = [Int]()
 
print("miArreglo es de tipo [Int] y cuenta con \(miArreglo.count) elementos.")

```
Y obtendremos la siguiente salida:
![Colecciones de datos en Swift](ejemplo1.png)

También podríamos declar a nuestro arreglo vacío de las siguientes formas:

```swift
var arrayVacio: Array<String>
 
var arregloVacio: [String]

```

## Creación de un Arreglo con valores por defecto

Los Arrays en **Swift** también proporcionan un inicializador para la creación de una matriz de cierto tamaño. A este inicializador se le pasa el número de elementos que se añade al nuevo arreglo (llamado count) y un valor por defecto del tipo de dato apropiado (llamado repeatedValue):

```swift
var cincoDoubles = [Double](repeating: 1.0, count: 5)

print("el arreglo es de tipo [Double] y sus valores son: \(tresDoubles)")


```
Y obetenemos la salida siguiente: 

![Colecciones de datos en Swift](ejemplo2.png)

También **Swift** infiere el tipo de dato que estamos manejando sin necesidad de hacer ninguna referencia 

```swift    
var  nombres = ["Jordy Xevier"]

```

## Acceder y modificar los datos de un Array
Acontinuación se mostrará la forma en cómo se puede agregar elementos a un arreglo gracias a la función append

```swift    
var lista: Array<String>
 
var nombresLista = ["Jordy Xavier"]
 
nombresLista.append("Juan Perez")
nombresLista.append("Angel Rodriguez")
nombresLista.append("Cristian Cadenas")
```
 De esta forma estaremos agregando nuevos elementos a nuestro arreglo y a continución vamos a acceder los elementos de nuestro arreglo "nombresLista" y comprobar los cambios hechos
```swift    
for _ in nombresLista {
    
    print("Elementos de mi arreglo: \(nombresLista)")
    
}

```
y nuestra salida en pantalla:

![Colecciones de datos en Swift](ejemplo3.png)

Ahora vamos a eliminar 2 de los 3 elementos argregados de la siguiente forma
```swift    
var lista: Array<String>
  
nombresLista.remove(at: 1)
nombresLista.remove(at: 2)

```

Y la salida en nuestra consola cuando mandamos a imprimir será la siguiente:

![Colecciones de datos en Swift](ejemplo4.png)

En nuestros ejemplos anteriores hemos logrado trabajar con los arreglos, así como agregar y eliminar datos del mismo, que son los métodos mas usados en **Swift** 

## Conjuntos (Set)

Un conjunto o set nos permite almacenar diferentes valores de un mismo tipo sin ningún tipo de orden definido, cada uno de estos elementos es irrepetible en el conjunto, es decir, no puede aparecer mas de una vez.
Los conjuntos son usados en vez de un arreglo cuando el orden de nuestros elementos no es importante y además se quiere que cada uno de estos sea único dentro de nuestro conjunto, es decir, que no queramos que se repita.

## Creado e inicializando un conjunto

A continución vamos a crear un conjunto vacío y vamos a imprimir el número de elementos con el que cuenta

```swift    
var conjunto = Set<String>()
 
print("El conjunto cuenta con \(conjunto.count) elementos.")

```

Y el resultado en pantalla sería:

![Colecciones de datos en Swift](ejemplo5.png)


## Creando un conjunto a partir de una arreglo

**Swift** nos permite crear un conjunto de una manera muy fácil así como lo es crear un arreglo. Solo es necesario declar un arreglo con elementos, especificando que será del tipo Set. En el siguiente ejemplo vemo la forma correcta de declarar nuestro conjunto:

```swift    
let ingredientes: Set = ["ajo", "queso", "jitomate", "sal"]

```

En la variable "ingredientes" estamos almecenando los elementos necesarios para una receta de cocina, en este caso se usa un conjunto pues en una lista de ingredientes no es posible que exista alguno repetido y si recordamos anteriormente se mencionó que en un conjunto solo existirán elementos que no podrán repetirse. 

Ahora vamos a interactuar con nuestro conjunto:

```swift    
var ingredientes: Set = ["ajo", "queso", "jitomate", "sal"]
if ingredientes.contains("queso") {
    print("No me gusta el queso.")
}
```

![Colecciones de datos en Swift](ejemplo6.png)

De esta forma queda explicado cómo podemos declarar un conjunto apartir de un array con elementos que no se pueden repetir y además pudimos acceder a los elementos de el conjunto usando el método .count.

## Modificando un conjunto

Como vimo en el ejemplo anterior, se puede accerde a los elementos de nuestro conjunto, pues bien, al igual que en un arreglo también podremos  modificar nuestro conjunto a través de métodos y propiedades.
Podremos agregar un nuevo elemento a nuestro conjunto haciendo uso del método .insert:

```swift    

 ingredientes.insert("pimienta") 
```

Ahora que hemos agregado un nuevo elemento a nuestro conjunto, vamos a eliminar el elemento "ajo" de nuestro conjunto haciendo uso del método .remove y vamos a comprobar que haya sido eliminado

```swift    
if let eliminarIngrediente = ingredientes.remove("ajo") {
 
print("El género \(eliminarIngrediente) ha sido eliminado.")
 
}
```

Y la salida en pantalla seria la siguiente:

![Colecciones de datos en Swift](ejemplo7.png)

Si quisieramos elimianr todos los elementos de nuestro conjutno solo hae falta hacer uso del método .removeAll como se muestra a continuación:

```swift    

 ingredientes.removeAll()
```

## Uniones 

Al hablar de conjuntos se debe intuir que tambien existen operaciones que se pueden realizar con cada uno de ellos y las uniones es una de esas operaciones que **Swift** nos permite realizar con los conjuntos. En el siguiente ejemplo se demostrará cómo se pueden realizar uniones entre conjuntos.

En una clase se hicieron dos equipos, cada uno de ellos debía traer diferentes materiales para realizar en conjunto un mismo trabajo en el salón.
Equipo A:
- Pegamento
- Tijeras
- Plumones

Equipo B:
- Cartulina
- Cutter
- Regla

Se necesita comprobar que cada uno de los equipos haya trído los materiales que les correspondía y además crear una lista de todos los materiales disponibles.

Como podemos leer en el enunciado anterior este ejercicio puede resolverse facilmente haciendo uso de los conjuntos de la siguiente forma:

```swift    

 var  equipoA: Set = ["Tijeras", "Plumones"]
var  equipoB: Set = ["Cartulina", "Cutter", "Regla"]
var flag = 0
for material in equipoA {
    
    print(material)
    
}

print("\n¿El equipo A tiene todos los materiales?\n")

if equipoA.contains("Pegamento")  {
    flag = flag + 1
    
} else {
    
    print("El equipo A no tiene pegamento")
}

if equipoA.contains("Tijeras")  {
    flag = flag + 1
    
}
else  {
    
     print("El equipo A no tiene Tijeras")
    
}

if equipoA.contains("Plumones")  {
    flag = flag + 1
    
}
else  {
    
    print("El equipo A no tiene Plumones")
    
}

if flag == 3 {
    print("Equipo A tiene todos sus materiales")
}

flag = 0

print("\n¿El equipo B tiene todos los materiales?\n")

if equipoB.contains("Cartulina")  {
    flag = flag + 1
    
} else {
    
    print("El equipo B no tiene pegamento")
}

if equipoB.contains("Cutter")  {
    flag = flag + 1
    
}
else  {
    
    print("El equipo B no tiene Regla")
    
}

if equipoB.contains("Regla")  {
    flag = flag + 1
    
}
else  {
    
    print("El equipo B no tiene Regla")
    
}

if flag == 3 {
    print("Equipo B tiene todos sus materiales")
}
```

Hasta esta parte hemos creado nuestros dos conjuntos, Equipo A y Equipo B, cada uno con sus respectivos matariales y se comprueba que cada uno de estos cuente con los elementos o materiales que se pidió en el ejercicio, es por esta razón que en el equipo A no se agregó el pegamento.

Lo último que nos falta hacer es crear nuestra lista de todos los materiales con los que se cuenta, por lo que se hará una unión entre los dos conjuntos de la siguiente forma:

```swift    

for lista in listaMateriales {
    
    print("La lista de los materiales disponibles de todo el grupo es la siquiente: \n \(lista)")
    
}```

Y la salida de nuestra pantalla debería ser la siguiente:

![Colecciones de datos en Swift](ejemplo7.png)

De esta forma queda resuelto el ejercicio y se comprende el uso de la union entre conjuntos.