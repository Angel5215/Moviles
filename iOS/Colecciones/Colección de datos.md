
# Colección de datos

En **Swift** existen 4 tipos de colecciones de datos y en este manual se explicará cada uno de ellos con diferentes ejemplos. 

Las colecciones son de gran utilidad cuando se desea almacenar un arreglo de valores: 

* Arreglos
* Diccionarios
* Conjuntos
* Tuplas

Entonces podemos decir que, las colecciones de datos en **Swift** nos permiten agrupar  datos u objetos de una manera particular, ya sea como una lista de elementos únicos o repetidos, o sencillamente una lista de conjuntos

![Colecciones de datos en Swift](colecciones.jpg)

##Arrays (Arreglos)

En **Swift** también podemos hacer uso de los areglos y podemos definirlos como un un conjunto de datos de un mismo tipo ordenados de forma lineal. 
Los componentes de un array se han de referenciar por medio del nombre del array y un índice de desplazamiento para indicar el componente deseado.
La forma de declarar nuestro arreglo se hace de la siguientes formas:

```swift
let pais: Array = ["México", "Colombia", "Perú"]
 
let nombres: [String] = ["Jordy", "Luis", "Alejandro"]

```
Podemos notar que en ambos casos estamos declarando un Array de cadenas, "país" y "nombres" representan una constante por la cual es nombrada cada uno de nuestros arreglos

##Creación de un Array vacío
**Swift** nos permite crear arreglos vacíos de un tipo de dato en específico haciendo uso de la siguiente sintaxys

```swift
var miArreglo = [Int]()
 
print("miArreglo es de tipo [Int] y cuenta con \(miArreglo.count) elementos.")

```
Y obtendremos la siguiente salida:
![Colecciones de datos en Swift](ejemplo1.jpg)

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
![Colecciones de datos en Swift](ejemplo2.jpg)

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


