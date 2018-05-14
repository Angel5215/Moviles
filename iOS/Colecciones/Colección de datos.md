
# Colección de datos

En **Swift** existen 4 tipos de colecciones de datos y en este manual se explicará cada uno de ellos con diferentes ejemplos. 

Las colecciones son de gran utilidad cuando se desea almacenar un arreglo de valores: 

*Arreglos
*Diccionarios
*Conjuntos
*Tuplas

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