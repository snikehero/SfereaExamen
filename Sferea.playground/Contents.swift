/*
 Playground creado como parte del proceso de reclutamiento de Sferea.
 Moises Sanchez Lopez 30/05/2024
 */
import UIKit

/*
 Defina los siguientes conceptos, datos importantes e incluye un ejemplo de codigo que muestre su funcionalidad
 */


// Inicializador
// Definicion:  Es un metodo especial que se utiliza para crear una instancia de una clase, estructura o enumeracion. Inicializa todos los valores de las propiedades de la instancia


// Datos importantes: Pueden tener parametros para personalizar la inicializacion de una instancia, se pueden adjuntar metodos o acciones al inicializador para realizarse cuando se inicialice un objeto de la clase.

class Persona {
    var nombre: String
    var edad: Int
    var trabajo: String
    init(nombre: String, edad: Int) { //Inicializador con parametros, todas las "Personas" seran Desarrolladores debido a que esto no esta como parametro, sino definido dentro del inicializador.
        self.nombre = nombre
        self.edad = edad
        trabajo = "Desarrollador"
        print("Hola \(nombre) eres un \(trabajo)")
    }
}
let persona1 = Persona(nombre: "Juan", edad: 38)

//Funcion
// Definicion: Es un bloque de codigo que realiza una tarea especifica cuando es llamada o invocada. Puede aceptar parametros y devolver un valor opcional.
// Datos importantes: Pueden ser metodos de instancia, de clase o funciones globales. Retornan distintos tipos de valores como strings, Ints, floats, hasta objetos tambien.
// Ejemplo de funcion que acepta como parametros Int y retorna Int
func suma(a: Int, b: Int) -> Int {
    return a + b
}
let resultado = suma(a: 5, b: 5)
print(resultado)

// Ejemplo de funcion aceptando String y retornando Bool

func comparacion(palabra1: String, palabra2: String ) -> Bool {
    if palabra1 == palabra2 {
        return true
    } else {
        return false
    }
}
print(comparacion(palabra1: "Hola", palabra2: "Mundo"))

// Clase base y subclase
// Definicion: Una clase base es una clase que sirve como modelo para otras clases, mientras que una subclase es una que hereda propiedades y metodos de otra clase.

// Datos importantes: Las subclases pueden agregar sus propias propiedades y metodos, asi como sobreescribir los metodos de la clase base.
// Las clases se consideran como tipo de Referencia, debido a que esta comparte una copia entre sus instancias, si crearamos dos esqueletos desde la misma instancia, el segundo seria una copia del primero.

// Para este ejemplo usare una Clase base "Enemigo" con tres metodos principales y dos propiedades, vida y fuerza
class Enemigo {
    var vida: Int
    var fuerza: Int
    
    init(vida: Int, fuerza: Int) {
        self.vida = vida
        self.fuerza = fuerza
        print("Creacion de nuevo Enemigo...")
    }
    func moverse() {
        print("Camina hacia adelante")
    }
    
    func atacar() {
        print("El enemigo golpea con \(fuerza) puntos de fuerza")
    }
    
    func recibeGolpe(cantidad: Int) {
        print("Lo golpean")
        vida = vida - cantidad
    }
}

// Como subclase se agregara un enemigo Tipo Dragon que sobreescribira los metodos para moverse y atacar, asi como cambiar sus parametros de vida y fuerza porque es mas fuerte que otros enemigos
class Dragon: Enemigo {
    func hablar(texto: String ) {
        print("Dice: \(texto)")
    }
    
    override func moverse() {
        print("Vuela hacia adelante")
    }
    
    override func atacar() {
        super.atacar() // <- Ejemplo de que se puede reutilizar el metodo de la clase base.
        print("Escupe Fuego haciendo \(fuerza) puntos de fuerza") // <- Tambien se puede reescribir lo que hace la clase base, para este caso, el enemigo hara ambas acciones.
    }
}

// Ahora crearemos dos objetos, un enemigo simple y un dragon para demostrar el uso de clases y subclases
let esqueleto = Enemigo(vida: 50, fuerza: 5)
esqueleto.moverse()
esqueleto.recibeGolpe(cantidad: 30)
print("La vida actual es de \(esqueleto.vida)")

let dragon = Dragon(vida: 100, fuerza: 15)
dragon.hablar(texto: "Soy un dragon")
dragon.atacar()
dragon.moverse()



// Sentencia Do - Catch
// Definicion: Se utiliza para manejar correctamente los errores en Swift. Do contiene el codigo que puede lanzar errores y catch maneja los errores lanzados
// Datos importantes: Puede haber multiples bloques catch para manejar distintos tipos de erroes. El uso de try se uta para llamar a una funcion que puede lanzar un error

enum MiError: Error { // <- Se pueden usar enums para definir los tipos de errores que tendra la aplicacion
    case errorPersonalizado
}

func funcionQueLanzaError() throws {
    throw MiError.errorPersonalizado
}

do {
    try  funcionQueLanzaError()
} catch {
    print("Se produjo un error: \(error)")
}


// Protocolo
// Definicion: Los protocolos definen un conjunto de metodos y propiedades que una clase, estructura o enumeracion puede implementar para cumplir con los requisitos del protocolo.
// Datos importantes: Los protocolos proporcionan una forma de definir interfaces en Swift, permitiendo que distintos tipos de clases o estructuras compartan un tipo en comun aun cuando no haya una relacion de herencia.

// Para este ejemplo utilizare un protocolo llamado "Puede volar", de esta manera podre utilizar el protocolo tanto para vehiculos aeros, como para animales voladores.

protocol PuedeVolar {
    func volar()
}

protocol Vehiculo {
    var llantas: Int {get}
    var combustible: String {get}
}
class Avion: PuedeVolar, Vehiculo {
    func volar() {
        print("El avion esta volando")
    }
    var llantas: Int = 2
    var combustible: String = "Combustible de avion"
}
class Ave {
    var esHembra = true
    func ponerHuevo() {
        if esHembra {
            print("El ave es hembra")
        } else {
            print("El ave es macho")
        }
    }
}
class Aguila: Ave,PuedeVolar {
    func volar() {
        print("El aguila esta volando")
    }
}

let nuevaAguila = Aguila()
nuevaAguila.volar()
nuevaAguila.esHembra = false
nuevaAguila.ponerHuevo()

let nuevoAvion = Avion()
nuevoAvion.volar()

//Delegado
// Definicion: El delegado es un patron de diseno en el que un objeto delega la responsabilidad de implementar ciertas funcionalidades a otro objeto.
// Datos importantes: Se utilizada en IOS para manejar eventos y acciones de los controles de interfaz de usuario.

protocol MiDelegado {
    func realizarTarea()
}

class ClaseDelegadora {
    var delegado: MiDelegado?
    
    func ejecutarTarea(){
        delegado?.realizarTarea()
    }
}

class ClaseDelegada: MiDelegado {
    func realizarTarea() {
        print("Tarea realizada por el delegado.")
    }
}

let delegado = ClaseDelegada()
let delegadora = ClaseDelegadora()
delegadora.delegado = delegado
delegadora.ejecutarTarea()


// Closure
// Definicion: Un closure es una funcion anonima que puede caputrar y almacenar referencias a variables y constantes.
// Datos importantes: Los closures pueden ser asignados a variables, pasados como parametros o de funciones o metodos y devueltos como resultados de funciones.

let miClosure = { //<- Tambien puede ser utilizado como manera distinta para escribir funciones a variables ya propuestas.
    print("Este es un closure")
}
miClosure()

//Como ejemplo adicional usare un closure para filtrar nombres dentro de un Array.

let desarrolladores = ["Carlos", "Juan", "Moises", "Jorge", "Javier"]
let ordenAlfabetico = desarrolladores.sorted() // <- .sorted() nos puede servir para ordenar el array automaticamente
print(ordenAlfabetico)

// Pero que tal, que en el equipo de desarrolladores, siempre tuviera que ir uno primero?
func juniorPrimero(nombre1: String, nombre2: String) -> Bool {
    if nombre1 == "Moises" {
        return true
    } else if nombre2 == "Moises" {
        return false
    }
    return nombre1 < nombre2
}

let juniorEquipo = desarrolladores.sorted(by: juniorPrimero)
print(juniorEquipo)
